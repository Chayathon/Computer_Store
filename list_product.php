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
                <form class="d-flex" method="GET" action="list_product">
                    <input class="form-control me-2" type="search" name="search_product" placeholder="Search" aria-label="Search">
                </form>
            </div>
            <div class="col-8"></div>

        <!-------------------------------------------------------------------- ADD -------------------------------------------------------------------->

            <div class="col-1" align="right">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add">
                    Add
                </button>
            </div>
        </div>

        <?php
            $sql_type = "SELECT * FROM cs_type ORDER BY t_id ASC"; 
            $result_type = mysqli_query($con,$sql_type) or die ("Error in query: $sql_type ".mysqli_error());
        ?>

        <div class="modal fade" id="add" tabindex="-1" aria-labelledby="addLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addLabel">Add Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal was-validated" name="add" id="add" method="post" enctype="multipart/form-data" action="add_product.php">
                            <div class="form-floating mb-2">
                                <input class="form-control is-invalid" type="text" name="p_name" id="p_name" placeholder="Name" required>
                                <label for="p_name">Name</label>
                            </div>
                            <div class="form-floating mb-2">
                                <select class="form-select is-invalid" name="t_id" id="t_id" aria-label="Floating label select example" required>
                                    <option selected value="">Select Type</option>
                                    <?php foreach ($result_type as $results) { ?>
                                        <option value="<?php echo $results['t_id'];?>"><?php echo $results['t_name'];?></option>
                                    <?php } ?>
                                </select>
                                <label for="t_id">Type</label>
                            </div>
                            <div class="form-floating mb-2">
                                <textarea class="form-control is-invalid" name="p_detail" id="p_detail" style="height: 180px" placeholder="Detail" required></textarea>
                                <label for="p_detail">Detail</label>
                            </div>
                            <div class="form-floating mb-2">
                                <input class="form-control is-invalid" type="text" name="p_price" id="p_price" placeholder="Price" required>
                                <label for="p_price">Price</label>
                            </div>
                            <div class="form-floating mb-2">
                                <input class="form-control is-invalid" type="number" name="p_amount" id="p_amount" placeholder="Amount" min="0" required>
                                <label for="p_amount">Amount</label>
                            </div>
                            <div class="form-group">
                                <input class="form-control is-invalid" type="file" name="p_img" id="p_img" required>
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
            $search_product = (isset($_GET['search_product'])? $_GET['search_product'] : '');
            if($search_product!='')
            {
                include('search_product.php');
            }
            else
            {
                include('list_product_db.php');
            }
        ?>
    </div>
</body>
</html>