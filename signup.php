<?php SESSION_START(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include('head.php'); ?>
</head>
<body style="background-color:WhiteSmoke">
    <?php include('navbar.php'); ?>
    <p></p>
    <div class="container-fluid" style="margin-top: 130px">
        <div class="row">
            <div class="center">
                <center>
                    <div class="col-md-4">
                        <div class="shadow-lg p-3 mb-5 bg-body rounded">
                            <form class="form-horizontal was-validated" action="signup_db" name="signup" id="signup" method="post">
                                <h3>Sign Up</h3>
                                <?php if(isset($_SESSION['error1'])) { ?>
                                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                                        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                                        <div>
                                            <?php
                                                echo $_SESSION['error1'];
                                                unset($_SESSION['error1']);
                                            ?>
                                        </div>
                                    </div>
                                <?php } ?>
                                <?php if(isset($_SESSION['error2'])) { ?>
                                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                                        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                                        <div>
                                            <?php
                                                echo $_SESSION['error2'];
                                                unset($_SESSION['error2']);
                                            ?>
                                        </div>
                                    </div>
                                <?php } ?>
                                <?php if(isset($_SESSION['error3'])) { ?>
                                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                                        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                                        <div>
                                            <?php
                                                echo $_SESSION['error3'];
                                                unset($_SESSION['error3']);
                                            ?>
                                        </div>
                                    </div>
                                <?php } ?>
                                <p></p>
                                <div class="form-floating mb-2">
                                    <input type="text" class="form-control is-invalid" name="u_user" id="u_user" placeholder="Username" required>
                                    <label for="u_user">Username</label>
                                </div>
                                <div class="form-floating mb-2">
                                    <input type="password" class="form-control is-invalid" name="u_pass1" id="u_pass1" placeholder="Password" required>
                                    <label for="u_pass1">Password</label>
                                </div>
                                <div class="form-floating mb-2">
                                    <input type="password" class="form-control is-invalid" name="u_pass2" id="u_pass2" placeholder="Confirm Password" required>
                                    <label for="u_pass2">Confirm Password</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control is-invalid" name="u_email" id="u_email" placeholder="E-mail" required>
                                    <label for="u_email">E-mail</label>
                                </div>
                                <div class="d-grid gap-2 mb-2">
                                    <button class="btn btn-primary" type="submit" name="signup">Sign Up</button>
                                </div>
                                <p>Already a member? <a href="signin">Sign In</a></p>
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
    <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
        <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
    </symbol>
</svg>