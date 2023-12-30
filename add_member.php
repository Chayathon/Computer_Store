<?php
    include("condb.php");
    $errors = array();

    if(isset($_POST['add']))
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
            }

            if($result_check['u_email'] === $u_email)
            {
                array_push($errors, "E-mail already exists");
            }
        }

        if($u_pass1 != $u_pass2)
        {
            array_push($errors, "The two passwords do not match");
        }

        if(count($errors) == 0)
        {
            $u_pass = md5($u_pass1);

            $sql = "INSERT INTO cs_user(u_user,u_pass,u_email,u_status)
            VALUES('$u_user','$u_pass','$u_email','member')";
            $result = mysqli_query($con,$sql) or die ("Error in query: $sql ".mysqli_error());
            
            if($result)
            {
                echo "<script type='text/javascript'>";
                echo "window.location='list_member';";
                echo "</script>";
            }
        }

        if($result_check)
        {
            echo "<script type='text/javascript'>";
            echo "alert('Username or Email already exists');";
            echo "window.history.back();";
            echo "</script>";
        }
        else
        {
            echo "<script type='text/javascript'>";
            echo "alert('The two password do not match');";
            echo "window.history.back();";
            echo "</script>";
        }
    }
?>