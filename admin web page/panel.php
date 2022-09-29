<?php
include "includes/config.php";

if(isset($_GET['approve'])) {
    $id = $_GET['approve'];
    $db->exec("UPDATE products SET status = 1 WHERE id = $id;");
    header('Location: panel.php?show=approved');
    exit;

}
if(isset($_GET['reject'])) {
    $id = $_GET['reject'];
    $db->exec("UPDATE products SET status = 2 WHERE id = $id;");
    header('Location: panel.php?show=rejected');
    exit;
}

$show = (isset($_GET['show']) ? $_GET['show'] : "all");
$queryWhere = "";
if($show == "pending") $queryWhere = " WHERE status = 0";
if($show == "approved") $queryWhere = " WHERE status = 1";
if($show == "rejected") $queryWhere = " WHERE status = 2";

$getItems = $db->prepare("SELECT * FROM products$queryWhere;");
$getItems->execute();
$getItems->setFetchMode(PDO::FETCH_LAZY);
$smarty->assign('getItems',$getItems);

$smarty->display("header.tpl");
$smarty->display("panel.tpl");
$smarty->display("footer.tpl");
