<?php
// Conexão com o banco de dados
$hostname = "localhost";
$usuario = "root";
$senha = "";
$dbname = "carrinho";

$mysqli = new mysqli($hostname, $usuario, $senha, $dbname);

// Verifica se houve erro na conexão
if ($mysqli->connect_errno) {
    die("Falha ao conectar: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error);
}

// Captura os dados enviados pelo formulário
$itensCarrinho = $_POST['itens_carrinho'];
$nome = $_POST['nome'];
$email = $_POST['email'];
$endereco = $_POST['endereco'];
$mensagem = $_POST['mensagem'];



// Prepara o comando SQL para inserir os dados
$stmt = $mysqli->prepare("INSERT INTO pedido (nome, email, endereco,mensagem,itens) VALUES (?, ?, ?, ?,?)");
$stmt->bind_param("sssss", $nome, $email, $endereco, $mensagem, $itensCarrinho);

// Verifica se a inserção foi realizada com sucesso
if ($stmt->execute()) {
    echo "Pedido recebido com sucesso!<br>" ;
    // exibir dados para depurar
echo "itens do Carrinho:" . $itensCarrinho. "<br>";
echo "Nome: " .  $nome . "<br>";
echo "Email: " . $endereco . "<br>";
echo "Mensagem" . $mensagem. "<br>";
} else {
    echo "Erro ao realizar o envio: " . $stmt->error;
}

// Fecha o statement e a conexão
$stmt->close();
$mysqli->close();
?>
 

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mensagem</title>
        <style>
            body{
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center; /* centraliza horizontal*/
                align-items: center; /*vertical center */ 
                height: 100vh; /*altura completa da pg*/
                background: linear-gradient(161deg, #fa00006d, #0400e931 );
                    }
            .mensagem {
                background: linear-gradient(161deg, #fa00006d, #0400e931 );
                padding: 20 px 40 px; /*Espaço interno*/
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.2); /*sombra*/
                font-family: Arial, Helvetica, sans-serif;
                color:#333;
                font-size: 55px;



            }        

            .mensagem.sucesso{
                border-left: 20px solid #4caf50; /* BORDA VERDE PARA SUCESSO*/

            }

            .mensagem.erro {
                border-left: 20px solid #f44336; /* borda vermelha para erro*/
            }


        </style>
        
    </head>
    
</html>