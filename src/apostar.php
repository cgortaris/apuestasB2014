<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
require('apuesta.php');

$a = new Apuesta();

function disclaimer() {
    if(isset($_POST) && isset($_POST['usuario_id']) && isset($_POST['duelo'])) {
        return '';
    }
    else {
        return '<div class="alert alert-success"><strong>¿No tienes un duelo?</strong> <a href="crear.php">Crea un duelo</a> y podrás apostar.</div>';
    }
}

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Apuestas</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap theme -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="css/theme.css" rel="stylesheet" />

    <link href="css/apuestas.css" rel="stylesheet" />

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body role="document">
    <?php
        if(isset($_POST)) {
            print_r($_POST);
        }
    ?>

    <!-- Fixed navbar -->
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">Polla BVC</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="crear.php">Crear</a></li>
            <li class="active"><a href="#">Apostar</a></li>
            <li><a href="resultados.php">Resultados</a></li>
            <li><a href="reglas.php">Reglas</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container">
        <?php
        if(isset($_GET) && isset($_GET['k'])) {
            $usuario = $a->getUsuario($_GET['k']);
            if($usuario != null) {
                // email and key matches a user => display bets
                $duelos = $a->getDuelos($usuario['id']);
                
        ?>
        <form id="apostar">
            <div class="row">
                <div class="col-md-3">
                    <label for="duelo">Duelo</label>
                    <p>
                        Elige el duelo en el que quieres apostar.
                    </p>
                </div>
                <div class="col-md-9">
                    <input name="usuario_id" type="hidden" value="<?php echo $usuario['id']; ?>" />
                    <select name="duelo">
                        <?php
                        foreach($duelos as $d) {
                            ?>
                        <option value="<?php echo $d['id']; ?>"><?php echo $d['nombre']; ?></option>
                            <?php
                        }
                        ?>
                    </select>
                </div>
            </div>
            <p>
                <button form="apostar" formaction="apostar.php" formmethod="post" type="submit" class="btn btn-lg btn-default">Apostar</button>
            </p>
        </form>
        <?php
            }
            else {
                // disclaimer
                echo disclaimer();
            }
        }
        else {
            echo disclaimer();
        }
        ?>

        <?php
        if(isset($_POST) && isset($_POST['usuario_id']) && isset($_POST['duelo'])) { // display bets
            //$bets = $a->getBets($_POST['duelo'], $_POST['usuario_id']);
            $matches = $a->getMatches();
        ?>
        <form id="apuesta" name="apuesta" action="apostar.php">
            <input type="hidden" name="save" value="true" />
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Nº</th>
                            <th>Fecha</th>
                            <th>Marcador</th>
                            <th>Estadio (Ciudad)</th>
                        </tr>
                    </thead>
                    <tbody>
        <?php
            $npartido = 1;
            foreach($matches as $m) {
                $codes = $m['code'];
                $teams = explode('-', $codes, 2);
                ?>
                        <tr>
                            <td><?php echo $npartido++; ?></td>
                            <td><?php echo $m['match_date']; ?></td>
                            <td>
                                <table class="marcador">
                                    <tr>
                                        <td><img class="flag" src="img/<?php echo $teams[0]; ?>.png" alt="<?php echo $teams[0] ?>" /> <?php echo $m['team1']; ?></td>
                                        <td rowspan="2"><strong>V/S.</strong></td>
                                        <td><img class="flag" src="img/<?php echo $teams[1]; ?>.png" alt="<?php echo $teams[1] ?>" /> <?php echo $m['team2']; ?></td>
                                    </tr>
                                    <tr>
                                        <td><input min="0" size="2" type="number" name="t1[]" /></td>
                                        <td><input min="0" size="2" type="number" name="t2[]" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td><?php echo $m['stadium']; ?> (<?php echo $m['city']; ?>)</td>
                        </tr>
                <?php
            }
            ?>
                    </tbody>
                </table>
            </div>
            <p>
                <button form="apuesta" formaction="apostar.php" formmethod="post" type="submit" class="btn btn-lg btn-default">Apostar</button>
            </p>
        </form>
        <?php
        if(isset($_POST) && isset($_POST['save']) && $_POST['save'] == 'true') {
            
        }
    }
    ?>
    </div> <!-- /container -->



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/docs.min.js"></script>
  </body>
</html>

