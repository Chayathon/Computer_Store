<?php
    SESSION_START();
    include("condb.php");
    $errors = array();

    if(isset($_POST['signup']))
    {
        $u_user = mysqli_real_escape_string($con, $_POST["u_user"]);
        $u_pass1 = mysqli_real_escape_string($con, $_POST["u_pass1"]);
        $u_pass2 = mysqli_real_escape_string($con, $_POST["u_pass2"]);
        $u_email = mysqli_real_escape_string($con, $_POST["u_email"]);

        $user_check = "SELECT * FROM cs_user WHERE u_user = '$u_user' OR u_email = '$u_email'";
        $query = mysqli_query($con, $user_check);
        $result_check = mysqli_fetch_assoc($query);

        if($result_check)
        {
            if($result_check['u_user'] === $u_user)
            {
                array_push($errors, "Username already exists");
                $_SESSION['error1'] = "Username already exists";
                echo "<script type='text/javascript'>";
                echo "window.history.back();";
                echo "</script>";
            }

            if($result_check['u_email'] === $u_email)
            {
                array_push($errors, "E-mail already exists");
                $_SESSION['error2'] = "E-mail already exists";
                echo "<script type='text/javascript'>";
                echo "window.history.back();";
                echo "</script>";
            }
        }

        if($u_pass1 != $u_pass2)
        {
            array_push($errors, "The two passwords do not match");
            $_SESSION['error3'] = "The two passwords do not match";
            echo "<script type='text/javascript'>";
            echo "window.history.back();";
            echo "</script>";
        }

        if(count($errors) == 0)
        {
            $u_pass = md5($u_pass1);

            $sql = "INSERT INTO cs_user(u_user,u_pass,u_email,u_status)
            VALUES('$u_user','$u_pass','$u_email','member')";
            $result = mysqli_query($con,$sql) or die ("Error in query: $sql ".mysqli_error());
            
            if($result)
            {
                $_SESSION['success'] = "You are now registered";
                echo "<script type='text/javascript'>";
                echo "window.location='signin';";
                echo "</script>";
            }
        }
    }
?>