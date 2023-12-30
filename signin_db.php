<?php
    SESSION_START();
    include("condb.php");

    if(isset($_POST['signin']))
    {
        $u_user = mysqli_real_escape_string($con, $_POST['u_user']);
        $u_pass = mysqli_real_escape_string($con, $_POST['u_pass']);

        $u_pass = md5($u_pass);

        $sql = "SELECT * FROM cs_user WHERE u_user LIKE '$u_user' AND u_pass LIKE '$u_pass'";
        $result = mysqli_query($con, $sql) or die ("Error in query: $sql " . mysqli_error());

        if(mysqli_num_rows($result))
        {
            $row = mysqli_fetch_array($result);
            $_SESSION["ID"] = $row["u_id"];
            $_SESSION["username"] = $row["u_user"];
            $_SESSION["level"] = $row["u_status"];

            if(!empty($_POST['remember']))
            {
                setcookie("username", $_POST['u_user'], time() + (10 * 365 * 24 * 60 * 60));
                setcookie("password", $_POST['u_pass'], time() + (10 * 365 * 24 * 60 * 60));
            }
            else
            {
                if(isset($_COOKIE['username']))
                {
                    setcookie("username", "");

                    if(isset($_COOKIE['password']))
                    {
                        setcookie("password", "");
                    }
                }
            }
        
            if($row["u_status"] == 'admin')
            {
                header("location: list_admin");
            }
        
            if($row["u_status"] == 'member')
            {
                header("location: member");
            }
        }
        else
        {
            $_SESSION['error'] = "Wrong username or password try again!";
            echo "<script type='text/javascript'>";
            echo "window.history.back();";
            echo "</script>";
        }
    }
?>