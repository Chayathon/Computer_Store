<!DOCTYPE html>
<html lang="en">
<head>
    <?php include("h_admin.php"); ?>
</head>
<body>
    <?php include("navbar_admin.php"); ?>
    <p></p>
    <div class="container-fluid">

    <!-------------------------------------------------------------------- SEARCH -------------------------------------------------------------------->

        <div class="row">
            <div class="col-3">
                <form class="d-flex" method="GET" action="list_admin">
                    <input class="form-control me-2" type="search" name="search_admin" placeholder="Search" aria-label="Search">
                </form>
            </div>
            <div class="col-8"></div>
            <div class="col-1" align="right">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add">
                    Add
                </button>
            </div>
        </div>

    <!-------------------------------------------------------------------- ADD -------------------------------------------------------------------->

        <div class="modal fade" id="add" tabindex="-1" aria-labelledby="addLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addLabel">Add Admin</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal was-validated" name="add" id="add" method="post" action="add_admin.php">
                            <div class="form-floating mb-2">
                                <input type="text" class="form-control" name="u_user" id="u_user" placeholder="Username" required>
                                <label for="u_user">Username</label>
                            </div>
                            <div class="form-floating mb-2">
                                <input type="password" class="form-control" name="u_pass1" id="u_pass1" placeholder="Password" required>
                                <label for="u_pass1">Password</label>
                            </div>
                            <div class="form-floating mb-2">
                                <input type="password" class="form-control" name="u_pass2" id="u_pass2" placeholder="Confirm Password" required>
                                <label for="u_pass2">Confirm Password</label>
                            </div>
                            <div class="form-floating">
                                <input type="email" class="form-control" name="u_email" id="u_email" placeholder="E-mail" required>
                                <label for="u_email">E-mail</label>
                            </div>
                    </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-success" name="add">Save</button>
                            </div>
                        </form>
                </div>
            </div>
        </div>
        <p></p>

    <!------------------------------------------------------------------ LIST ------------------------------------------------------------------>

        <?php
            $search_admin = (isset($_GET['search_admin'])? $_GET['search_admin'] : '');
            if($search_admin!='')
            {
                include('search_admin.php');
            }
            else
            {
                include('list_admin_db.php');
            }
        ?>

    </div>
</body>
</html>