<?php
session_start(); //Inicia a sessão

//Verifica se o usuário está logado
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('Location: login.php'); //Redireciona para o login se não estiver logado
    exit;
}

// Conexão com o banco de dados
$hostname = "localhost";
$usuario= "root";
$senha = "";
$dbname = "carrinho";

$mysqli = new mysqli($hostname, $usuario, $senha, $dbname);

//Verifica se houve erro na conexão
if ($mysqli ->connect_errno){
    die("Falha ao conectar:(". $mysqli->connect_errno .")". $mysqli->connect_error);

}

// Consulta para buscar todos os pedidos
$sql = "SELECT * FROM pedido";
$result = $mysqli->query($sql);

//Verifica se a consulta retornou resultados
if (!$result){
    die("Erro na consulta:" . $mysqli->error);
}

// Preparar dados para o gráfico
$totalVendas = 0;
$quantidadePedidos = 0;
$itensMaisVendidos = [];

while ($row = $result->fetch_assoc()){
    $quantidadePedidos++;
    //Decodifica os itens do pedido
    $itensCarrinhoArray = json_decode($row['itens'], true);

    // Calcula o total de vendas e itens mais vendidos
    if ($itensCarrinhoArray){
        foreach($itensCarrinhoArray as $item){
            $totalVendas += $item['price'];
            $itensMaisVendidos[$item['name']] = isset($itensMaisVendidos[$item['name']]) ? $itensMaisVendidos[$item['name']] + 1 : 1;
        }
    }
}

// Ordena itens mais vendido
arsort($itensMaisVendidos);
$itensTop = array_slice($itensMaisVendidos, 0, 5); // TOP 5 ITENS MAIS VENDIDOS

// DADOS PARA O GRÁFICO DE ITENS MAIS VENDIDOS
$nomeItens = json_encode(array_keys($itensTop));
$quantidadeItens = json_encode(array_values($itensTop));

// fecha a conexão
$mysqli->close();
?>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale= 1.0">
        <title>Painel de Pedidos</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            body{
                font-family: Arial, Helvetica, sans-serif;
                background: linear-gradient(161deg, #fa00006d, #0400e931);
                color: #333;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 20px;
            }
            .container {
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                width: 90%;
                max-width: 800px;
            }
            h1{
                font-size: 24px;
                color: #4caf50;
                text-align: center;
            }
            table{
                width: 100%;
                border-collapse: collapse;
                margin-top:20px ;
            }
            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;

            }
            th{
                background-color: #4caf50;
                color:white;
            }
            .total{
                color:#d32f2f;
                font-weight: bold;
            }
            .dashboard{
                margin-top: 40px;
            }
            canvas {
                max-width: 100%;

            }
            .logout {
                margin-top: 20px;
                text-align: center;
            }


        </style>
    </head>
    <body>
        <div class="container">
            <h1>Painel de Pedidos Recebidos</h1>
            <h2>Resumo dos Pedidos</h2>
            <p>Total de vendas: R$ <?php echo number_format($totalVendas, 2, ',', '.');?></p>
            <p>Quantidade de Pedidos: <?php echo $quantidadePedidos; ?></p>

            <div class="dashboard">
                <canvas id="itensMaisVendidosChart"></canvas>
            </div>

            <h2>Lista de Pedidos</h2>
            <?php if ($result && $result->num_rows > 0): ?>
                <table>
                    <tr>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Endereço</th>
                        <th>Itens</th>
                        <th>Total</th>

                    </tr>
                    <?php
                    //Rewind o resultado para reusá- lo na tabela
                    $result->data_seek(0);
                    while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['nome']);?></td>
                        <td><?php echo htmlspecialchars($row['email']);?></td>
                        <td><?php echo htmlspecialchars($row['endereco']);?></td>
                        <td>
                            <?php
                            $itensCarrinhoArray = json_decode($row['itens'], true);
                            if ($itensCarrinhoArray) {
                                $total = 0;
                                foreach ($itensCarrinhoArray as $item){
                                    echo htmlspecialchars($item['name']). "- R$" . number_format($item['price'], 2, ',','.'). "<br>";
                                    $total += $item['price'];
                                }

                            } else {
                                echo "Nenhum item encontrado.";
                            }
                            ?>
                        </td>
                        <td class="total">R$<?php echo number_format($total ?? 0, 2, ',','.'); ?></td>
                    </tr>
                    <?php endwhile; ?>
                </table>
                <?php else: ?>
                    <p>Nenhum pedido recebido ainda.</p>
                    <?php endif; ?>

                    <div class="logout">
                        <a href="logout.php">Sair</a>
                    </div>

        </div>
        <script>
            const ctx = document.getElementById('itensMaisVendidosChart').getContext('2d');
            const itensMaisVendidosChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: <?php echo $nomeItens; ?>,
                    datasets: [{
                        label: 'Quantidade Vendida',
                        data: <?php echo $quantidadeItens; ?>,
                        backgroundColor: 'rgba(76, 175, 80, 0.5)',
                        borderColor: 'rgba(76, 175, 80, 1)',
                        borderWidth: 1 
                    }]
                },
                options: {
                    scales:{
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>
    </body>
</html>