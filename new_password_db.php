<?php
    SESSION_START();
    include("condb.php");
    $errors = array();

    if(isset($_POST['new_password']))
    {
        $u_pass1 = mysqli_real_escape_string($con, $_POST['u_pass1']);
        $u_pass2 = mysqli_real_escape_string($con, $_POST['u_pass2']);

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
            $otp = 0;
            $u_pass = md5($u_pass1);
            $u_email = $_SESSION['u_email'];

            $sql = "UPDATE cs_user SET u_otp = $otp, u_pass = '$u_pass' WHERE u_email = '$u_email'";
            $run_query = mysqli_query($con, $sql);

            if($run_query)
            {
                $_SESSION['success'] = "Your password has been changed.";
                echo "<script type='text/javascript'>";
                echo "window.location='signin';";
                echo "</script>";
            }
            else
            {
                $_SESSION['error'] = "Failed to change your password!";
                echo "<script type='text/javascript'>";
                echo "window.history.back();";
                echo "</script>";
            }
        }
    }
?>