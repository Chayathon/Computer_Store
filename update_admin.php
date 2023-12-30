<?php
    include('condb.php');
    $errors = array();

    $u_id = $_POST['u_id'];
    $u_user = $_POST['u_user'];
    $u_pass1 = $_POST['u_pass1'];
    $u_pass2 = $_POST['u_pass2'];
    $u_email = $_POST['u_email'];

    if($u_pass1 != $u_pass2)
    {
        array_push($errors, "The two passwords do not match");
    }

    if(count($errors) == 0)
    {
        $u_pass = md5($u_pass1);

        $sql = "UPDATE cs_user
        SET u_id = '$u_id',
            u_user = '$u_user',
            u_pass = '$u_pass',
            u_email = '$u_email'
        WHERE u_id = '$u_id'";
        $result = mysqli_query($con, $sql) or die ("Error in query: $sql" . mysqli_error());

        mysqli_close($con);
    
        if($result)
        {
            echo "<script type='text/javascript'>";
            echo "window.location='list_admin';";
            echo "</script>";
        }
    }

    if($errors)
    {
        echo "<script type='text/javascript'>";
        echo "alert('The two password do not match');";
        echo "window.history.back();";
        echo "</script>";
    }
?>