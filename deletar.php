<?php
require 'db.php';

$id = $_GET['id'];

$stmt = $pdo->prepare("DELETE FROM produtos WHERE id_produto = ?");
$stmt->execute([$id]);

echo "Produto deletado com sucesso!";
header("Location: listar.php"); 
exit;
?>
