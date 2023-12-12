<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");

header("Access-Control-Allow-Methods: GET, POST");

include 'connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $data = json_decode(file_get_contents("php://input"), true);

    // Extract data from the JSON
    $nbi = $data['nbi'];
    $nama = $data['nama'];
    $alamat = $data['alamat'];
    $tanggal_lahir = $data['tanggal_lahir'];
    $kelas = $data['kelas'];
    $jurusan = $data['jurusan'];
    $semester = $data['semester'];

    $insertSql = "INSERT INTO mahasiswa (nbi, nama, alamat, tanggal_lahir, kelas, jurusan, semester) VALUES ('$nbi', '$nama', '$alamat', '$tanggal_lahir', '$kelas', '$jurusan', '$semester')";

    // Execute the insertion query
    if (mysqli_query($con, $insertSql)) {
        echo json_encode(['message' => 'Record inserted successfully', 'status' => true]);
    } else {
        echo json_encode(['message' => 'Error inserting record', 'status' => false, 'error' => mysqli_error($con)]);
    }

    mysqli_close($con);
} else {
    echo json_encode(['message' => 'Invalid request method', 'status' => false]);
}
