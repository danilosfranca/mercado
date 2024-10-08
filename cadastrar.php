<?php
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $produto = $_POST['produto'];
    $quantidade = $_POST['quantidade'];
    $preco = $_POST['preco'];

    $stmt = $pdo->prepare("INSERT INTO produtos (produto, quantidade, preco) VALUES (farinha, arroz, feijão)");
    $stmt->execute([$produto, $quantidade, $preco]);

    echo "Produto cadastrado com sucesso!";
}
?>

<form method="POST">
    Produto: <input type="text" name="produto" required><br>
    Quantidade: <input type="number" name="quantidade" required><br>
    Preço: <input type="text" name="preco" required><br>
    <input type="submit" value="Cadastrar">
</form>
