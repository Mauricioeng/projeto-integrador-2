<?php
session_start(); // Inicia a sessão

// verifica se esta logado
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true){
    header(('Location:painel.php')); //Redireciona para o painel se já estiver logado
    exit;
}

//Define a senha correta(pode ser armazenada em um banco de dados ou arquivo)
$senhaCorreta = 'Sorelle';

if ($_SERVER['REQUEST_METHOD'] == 'POST'){
    $senha = $_POST['senha']??'';

    // Verifica a senha
    if ($senha === $senhaCorreta){
        $_SESSION['loggedin'] = true; // Define a sessão como logada
        header('Location: painel.php'); // Redireciona para o painel
        exit;

    }else {
        $erro = "Senha incorreta!";

    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(161deg, #fa00006d, #0400e931);

        }

        .login-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h1{
            text-align: center;

        }
        .error{
            color: red;
            text-align: center;

        }
    </style>
</head> 
<body>
    <div class="login-container">
        <h1>Login</h1>
        <?php if (isset($erro)): ?>
            <div class="error"><?php echo $erro; ?></div>
            <?php endif; ?>
            <form method="post">
                <label for="senha"> Senha:</label>
                <input type="password" name="senha" id="senha" required>
                <button type="submit">Entrar</button>
            </form>
        
        </div>
</body>   
</html>

