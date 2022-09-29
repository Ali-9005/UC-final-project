<?php


include "includes/config.php";


if (isset($_POST["login"]) && $_POST["login"] == "true") {
    $email = $_POST["email"];
    $password = $_POST["password"];

    $getPassword = $db->prepare("SELECT `password` FROM `users` WHERE `email` = ? and `password` = ?");
    $getPassword->bindParam(1, $email, PDO::PARAM_STR);
    $getPassword->bindParam(2, $password, PDO::PARAM_STR);
    $getPassword->execute();

    if($getPassword->rowCount() > 0) {
        setcookie("email", $email, time() + 604800, "/");
        header("Location: /techy");
    }

    exit();
}


//$smarty->display("header.tpl");
$smarty->display("login.tpl");
//$smarty->display("footer.tpl");


