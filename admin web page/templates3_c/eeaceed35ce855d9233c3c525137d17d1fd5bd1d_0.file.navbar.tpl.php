<?php
/* Smarty version 4.2.0, created on 2022-09-29 21:07:18
  from 'C:\xampp\htdocs\techy\templates3\navbar.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.2.0',
  'unifunc' => 'content_6335ece6f29ad5_06436263',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'eeaceed35ce855d9233c3c525137d17d1fd5bd1d' => 
    array (
      0 => 'C:\\xampp\\htdocs\\techy\\templates3\\navbar.tpl',
      1 => 1664478391,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6335ece6f29ad5_06436263 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="container py-3">
<header>
    <div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom">
        <a href="" class="d-flex align-items-center text-dark text-decoration-none">
            <img src="logo.svg" width="40" height="32"   class="me-2" viewBox="0 0 118 94" role="img">
            <span class="fs-4">Techy</span>
        </a>


        <nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto">
            <?php if ($_smarty_tpl->tpl_vars['email']->value == "Ali@blockshost.com") {?>
                <div id="navbarNavDarkDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <br>Control Panel
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark">
                                <li><a class="dropdown-item" href="panel.php?show=all">All</a></li>
                                <li><a class="dropdown-item" href="panel.php?show=pending">Pending</a></li>
                                <li><a class="dropdown-item" href="panel.php?show=approved">Approved</a></li>
                                <li><a class="dropdown-item" href="panel.php?show=rejected">Rejected</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
        <?php }?>
            <?php if ($_smarty_tpl->tpl_vars['email']->value != null) {?>
                <a class="py-2 text-dark text-decoration-none" href="#"><?php echo $_smarty_tpl->tpl_vars['email']->value;?>
</a>
                <a class="py-2 text-dark text-decoration-none" href="logout.php"><br>Logout</a>
            <?php } else { ?>
                <a class="py-2 text-dark text-decoration-none" href="login.php">Login</a>
            <?php }?>
        </nav>
    </div>
</header>
</div><?php }
}
