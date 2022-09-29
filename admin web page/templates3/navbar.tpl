<div class="container py-3">
<header>
    <div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom">
        <a href="" class="d-flex align-items-center text-dark text-decoration-none">
            <img src="logo.svg" width="40" height="32"   class="me-2" viewBox="0 0 118 94" role="img">
            <span class="fs-4">Techy</span>
        </a>


        <nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto">
            {if $email eq "Ali@blockshost.com"}
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
        {/if}
            {if $email neq null}
                <a class="py-2 text-dark text-decoration-none" href="#">{$email}</a>
                <a class="py-2 text-dark text-decoration-none" href="logout.php"><br>Logout</a>
            {else}
                <a class="py-2 text-dark text-decoration-none" href="login.php">Login</a>
            {/if}
        </nav>
    </div>
</header>
</div>