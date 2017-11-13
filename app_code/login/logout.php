<?php

global $app;

session_destroy();

header("location:index.php?page=login/login");