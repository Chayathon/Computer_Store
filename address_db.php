<?php
    SESSION_START();
    include("condb.php");

    if(isset($_POST['save']))
    {
        $u_id = mysqli_real_escape_string($con, $_POST['u_id']);
        $a_name = mysqli_real_escape_string($con, $_POST['a_name']);
        $a_phone = mysqli_real_escape_string($con, $_POST['a_phone']);
        $a_sub = mysqli_real_escape_string($con, $_POST['a_sub']);
        $a_district = mysqli_real_escape_string($con, $_POST['a_district']);
        $a_province = mysqli_real_escape_string($con, $_POST['a_province']);
        $a_zip = mysqli_real_escape_string($con, $_POST['a_zip']);

        $sql = "INSERT INTO cs_address(u_id,a_name,a_phone,a_sub,a_district,a_province,a_zip)
                VALUES('$u_id','$a_name','$a_phone','$a_sub','$a_district','$a_province','$a_zip')"; 
        $result = mysqli_query($con, $sql) or die ("Error in query: $sql ".mysqli_error());
        
        if($result)
        {
            $_SESSION['success'] = "The address has been saved.";
            echo "<script type='text/javascript'>";
            echo "window.location='address';";
            echo "</script>";
        }
    }

    if(isset($_POST['edit']))
    {
        $a_id = mysqli_real_escape_string($con, $_POST['a_id']);
        $u_id = mysqli_real_escape_string($con, $_POST['u_id']);
        $a_name = mysqli_real_escape_string($con, $_POST['a_name']);
        $a_phone = mysqli_real_escape_string($con, $_POST['a_phone']);
        $a_sub = mysqli_real_escape_string($con, $_POST['a_sub']);
        $a_district = mysqli_real_escape_string($con, $_POST['a_district']);
        $a_province = mysqli_real_escape_string($con, $_POST['a_province']);
        $a_zip = mysqli_real_escape_string($con, $_POST['a_zip']);

        $sql_update = "UPDATE cs_address
        SET a_id = '$a_id',
            u_id = '$u_id',
            a_name = '$a_name',
            a_phone = '$a_phone',
            a_sub = '$a_sub',
            a_district = '$a_district',
            a_province = '$a_province',
            a_zip = '$a_zip'
        WHERE a_id = '$a_id'";
        $result_update = mysqli_query($con, $sql_update) or die ("Error in query: $sql_update" . mysqli_error());
        
        setcookie("name", "");
        setcookie("phone", "");
        setcookie("address", "");
        setcookie("district", "");
        setcookie("province", "");
        setcookie("zip", "");

        if($result_update)
        {
            $_SESSION['success'] = "The Address has been edited.";
            echo "<script type='text/javascript'>";
            echo "window.location='address';";
            echo "</script>";
        }
    }
?>