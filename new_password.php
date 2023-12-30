<?php
    SESSION_START();

    if(!isset($_SESSION['u_email']))
    {
        echo "<script type='text/javascript'>";
        echo "window.history.back();";
        echo "</script>";
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <?php include("head.php"); ?>
</head>
<body style="background-color:WhiteSmoke">
    <div class="container-fluid">
        <div class="row">
            <div class="center">
                <center>
                    <div class="col-md-4">
                        <div class="shadow-lg p-3 mb-5 bg-body rounded">
                            <form class="form-horizontal was-validated" action="new_password_db.php" name="new_password" id="new_password" method="post">
                                <h3>Create new password</h3>
                                <?php if(isset($_SESSION['error'])) { ?>
                                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                                        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                                        <div>
                                            <?php
                                                echo $_SESSION['error'];
                                                unset($_SESSION['error']);
                                            ?>
                                        </div>
                                    </div>
                                <?php } ?>
                                <p></p>
                                <div class="form-floating mb-2">
                                    <input type="password" class="form-control is-invalid" name="u_pass1" id="u_pass1" placeholder="New Password" required>
                                    <label for="u_pass1">New Password</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control is-invalid" name="u_pass2" id="u_pass2" placeholder="Confirm New Password" required>
                                    <label for="u_pass2">Confirm New Password</label>
                                </div>
                                <div class="d-grid gap-2">
                                    <button class="btn btn-warning" type="submit" name="new_password">Change Password</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </center>
            </div>
        </div>
    </div>
</body>
</html>

<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
    </symbol>
    <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
        <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
    </symbol>
</svg>