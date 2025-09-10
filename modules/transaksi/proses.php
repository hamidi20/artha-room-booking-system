<?php

session_start();
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require '../../vendor/autoload.php';

// Panggil koneksi database.php untuk koneksi database
require_once "../../config/database.php";

// fungsi untuk pengecekan status login user 
// jika user belum login, alihkan ke halaman login dan tampilkan pesan = 1
if (empty($_SESSION['username']) && empty($_SESSION['password'])) {
    echo "<meta http-equiv='refresh' content='0; url=index.php?alert=1'>";
}
// jika user sudah login, maka jalankan perintah untuk insert, update, dan delete
else {
    if ($_GET['act'] == 'insert') {
        if (isset($_POST['simpan'])) {

            $tanggal = $_POST['tanggal'];
            $nama = $_POST['nama'];
            // $ruangan = $_POST['ruangan'];
            // $mulai = $_POST['mulai'];
            // $selesai = $_POST['selesai'];
            
            //PHP Mailer for send notification mail
            $mail = new PHPMailer(true);
            try {
            //Server settings
            $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
            $mail->isSMTP();                                            //Send using SMTP
            $mail->Host       = 'smtp-mail.outlook.com';                     //Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
            $mail->Username   = 'maurameetingroom@outlook.com';                     //SMTP username
            $mail->Password   = '@meetingroom49c';                               //SMTP password
            //$mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
            $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

            //Recipients
            $mail->setFrom('maurameetingroom@outlook.com', 'Room Meeting Booking');
            $mail->addAddress('maura.cannisa@thinkartha.com', 'Room Meeting Booking');     //Add a recipient
            $mail->addAddress('nikke.priscilla@thinkartha.com', 'Room Meeting Booking');
            // $mail->addAddress('ellen@example.com');               //Name is optional
            $mail->addReplyTo('maurameetingroom@outlook.com', 'Room Meeting Booking');


            //Content
            $mail->isHTML(true);                                  //Set email format to HTML
            $mail->Subject = 'Confirmation email from Room Meeting Booking';
            $mail->Body    = 'Hello Maura and Nike, We would like to inform you that '.$nama.' is currently attempting to reserve a meeting room for the date '.$tanggal.' Kindly verify this booking request.';
            $mail->send();
            } catch (Exception $e) {
                    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                }
     
            
            // ambil data hasil submit dari form
            $id_transaksi      = mysqli_real_escape_string($mysqli, trim($_POST['id_transaksi']));

            $t_transaksi       = mysqli_real_escape_string($mysqli, trim($_POST['tanggal']));
            $exp               = explode('-', $t_transaksi);
            $tanggal_transaksi = $exp[2] . "-" . $exp[1] . "-" . $exp[0];

            $nama    = mysqli_real_escape_string($mysqli, trim($_POST['nama']));
            $mulai =  mysqli_real_escape_string($mysqli, trim($_POST['mulai']));
            $selesai =  mysqli_real_escape_string($mysqli, trim($_POST['selesai']));
            $ruangan             = mysqli_real_escape_string($mysqli, trim($_POST['ruangan']));

            // $departemen             = mysqli_real_escape_string($mysqli, trim($_POST['departemen']));
            $keterangan             = mysqli_real_escape_string($mysqli, trim($_POST['keterangan']));

            $iduser = $_SESSION['id_user'];

            // perintah query untuk menyimpan data ke tabel transaksi
            $query = mysqli_query($mysqli, "INSERT INTO transaksi(id_transaksi,tanggal,nama,mulai,selesai,ruangan,iduser,keterangan)
            -- ,departemen
                                            VALUES('$id_transaksi','$tanggal_transaksi','$nama','$mulai','$selesai','$ruangan','$iduser','$keterangan')")
                // '$departemen'
                or die('Ada kesalahan pada query insert : ' . mysqli_error($mysqli));

            // cek query
            if ($query) {
                
                // jika berhasil tampilkan pesan berhasil simpan data
                header("location: ../../main.php?module=booking&alert=1");
            }
        }
    } elseif ($_GET['act'] == 'update') {
        if (isset($_POST['simpan'])) {
            if (isset($_POST['id_transaksi'])) {
                // ambil data hasil submit dari form
                $id_transaksi      = mysqli_real_escape_string($mysqli, trim($_POST['id_transaksi']));

                $t_transaksi       = mysqli_real_escape_string($mysqli, trim($_POST['tanggal']));
                $exp               = explode('-', $t_transaksi);
                $tanggal_transaksi = $exp[2] . "-" . $exp[1] . "-" . $exp[0];

                $nama               = mysqli_real_escape_string($mysqli, trim($_POST['nama']));
                $mulai              =  mysqli_real_escape_string($mysqli, trim($_POST['mulai']));
                $selesai           =  mysqli_real_escape_string($mysqli, trim($_POST['selesai']));
                $ruangan             = mysqli_real_escape_string($mysqli, trim($_POST['ruangan']));
                //$status             = mysqli_real_escape_string($mysqli, trim($_POST['status']));

                $iduser = $_SESSION['id_user'];

                // perintah query untuk mengubah data pada tabel transaksi
                $query = mysqli_query($mysqli, "UPDATE transaksi SET tanggal             = '$tanggal_transaksi',
                                                                        nama             = '$nama',
                                                                        mulai            = '$mulai',
                                                                        selesai          = '$selesai'
                                                                        
                                                                  WHERE id_transaksi      = '$id_transaksi'")
                    or die('Ada kesalahan pada query update : ' . mysqli_error($mysqli));

                // cek query
                if ($query) {
                    // jika berhasil tampilkan pesan berhasil update data
                    header("location: ../../main.php?module=booking&alert=2");
                }
            }
        }
    } elseif ($_GET['act'] == 'update_admin') {
        if (isset($_POST['simpan'])) {
            if (isset($_POST['id_transaksi'])) {
                // ambil data hasil submit dari form
                $id_transaksi      = mysqli_real_escape_string($mysqli, trim($_POST['id_transaksi']));

                $t_transaksi       = mysqli_real_escape_string($mysqli, trim($_POST['tanggal']));
                $exp               = explode('-', $t_transaksi);
                $tanggal_transaksi = $exp[2] . "-" . $exp[1] . "-" . $exp[0];

                $nama               = mysqli_real_escape_string($mysqli, trim($_POST['nama']));
                $mulai              =  mysqli_real_escape_string($mysqli, trim($_POST['mulai']));
                $selesai           =  mysqli_real_escape_string($mysqli, trim($_POST['selesai']));
                $ruangan             = mysqli_real_escape_string($mysqli, trim($_POST['ruangan']));
                $status             = mysqli_real_escape_string($mysqli, trim($_POST['status']));

                $iduser = $_SESSION['id_user'];

                // perintah query untuk mengubah data pada tabel transaksi
                $query1 = mysqli_query($mysqli, "UPDATE transaksi SET tanggal             = '$tanggal_transaksi',
                                                                        nama      = '$nama',
                                                                        mulai   = '$mulai',
                                                                        status = '$status',
                                                                        selesai               = '$selesai'
                                                                        
                                                                  WHERE id_transaksi        = '$id_transaksi'")
                    or die('Ada kesalahan pada query update : ' . mysqli_error($mysqli));

                if ($query1) {
                    // jika berhasil tampilkan pesan berhasil update data
                    header("location: ../../main.php?module=view_admin&alert=2");
                }
            }
        }
    } elseif ($_GET['act'] == 'delete') {
        if (isset($_GET['id'])) {
            $id_transaksi = $_GET['id'];

            // perintah query untuk menghapus data pada tabel transaksi
            $query = mysqli_query($mysqli, "DELETE FROM transaksi WHERE id_transaksi='$id_transaksi'")
                or die('Ada kesalahan pada query delete : ' . mysqli_error($mysqli));

            // cek hasil query
            if ($query) {
                // jika berhasil tampilkan pesan berhasil delete data
                header("location: ../../main.php?module=view_admin&alert=3");
            }
        }
    }
}
?>