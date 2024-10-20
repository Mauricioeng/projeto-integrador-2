<?php
$hostname = "localhost";
$usuario = "root";
$senha = "";
$dbname = "carrinho";

$mysqli = new mysqli($hostname, $usuario, $senha, $dbname);
if ($mysqli->connect_errno){
    echo "falha ao conectar: (" . $mysqli->connect_errno . ")" . $mysqli->connect_errno;
}
else
    echo "Informações enviadas com sucesso";

    ?>