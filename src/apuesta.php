<?php

require('../../dbconfig.php');

class Apuesta {
    private $conn;
    private $stmts = array();

    public function __construct() {
        $this->connect();
        $this->stmts = array(
            'create-duelo'  => $this->getConn()->prepare('insert into duelo(nombre) values (?)'),
            'get-user'      => $this->getConn()->prepare('select id, email from usuario where email = ?'),
            'insert-user'   => $this->getConn()->prepare('insert into usuario(email, akey) values (?, ?)'),
            'create-duelo-usuario' => $this->getConn()->prepare('insert into duelo_usuario(duelo_id, usuario_id) values (?, ?)'),
            'get-user-key'  => $this->getConn()->prepare('select * from usuario where akey = ?'),
            'duelos'        => $this->getConn()->prepare('select d.id, d.nombre from duelo d join duelo_usuario du on (d.id=du.duelo_id) where du.usuario_id = ?'),
            'bets'          => $this->getConn()->prepare('select a.id as id,a.duelo_usuario_id as duid,a.match_id as mid,a.team_id as tid,a.goles as goles from apuesta a join duelo_usuario du on (a.duelo_usuario_id=du.id) and du.duelo_id = ? and du.usuario_id = ?'),
            'matches'       => $this->getConn()->prepare('select m.id as mid,m.code as code, m.mdate as match_date, t1.name as team1, t2.name as team2, s.name as stadium, c.name as city from matches m join team t1 on (m.team_id1=t1.id) join team t2 on (m.team_id2=t2.id) join stadium s on (m.stadium_id=s.id) join city c on (s.city_id=c.id) order by match_date')
        );
    }

    public function __destruct() {
        $this->disconnect();
    }

    private function connect() {
        // POSTGRESQL: $this->conn = new PDO(sprintf('pgsql:dbname=%s;user=%s;password=%s;host=%s', DBNAME, DBUSER, DBPASS, DBHOST));
        $this->conn = new PDO(sprintf('mysql:host=%s;dbname=%s;charset=utf8', DBHOST, DBNAME), DBUSER, DBPASS);//MYSQL
    }

    private function disconnect() {
        $this->conn = null;
    }
    
    private function getConn() {
        return $this->conn;
    }

    private function getStmts() {
        return $this->stmts;
    }

    /**
      * Crea un duelo y asocia los usuarios a ella.
      * @return: array('duelo-id' => ID, 'error' => 'error msg')
      */
    public function saveDuelo($nombre, $emails) {
        $duelo = array('id' => null, 'error' => '');
        // crear instancia duelo
        $stmts = $this->getStmts();
        $stmt = $stmts['create-duelo'];
        if(!$stmt->execute(array($nombre))) {
            $duelo['error'] = $stmt->errorInfo();
        }
        else {
            $duelo_id = $this->getConn()->lastInsertId('duelo_id_seq');
            $usuarios = 0;
            $list = explode(',', $emails);
            foreach($list as $e) {
                $usuario = $this->saveUsuario($e);
                if($this->sendMail($e, $usuario['key'])) {
                    // crear instancia duelo_usuario
                    $usuario_id = $usuario['id'];
                    $duelo_usuario = $this->saveDueloUsuario($duelo_id, $usuario_id);
                    $usuarios++;
                }
            }
            $duelo = array('id' => $duelo_id, 'jugadores' => $usuarios);
        }
        return $duelo;
    }

    // @return: usuario.id 
    private function saveUsuario($email) {
        // check if email isn't already
        $stmts = $this->getStmts();
        $get = $stmts['get-user'];
        $usuario = null;
        if(!$get->execute(array($email))) {
            print_r($get->errorInfo());
        }
        else {
            $result = $get->fetchAll();
            if(count($result) == 0) { // crear
                // generate key
                $key = md5($email.rand());
                // insert
                $ins = $stmts['insert-user'];
                if(!$ins->execute(array($email, $key))) {
                    print_r($ins->errorInfo());
                }
                else {
                    $id = $this->getConn()->lastInsertId('usuario_id_seq');
                    $usuario = array(
                        'id'    => $id,
                        'email' => $email,
                        'key'   => $key
                    );
                }
            }
            else if(count($result) == 1){
                $usuario = array(
                    'id'    => $result[0]['id'],
                    'email' => $result[0]['email'],
                    'key'   => $key
                );
            }
        }
        return $usuario;
    }

    private function saveDueloUsuario($duelo_id, $usuario_id) {
        $duelo_usuario = null;
        $stmts = $this->getStmts();
        $stmt = $stmts['create-duelo-usuario'];
        if(!$stmt->execute(array($duelo_id, $usuario_id))) {
            print_r($stmt->errorInfo());
        }
        else {
            $id = $this->getConn()->lastInsertId('duelo_usuario_id_seq');
            $duelo_usuario = array(
                'id' => $id,
                'duelo_id' => $duelo_id,
                'usuario_id' => $usuario_id
            );
        }
        return $duelo_usuario;
    }
    // @return: boolean
    public function apostar($email, $apuestas) {
        // foreach apuesta:
            // insert into apuesta usuario_id, match_id, team_id, goles
    }

    public function sendMail($email) {
        // 
        return true;
    }

    public function cargarApuestas($email, $key) {
    }

    public function getUsuario($key) {
        $stmts = $this->getStmts();
        $stmt = $stmts['get-user-key'];
        if(!$stmt->execute(array($key))) {
            print_r($stmt->errorInfo());
        }
        else {
            $results = $stmt->fetchAll();
            if(count($results) > 0) {
                return array(
                    'id' => $results[0]['id'],
                    'email' => $results[0]['email'],
                    'key' => $results[0]['akey']
                );
            }
            else {
                return null;
            }
        }
    }

    public function getBets($duelo_id, $usuario_id) {
        $stmts = $this->getStmts();
        $get = $stmts['bets'];
        $bets = array();
        if(!$get->execute(array($duelo_id, $usuario_id))) {
            print_r($get->errorInfo());
        }
        else {
        }
    }

    public function getDuelos($usuario_id) {
        $stmts = $this->getStmts();
        $get = $stmts['duelos'];
        $duelos = array();
        if(!$get->execute(array($usuario_id))) {
            print_r($get->errorInfo());
        }
        else {
            $results = $get->fetchAll();
            foreach($results as $row) {
                $duelos[] = array('id' => $row['id'], 'nombre' => $row['nombre']);
            }
        }
        return $duelos;
    }

    public function getMatches() {
        $stmts = $this->getStmts();
        $get = $stmts['matches'];
        $ms = array();
        if(!$get->execute()) {
            print_r($get->errorInfo());
        }
        else {
            $results = $get->fetchAll();
            foreach($results as $row) {
                $ms[] = array(
                    'mid'           => $row['mid'],
                    'code'          => $row['code'],
                    'match_date'    => $row['match_date'],
                    'team1'         => $row['team1'],
                    'team2'         => $row['team2'],
                    'stadium'       => $row['stadium'],
                    'city'          => $row['city']
                );
            }
        }
        return $ms;
    }
}
?>
