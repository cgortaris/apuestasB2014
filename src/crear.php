<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
require('apuesta.php');
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

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
    <!-- Fixed navbar -->
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Ap</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">C</a></li>
            <li><a href="apostar.php">A</a></li>
            <li><a href="resultados.php">Res</a></li>
            <li><a href="reglas.php">Reg</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container">
        <form id="crear" action="crear.php">
            <div class="row">
                <div class="col-md-3">
                    <label for="nombre">Nombre</label>
                </div>
                <div class="col-md-9">
                    <input id="nombre" name="nombre" type="text" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <label for="participantes">Participantes</label>
                    <p>
                        Lorem ipsum.
                    </p>
                </div>
                <div class="col-md-9">
                    <textarea id="participantes" name="emails" rows="6"></textarea>
                </div>
            </div>
            <p>
                <button form="crear" formaction="crear.php" formmethod="post" type="submit" class="btn btn-lg btn-default">Go for it</button>
            </p>
        </form>

        <?php
        if(isset($_POST) && isset($_POST['nombre']) && isset($_POST['emails'])) {
            $a = new Apuesta();
            $duelo = $a->saveDuelo($_POST['nombre'], $_POST['emails']);
        ?>
            <div class="alert alert-success">
                <strong>¡Tu duelo se ha creado!</strong> (<?php echo $duelo['jugadores']; ?> participantes).
            </div>
        <?php
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

