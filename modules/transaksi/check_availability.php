<?php
// Memeriksa apakah ada permintaan AJAX

// deklarasi parameter koneksi database
$server   = "localhost";
$username = "root";
$password = "";
$database = "kreasi_meeting";

// koneksi database
$mysqli = new mysqli($server, $username, $password, $database);

// cek koneksi
if ($mysqli->connect_error) {
    die('Koneksi Database Gagal : ' . $mysqli->connect_error);
}

if (isset($_POST['jam_mulai']) && isset($_POST['jam_selesai']) && isset($_POST['ruangan']) && isset($_POST['tanggal'])) {
    $jam_mulai = $_POST['jam_mulai'];
    $jam_selesai = $_POST['jam_selesai'];
    $ruangan = $_POST['ruangan'];
    $tanggal = DateTime::createFromFormat('d-m-Y', $_POST['tanggal'])->format('Y-m-d');

    // Memeriksa apakah jam sudah dipesan
    $query = "SELECT * FROM transaksi WHERE ruangan = ? AND mulai <= ? AND selesai >= ? AND tanggal BETWEEN ? AND DATE_ADD(?, INTERVAL 1 DAY)";

    // Gunakan prepared statement untuk mencegah SQL injection
    $stmt = $mysqli->prepare($query);

    // Bind parameters
    $stmt->bind_param("sssss", $ruangan, $jam_selesai, $jam_mulai, $tanggal, $tanggal);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        // Jam sudah dipesan, mengirimkan respons ke JavaScript
        echo 'error';
    } else {
        // Jam belum dipesan, tidak ada respons yang dikirim
    }

    // Tutup prepared statement
    $stmt->close();
    exit;
}
?>
