<?php

define('HOST', 'localhost');
define('USER', 'root');
define('PASS', '');
define('DB', 'db_latihan');

$con = mysqli_connect(HOST, USER, PASS, DB) or die('tidak bisa konek');

// Mengecek apakah koneksi berhasil atau tidak
if ($con) {
    echo 'Koneksi ke database berhasil.';
    // Lakukan operasi database lainnya di sini jika perlu
} else {
    echo 'Koneksi ke database gagal.';
    // Tindakan tambahan jika koneksi gagal
}
