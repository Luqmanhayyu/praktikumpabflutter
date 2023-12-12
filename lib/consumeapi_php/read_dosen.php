<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");

header("Access-Control-Allow-Methods: GET");

include 'connect.php';

$sql = "SELECT * FROM mahasiswa";
$result = mysqli_query($con, $sql) or die("Query failed");

if (mysqli_num_rows($result) > 0) {
    $output = mysqli_fetch_all($result, MYSQLI_ASSOC);
    echo json_encode($output);
} else {
    echo json_encode(['message' => 'No records found', 'status' => false]);
}

mysqli_close($con);
