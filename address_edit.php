<?php
    SESSION_START();
    include("condb.php");

    $a_id = $_GET['a_id'];

    $sql = "SELECT * FROM cs_address WHERE a_id = '$a_id'";
    $result = mysqli_query($con, $sql) or die ("Error in query: $sql" . mysqli_error());
    $row = mysqli_fetch_array($result);

    $_SESSION['a_id'] = $a_id;

    setcookie("name", $row['a_name'], time() + (10 * 365 * 24 * 60 * 60));
    setcookie("phone", $row['a_phone'], time() + (10 * 365 * 24 * 60 * 60));
    setcookie("address", $row['a_sub'], time() + (10 * 365 * 24 * 60 * 60));
    setcookie("district", $row['a_district'], time() + (10 * 365 * 24 * 60 * 60));
    setcookie("province", $row['a_province'], time() + (10 * 365 * 24 * 60 * 60));
    setcookie("zip", $row['a_zip'], time() + (10 * 365 * 24 * 60 * 60));

    header("location: address");
?>