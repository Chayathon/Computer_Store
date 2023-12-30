<?php
    SESSION_START();
    include("condb.php");

    if(isset($_POST['otp_verify']))
    {
        $otp_code = mysqli_real_escape_string($con, $_POST['otp']);
        $check_otp = "SELECT * FROM cs_user WHERE u_otp = $otp_code";
        $code_res = mysqli_query($con, $check_otp);
        if(mysqli_num_rows($code_res) > 0){
            $fetch_data = mysqli_fetch_assoc($code_res);
            $u_email = $fetch_data['u_email'];
            $_SESSION['success'] = "Please create a new password";
            header("location: new_password.php");
            exit();
        }
        else
        {
            $_SESSION['error'] = "You've entered incorrect code!";
            echo "<script type='text/javascript'>";
            echo "window.history.back();";
            echo "</script>";
        }
    }
?>