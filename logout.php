<?php
session_start(); // Inicia a sessão
session_destroy(); // Destrói a sessão
header('Location: login.php'); // Redireciona para o login
exit;
?>