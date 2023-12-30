<!DOCTYPE html>
<html lang="en">
<head>
    <?php include("head.php"); ?>
</head>
<body >
    <?php include("navbar.php"); ?>
    <div class="container-fluid">
        <div class="row">
            <div class="center">
                <center>
                    <div class="col-md-4">
                        <div class="shadow-lg p-3 mb-5 bg-body rounded">
                            <form class="form-horizontal" name="contact" id="contact">
                                <h3>Contact Us</h3>
                                <p align="left">You can comment now.</p>
                                <div class="form-floating mb-2">
                                    <input type="email" class="form-control" name="ct_email" id="ct_email" placeholder="E-mail" required>
                                    <label for="ct_email">E-mail</label>
                                </div>
                                <div class="form-floating mb-2">
                                    <input type="text" class="form-control" name="ct_header" id="ct_header" placeholder="Name" required>
                                    <label for="ct_header">Header</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <textarea class="form-control" name="ct_message" id="ct_message" style="height: 100px" placeholder="Message" required></textarea>
                                    <label for="ct_message">Message</label>
                                </div>
                                <div class="d-grid gap-2 mb-3">
                                    <button class="btn btn-warning" type="submit" value="send" onclick="sendMail()">Send</button>
                                </div>
                                <a href="https://www.facebook.com/nirawanfonn" target="_blank"><img src="img/logo/facebook.png" width="30"></a>
                                &emsp;
                                <a href="https://www.messenger.com/t/100022285178218" target="_blank"><img src="img/logo/messenger.png" width="30"></a>
                                &emsp;
                                <a href="https://line.me/ti/p/~0985217310" target="_blank"><img src="img/logo/line.png" width="30"></a>
                                &emsp;
                                <a href="https://www.instagram.com/nirawa_n" target="_blank"><img src="img/logo/ig.png" width="30"></a>
                            </form>

                            <script>
                                const sendMail = () =>{
                                    const ct_email = document.getElementById('ct_email').value;
                                    const ct_header = document.getElementById('ct_header').value;
                                    const ct_message = document.getElementById('ct_message').value;
                                    window.open(`mailto:nirawanfon33@gmail.com?subject=${ct_header}&body=${ct_message}`);
                                }
                            </script>
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