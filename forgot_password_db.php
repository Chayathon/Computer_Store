<!DOCTYPE html>
<html lang="en">
<head>
    <?php include("head.php"); ?>
</head>
<body>
    <?php
        SESSION_START();
        include("condb.php");
        $errors = array();

        use PHPMailer\PHPMailer\PHPMailer;

        if(isset($_POST['forgot_password']))
        {
            $u_email = mysqli_real_escape_string($con, $_POST["u_email"]);

            $user_check = "SELECT * FROM cs_user WHERE u_email = '$u_email'";
            $result_check = mysqli_query($con, $user_check);

            if(mysqli_num_rows($result_check) > 0)
            {
                $otp = rand(999999, 111111);
                $insert_otp = "UPDATE cs_user SET u_otp = $otp WHERE u_email = '$u_email'";
                $run_query =  mysqli_query($con, $insert_otp);

                $_SESSION['u_email'] = $u_email;

                if($run_query)
                {
                    require_once "PHPMailer/PHPMailer.php";
                    require_once "PHPMailer/SMTP.php";
                    require_once "PHPMailer/Exception.php";

                    $mail = new PHPMailer();
                    
                    $mail -> isSMTP();
                    $mail -> Host = "smtp.gmail.com";
                    $mail -> SMTPAuth = true;
                    $mail -> Port = 587;
                    $mail -> SMTPSecure = "tls";

                    $gmail_username = "forwork157903@gmail.com";
                    $gmail_password = "idrduuiqgazxajfn";
                    $sender = "Computer Store";
                    $email_sender = "no-reply@gmail.com";
                    $email_receiver = $u_email;
                    $subject = "One Time Password";
                    $email_content = "  <!DOCTYPE html>
                                        <html>
                                            <head>
                                                <meta charset='utf-8'/>
                                                <title>OTP</title>
                                            </head>
                                            <body>
                                                <p>Your OTP is <b><u>$otp</u></b></p>
                                            </body>
                                        </html>";

                    $mail -> Username = $gmail_username;
                    $mail -> Password = $gmail_password;
                    $mail -> Subject = $subject;
                    $mail -> isHTML(true);
                    $mail -> setFrom($email_sender, $sender);
                    $mail -> addAddress($email_receiver);
                    $mail -> msgHTML($email_content);

                    if($mail -> send())
                    {
                        $_SESSION['success'] = "OTP has been sent to your email.";
                        echo "<script type='text/javascript'>";
                        echo "window.location='otp_verify';";
                        echo "</script>";
                    }
                    else
                    {
                        $_SESSION['error'] = "Something went wrong";
                        echo "<script type='text/javascript'>";
                        echo "window.history.back();";
                        echo "</script>";
                    }
                    
                    exit(json_encode());
                }
            }
            else
            {
                $_SESSION['error'] = "This email address does not exists!";
                echo "<script type='text/javascript'>";
                echo "window.history.back();";
                echo "</script>";
            }
        }
    ?>
</body>
</html>