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
            <div class="col-12">
                <form class="d-flex" method="GET" action="list_ordered">
                    <input class="form-control me-2" type="search" name="search_ordered" placeholder="Search" aria-label="Search">
                </form>
            </div>
        </div>
        <p></p>

    <!------------------------------------------------------------------ LIST ------------------------------------------------------------------>

        <?php
            $search_ordered = (isset($_GET['search_ordered'])? $_GET['search_ordered'] : '');
            if($search_ordered!='')
            {
                include('search_ordered.php');
            }
            else
            {
                include('list_ordered_db.php');
            }
        ?>
    </div>
</body>
</htnl>