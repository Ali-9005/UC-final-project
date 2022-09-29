<?php
/* Smarty version 4.2.0, created on 2022-09-29 16:55:16
  from 'C:\xampp\htdocs\techy\templates3\panel.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.2.0',
  'unifunc' => 'content_6335b1d4af4e65_20152182',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd260ef2a3b1ef10e4dc5a81ba6bfd8d0ebeca091' => 
    array (
      0 => 'C:\\xampp\\htdocs\\techy\\templates3\\panel.tpl',
      1 => 1664463312,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6335b1d4af4e65_20152182 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="container">
<table class="table">
    <thead>
    <tr>
        <th>#</th>
        <th>Product</th>
        <th>name</th>
        <th>category</th>
        <th>description</th>
        <th>status</th>
        <th>price</th>
        <th>approved</th>
        <th>rejected</th>
        <th>time</th>
    </tr>
    </thead>
    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['getItems']->value, 'item');
$_smarty_tpl->tpl_vars['item']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
$_smarty_tpl->tpl_vars['item']->do_else = false;
?>
        <tr>
            <td>#<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
</td>
            <td><img src="<?php echo $_smarty_tpl->tpl_vars['item']->value['image'];?>
" width="50"></td>
            <td><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</td>
            <td><?php echo $_smarty_tpl->tpl_vars['item']->value['category'];?>
</td>
            <td><?php echo $_smarty_tpl->tpl_vars['item']->value['description'];?>
</td>
            <?php ob_start();
echo $_smarty_tpl->tpl_vars['item']->value['status'];
$_prefixVariable1 = ob_get_clean();
if ($_prefixVariable1 == 0) {?>
            <td>Pending</td>
                <?php } else {
ob_start();
echo $_smarty_tpl->tpl_vars['item']->value['status'];
$_prefixVariable2 = ob_get_clean();
if ($_prefixVariable2 == 1) {?>
                <td>Approved</td>
            <?php } else {
ob_start();
echo $_smarty_tpl->tpl_vars['item']->value['status'];
$_prefixVariable3 = ob_get_clean();
if ($_prefixVariable3 == 2) {?>
                <td>Rejected</td>
            <?php }}}?>
            <td><?php echo $_smarty_tpl->tpl_vars['item']->value['price'];?>
</td>
            <?php ob_start();
echo $_smarty_tpl->tpl_vars['item']->value['status'];
$_prefixVariable4 = ob_get_clean();
if ($_prefixVariable4 == 0) {?>
            <td><a class="btn btn-success" href="panel.php?approve=<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
">Approve</a></td>
            <td><a class="btn btn-danger" href="panel.php?reject=<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
">Reject</a></td>
            <?php } else {
ob_start();
echo $_smarty_tpl->tpl_vars['item']->value['status'];
$_prefixVariable5 = ob_get_clean();
if ($_prefixVariable5 == 1) {?>
            <td>Already approved</td>
            <td><a class="btn btn-danger" href="panel.php?reject=<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
">Reject</a></td>
            <?php } else {
ob_start();
echo $_smarty_tpl->tpl_vars['item']->value['status'];
$_prefixVariable6 = ob_get_clean();
if ($_prefixVariable6 == 2) {?>
            <td><a class="btn btn-success" href="panel.php?approve=<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
">Approve</a></td>
            <td>Already rejected</td>
            <?php }}}?>
            <td><?php echo $_smarty_tpl->tpl_vars['item']->value['time'];?>
</td>
        </tr>
        <?php
}
if ($_smarty_tpl->tpl_vars['item']->do_else) {
?>
        <tr><td colspan="9">No results found</td></tr>
    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
</table>
</div><?php }
}
