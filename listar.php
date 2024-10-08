<?php
require 'db.php';

$stmt = $pdo->query("SELECT * FROM produtos");
$produtos = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Produto</th>
        <th>Quantidade</th>
        <th>Preço</th>
        <th>Ações</th>
    </tr>
    <?php foreach ($produtos as $produto): ?>
    <tr>
        <td><?php echo $produto['id_produto']; ?></td>
        <td><?php echo $produto['produto']; ?></td>
        <td><?php echo $produto['quantidade']; ?></td>
        <td><?php echo $produto['preco']; ?></td>
        <td>
            <a href="editar.php?id=<?php echo $produto['id_produto']; ?>">Editar</a>
            <a href="deletar.php?id=<?php echo $produto['id_produto']; ?>">Deletar</a>
        </td>
    </tr>
    <?php endforeach; ?>
</table>
