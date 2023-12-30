<!DOCTYPE html>
<html lang="en">
<head>
    <?php include("h_admin.php"); ?>
</head>
<body>
    <?php include("navbar_admin.php"); ?>
    <p></p>
    <div class="container-fluid">

    <!-------------------------------------------------------------------- LIST -------------------------------------------------------------------->

        <div class="row">
            <div class="col-3">
                <form class="d-flex" method="GET" action="list_type">
                    <input class="form-control me-2" type="search" name="search_type" placeholder="Search" aria-label="Search">
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
                        <h5 class="modal-title" id="addLabel">Add Type</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal was-validated" name="add" id="add" method="post" action="add_type.php">
                            <div class="form-floating">
                                <input class="form-control is-invalid" type="text" name="t_name" id="t_name" placeholder="Name" required>
                                <label for="t_name">Name</label>
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
            $search_type = (isset($_GET['search_type'])? $_GET['search_type'] : '');
            if($search_type!='')
            {
                include('search_type.php');
            }
            else
            {
                include('list_type_db.php');
            }
        ?>
    </div>
</body>
</htnl>