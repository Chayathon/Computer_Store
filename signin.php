<?php SESSION_START(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include("head.php"); ?>
</head>
<body style="background-color:WhiteSmoke">
    <?php include('navbar.php'); ?>
    <p></p>
    <div class="container-fluid">
        <div class="row">
            <div class="center">
                <center>
                    <div class="col-md-4">
                        <div class="shadow-lg p-3 mb-5 bg-body rounded">
                            <form class="form-horizontal was-validated" action="signin_db" name="signin" id="signin" method="post">
                                <h3>Sign In</h3>
                                <p></p>
                                <?php if(isset($_SESSION['success'])) { ?>
                                    <div class="alert alert-success d-flex align-items-center" role="alert">
                                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                                        <div>
                                            <?php
                                                echo $_SESSION['success'];
                                                unset($_SESSION['success']);
                                                unset($_SESSION['u_email']);
                                            ?>
                                        </div>
                                    </div>
                                <?php } ?>
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
                                    <input type="text" class="form-control is-invalid" value="<?php if(isset($_COOKIE['username'])) { echo $_COOKIE['username']; } ?>" name="u_user" id="u_user" placeholder="Username" required>
                                    <label for="u_user">Username</label>
                                </div>
                                <div class="form-floating mb-2">
                                    <input type="password" class="form-control is-invalid" value="<?php if(isset($_COOKIE['password'])) { echo $_COOKIE['password']; } ?>" name="u_pass" id="u_pass" placeholder="Password" required>
                                    <label for="u_pass">Password</label>
                                </div>
                                <div class="form-check mb-3" align="left">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" <?php if(isset($_COOKIE['username'])) { ?> checked <?php } ?>>
                                    <label class="form-check-label" for="remember">
                                        Remember Me
                                    </label>
                                </div>
                                <div class="d-grid gap-2 mb-2">
                                    <button class="btn btn-info" type="submit" name="signin">Sign In</button>
                                </div>
                                <p>Not yet a member? <a href="signup">Sign Up</a></p>
                                <a href="forgot_password">Forgot your Password?</a>
                            </form>
                        </div>
                    </div>
                </center>
            </div>
        </div>
    </div>

    <script>
        var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
        var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
            return new bootstrap.Popover(popoverTriggerEl)
        })
    </script>
</body>
</html>

<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
  </symbol>
  <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
  </symbol>
  <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </symbol>
</svg>