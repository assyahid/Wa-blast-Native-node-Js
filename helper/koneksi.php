<?php
// source code by ilman sunanuddin
// documentasi https:/m-pedia.id
$host = "localhost";
$username = "root";
$password = "";
$db = "wa4";
error_reporting(0);
$koneksi = mysqli_connect($host, $username, $password, $db) or die("GAGAL");

$base_url = "http://localhost/wa4/";
date_default_timezone_set('Asia/Jakarta');
