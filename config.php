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
    echo "<div class='container'>";
    echo "<h1 class='titulo'>Pedido recebido com sucesso!</h1><br>";
    
    // Decodificar a string JSON
    $itensCarrinhoArray = json_decode($itensCarrinho, true);
    
    $total = 0; // Inicializa a variável total

    // Loop através dos itens para exibir nomes e preços
    echo "<h2>Itens do Carrinho:</h2>";
    foreach ($itensCarrinhoArray as $item) {
        echo "<p class='item'>" . $item['name'] . " - Preço: R$" . number_format($item['price'], 2, ',', '.') . "</p>"; // Exibe o nome e o preço do produto
        $total += $item['price']; // Adiciona o preço do item ao total
    }

    // Exibe o total
    echo "<p class='total'><strong>Total: R$" . number_format($total, 2, ',', '.') . "</strong></p>";
    
    // Informações do cliente
    echo "<h2>Informações do Cliente:</h2>";
    echo "<p><strong>Nome:</strong> " . $nome . "</p>";
    echo "<p><strong>Email:</strong> " . $email . "</p>";
    echo "<p><strong>Mensagem:</strong> " . $mensagem . "</p>";
    echo "</div>";
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
            body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center; /* centraliza horizontal */
            align-items: center; /* vertical center */ 
            height: 100vh; /* altura completa da pg */
            background: linear-gradient(161deg, #fa00006d, #0400e931);
            font-family: Arial, Helvetica, sans-serif;
            color: #333;
        }
        .container {
            background: white;
            padding: 30px 40px; /* Espaço interno */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* sombra */
            text-align: center; /* centraliza texto */
            width: 80%; /* largura da caixa */
            max-width: 600px; /* largura máxima */
        }
        .titulo {
            font-size: 36px;
            color: #4caf50; /* Verde */
        }
        h2 {
            font-size: 24px;
            color: #333;
            margin-top: 20px; /* espaço superior */
        }
        .item {
            font-size: 18px;
            margin: 10px 0; /* espaço entre itens */
        }
        .total {
            font-size: 20px;
            margin: 20px 0; /* espaço superior/inferior */
            color: #d32f2f; /* vermelho */
        }
        strong {
            font-weight: bold; /* negrito */
        }


        </style>
        
    </head>
    
</html>