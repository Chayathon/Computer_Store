<?php
    SESSION_START();
    include('condb.php');
    $errors = array();

    if(isset($_POST['submit']))
    {
        $u_id = mysqli_real_escape_string($con, $_POST["u_id"]);
        $u_user = mysqli_real_escape_string($con, $_POST["u_user"]);
        $u_pass1 = mysqli_real_escape_string($con, $_POST["u_pass1"]);
        $u_pass2 = mysqli_real_escape_string($con, $_POST["u_pass2"]);
        $u_email = mysqli_real_escape_string($con, $_POST["u_email"]);

        if($u_pass1 != $u_pass2)
        {
            array_push($errors, "The two passwords do not match");
            $_SESSION['error'] = "The two passwords do not match";
            echo "<script type='text/javascript'>";
            echo "window.history.back();";
            echo "</script>";
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
                $_SESSION['success'] = "Edit success";
                echo "<script type='text/javascript'>";
                echo "window.location='member_update';";
                echo "</script>";
            }
        }
    }
?>