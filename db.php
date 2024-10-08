<?php
$host = 'localhost';
$db = 'seu_banco_de_dados'; 
$user = 'seu_usuario';
$pass = 'sua_senha'; 

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>
