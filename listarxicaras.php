<? php

// listar_cups.php

$servername = 'localhost';

$username = 'root';

$password = '';

$dbname = 'cup_customizer';


// cria conexão

$conn = new mysqli($servername,  $username, $password, $dbname);


// verifica a conexão
if ($conn ->connect_error){
    die("Conexão falhada:" . $->connection_error);
}

$sql = "SELECT * FROM cups";
$result = $conn->query($sql);

$cups = array();

if($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()){
        $cups[] = $row;
    }
}

echo json_encode($cups);

$conn->close();

?>

