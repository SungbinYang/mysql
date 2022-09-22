<?php
    /**
     * DB Connection Settings
     */

    $host = "localhost";
    $user = "root";
    $password = "y801933601@";
    $database = "shopdb";
    $port = 3306;

    $con = mysqli_connect($host, $user, $password, $database, $port);

    function mq($sql) {
        global $con;

        return $con -> query($sql);
    }
?>