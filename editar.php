<?php
require 'db.php';

$id = $_GET['id'];
$stmt = $pdo->prepare("SELECT * FROM produtos WHERE id_produto = ?");
$stmt->execute([$id]);
$produto = $stmt->fetch(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $produtoNome = $_POST['produto'];
    $quantidade = $_POST['quantidade'];
    $preco = $_POST['preco'];

    $stmt = $pdo->prepare("UPDATE produtos SET produto = ?, quantidade = ?, preco = ? WHERE id_produto = ?");
    $stmt->execute([$produtoNome, $quantidade, $preco, $id]);

    echo "Produto atualizado com sucesso!";
}
?>

<form method="POST">
    Produto: <input type="text" name="produto" value="<?php echo $produto['produto']; ?>" required><br>
    Quantidade: <input type="number" name="quantidade" value="<?php echo $produto['quantidade']; ?>" required><br>
    Preço: <input type="text" name="preco" value="<?php echo $produto['preco']; ?>" required><br>
    <input type="submit" value="Atualizar">
</form>
