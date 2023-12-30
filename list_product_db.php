<?php
    include('condb.php');

    $sql = "SELECT * FROM cs_product AS p INNER JOIN cs_type AS t ON p.t_id = t.t_id ORDER BY p_id ASC";
    $result = mysqli_query($con,$sql) or die ("Error in query: $sql ".mysqli_error());
?>

<!-------------------------------------------------------------------- LIST -------------------------------------------------------------------->

<table class="table table-hover">
    <thead>
        <tr class="table table-active" align="center">
            <th>ID</th>
            <th>Name</th>
            <th>Type</th>
            <th>Detail</th>
            <th>Price</th>
            <th>Amount</th>
            <th>View</th>
            <th>Image</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </thead>
    <?php foreach($result as $row) { ?>
        <tr align="center">
            <td><?php echo $row['p_id']; ?></td>
            <td><?php echo $row['p_name']; ?></td>
            <td><?php echo $row['t_name']; ?></td>
            <td align="left"><?php echo $row['p_detail']; ?></td>
            <td><?php echo number_format($row['p_price']); ?></td>
            <td>
                <font color="#10EC0F"><?php if($row['p_amount'] > 25) { echo $row['p_amount']; } ?></font>
                <font color="red"><?php if($row['p_amount'] <= 25) { echo $row['p_amount']; } ?></font>
            </td>
            <td><?php echo $row['p_view']; ?></td>
            <td><img src="img/ad/<?php echo $row['p_img']; ?>" width="100"></td>
            <td><a href="update_product.php?p_id=<?php echo $row['p_id'];?>" data-bs-toggle="modal" data-bs-target="#update<?php echo $row['p_id'];?>"><img src="img/logo/edit.png" width="18"></a></td>
            <td><a href="delete_product.php?p_id=<?php echo $row['p_id'];?>" data-bs-toggle="modal" data-bs-target="#delete<?php echo $row['p_id'];?>"><img src="img/logo/delete.png" width="20"></a></td>
        </tr>

    <!------------------------------------------------------------------ UPDATE ------------------------------------------------------------------>
        
        <div class="modal fade" id="update<?php echo $row['p_id'];?>" tabindex="-1" aria-labelledby="update<?php echo $row['p_id'];?>" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="update<?php echo $row['p_id'];?>">Edit Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal was-validated" name="update" id="update" method="post" enctype="multipart/form-data" action="update_product.php">
                            <div class="form-floating mb-2">
                                <input class="form-control is-valid" type="text" name="p_name" id="p_name" placeholder="Name" value="<?php echo $row['p_name'];?>" required>
                                <label for="p_name">Name</label>
                                <input class="form-control" type="hidden" name="p_id" id="p_id" value="<?php echo $row['p_id'];?>">
                            </div>
                            <div class="form-floating mb-2">
                                <select class="form-select is-valid" name="t_id" id="t_id" aria-label="Floating label select example" required>
                                    <option selected value="<?php echo $row['t_id'];?>"><?php echo $row['t_name'];?></option>
                                    <?php foreach ($result_type as $results) { ?>
                                        <option value="<?php echo $results['t_id'];?>"><?php echo $results['t_name'];?></option>
                                    <?php } ?>
                                </select>
                                <label for="t_id">Type</label>
                            </div>
                            <div class="form-floating mb-2">
                                <textarea class="form-control is-valid" name="p_detail" id="p_detail" style="height: 180px" placeholder="Detail" required><?php echo $row['p_detail']; ?></textarea>
                                <label for="p_detail">Detail</label>
                            </div>
                            <div class="form-floating mb-2">
                                <input class="form-control is-valid" type="text" name="p_price" id="p_price" placeholder="Price" value="<?php echo $row['p_price'];?>" required>
                                <label for="p_price">Price</label>
                            </div>
                            <div class="form-floating mb-2">
                                <input class="form-control is-valid" type="number" name="p_amount" id="p_amount" placeholder="Amount" min="0" value="<?php echo $row['p_amount'];?>" required>
                                <label for="p_amount">Amount</label>
                            </div>
                            <div class="form-group">
                                <label for="p_img"><b>Image</b></label><br>
                                <center><?php echo "<img src='img/ad/" .$row["p_img"]. "' width='100' >"; ?></center><br>
                                <input type="text" class="form-control" name="p_img" id="p_img" value="<?php echo $row['p_img']; ?>">
                                <input type="file" class="form-control is-invalid" name="p_img" id="p_img" value="<?php echo $p_img; ?>" required>
                            </div>
                    </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-success">Save</button>
                            </div>
                        </form>
                </div>
            </div>
        </div>

    <!------------------------------------------------------------------ DELETE ------------------------------------------------------------------>
        
        <div class="modal fade" id="delete<?php echo $row['p_id'];?>" tabindex="-1" aria-labelledby="delete<?php echo $row['p_id'];?>" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="delete<?php echo $row['p_id'];?>">Delete Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Confirm to delete Product <b><?php echo $row['p_name'];?></b> ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <a href="delete_product.php?p_id=<?php echo $row['p_id'];?>" class="btn btn-danger">Delete</a>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>
</table>