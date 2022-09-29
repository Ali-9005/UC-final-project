<?php

setcookie("email", null, time() - 3600, "/");
header("Location: /techy");