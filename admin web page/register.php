<?php


include "includes/config.php";


if(isset($_POST["register"]) && $_POST["register"] == "true") {
    $name = $_POST["name"];
    $email = $_POST["email"];
    $number = $_POST["phonenumber"];
    $password = $_POST["password"];
    $password2 = $_POST["password2"];

    if($password != $password2) {
        die("Password doesn't match");
    }   

    $insertUser = $db->prepare("INSERT INTO `users` (`name`, `email`, `phone_number`, `password`) VALUES (?, ?, ?, ?)");
    $insertUser->bindParam(1, $name, PDO::PARAM_STR);
    $insertUser->bindParam(2, $email, PDO::PARAM_STR);
    $insertUser->bindParam(3, $number, PDO::PARAM_STR);
    $insertUser->bindParam(4, $password, PDO::PARAM_STR);

    $insertUser->execute();

    echo $name;

    exit();
}


//$smarty->display("header.tpl");
$smarty->display("register.tpl");
//$smarty->display("footer.tpl");


?>