<?php
// deklarasi parameter koneksi database
$server   = "localhost";
$username = "root";
$password = "";
$database = "kreasi_meeting";
// $port = 4306; untuk port yg berbeda

// koneksi database
$mysqli = new mysqli($server, $username, $password, $database, ); // + $port untuk port yang berbeda

// cek koneksi
if ($mysqli->connect_error) {
    die('Koneksi Database Gagal : '.$mysqli->connect_error);
}
?>