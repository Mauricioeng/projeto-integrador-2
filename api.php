<? php


header("Access-Control-Allow-Origin: *");
header(" Content-Type: application/json; charset=UTF-8");


$method = $_SERVER['REQUEST_METHOD'];
$connection = new mysqli("localhost", "root", "", "sorele_brindes");


if ($method === 'POST'){
    $data = json_decode(file_get_contents("php://input"));


    $color = $data -> color;
    $text = $data ->$text;
    $image = $data -> image; // url da imagem salva


    $sql = "INSERT INTO personalizacoes (cor,texto,imagem) VALUES ('$color', '$text', '$image')";


    if ($connection->query($sql)) {
        echo json_encode(["message" => "Personalização salva com sucesso"]);

    }else {
        echo json_encode(["message" => "Erro ao salvar personalização"]);

    }
}

$connection-> close();
