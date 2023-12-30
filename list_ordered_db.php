<?php
    include('condb.php');

    $sql = "SELECT * FROM  cs_ordered AS o
    INNER JOIN cs_user AS u ON o.u_id = u.u_id
    INNER JOIN cs_address AS a ON o.a_id = a.a_id
    ORDER BY o_id ASC";
    $result = mysqli_query($con, $sql) or die ("Error in query: $sql ".mysqli_error());
?>

<!-------------------------------------------------------------------- LIST -------------------------------------------------------------------->

<table class="table table-hover">
    <thead>
        <tr class="table table-active" align="center">
            <th>ID</th>
            <th>Username</th>
            <th>Address</th>
            <th>Product</th>
            <th>Price</th>
            <th>Amount</th>
            <th>Total/Price</th>
            <th>Status</th>
            <th>Detail</th>
            <th>Delete</th>
        </tr>
    </thead>
    <?php foreach($result as $row) { ?>
        <tr align="center">
            <td><?php echo $row['o_id']; ?></td>
            <td><?php echo $row['u_user']; ?></td>
            <td><?php echo $row['a_sub']; ?></td>
            <td><?php echo $row['o_product']; ?></td>
            <td><?php echo $row['o_price']; ?></td>
            <td><?php echo $row['o_amount']; ?></td>
            <td><?php echo $row['total_price']; ?></td>
            <td>
                <?php if($row['o_status'] === "Waiting for order confirmation") { ?> <img src="img/logo/cross.png" width="20"> <?php } ?>
                <?php if($row['o_status'] === "Order confirmed") { ?> <img src="img/logo/correct.png" width="20"> <?php } ?>
                <?php if($row['o_status'] === "The products has been delivered") { ?> <img src="img/logo/delivered.png" width="20"> <?php } ?>
            </td>
            <td><a href="detail_ordered.php?o_id=<?php echo $row['o_id'];?>" data-bs-toggle="modal" data-bs-target="#detail<?php echo $row['o_id'];?>"><img src="img/logo/view.png" width="18"></a></td>
            <td><a href="delete_ordered.php?o_id=<?php echo $row['o_id'];?>" data-bs-toggle="modal" data-bs-target="#delete<?php echo $row['o_id'];?>"><img src="img/logo/delete.png" width="20"></a></td>
        </tr>

    <!------------------------------------------------------------------ DETAIL ------------------------------------------------------------------>
        
        <div class="modal fade" id="detail<?php echo $row['o_id'];?>" tabindex="-1" aria-labelledby="detail<?php echo $row['o_id'];?>" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detail<?php echo $row['o_id'];?>">Detail Ordered</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-3" align="center">
                                <b>Username</b><br><br>
                                <?php echo $row['u_user']; ?>
                            </div>
                            <div class="col-md-9" align="center">
                                <b>Address</b><br><br>
                                <?php echo $row['a_name']; ?>,&nbsp;<?php echo $row['a_phone']; ?>,&nbsp;<?php echo $row['a_sub']; ?>,&nbsp;<?php echo $row['a_district']; ?>,&nbsp;<?php echo $row['a_province']; ?>,&nbsp;<?php echo $row['a_zip']; ?>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-6" align="center">
                                <b>Product</b><br><br>
                                <?php echo $row['o_product']; ?>
                            </div>
                            <div class="col-md-2" align="center">
                                <b>Price</b><br><br>
                                <?php echo $row['o_price']; ?>
                            </div>
                            <div class="col-md-2" align="center">
                                <b>Amount</b><br><br>
                                <?php echo $row['o_amount']; ?>
                            </div>
                            <div class="col-md-2" align="center">
                                <b>Total/Price</b><br><br>
                                <?php echo $row['total_price']; ?>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-4" align="center">
                                <b>Bank</b><br><br>
                                <?php echo $row['o_bank']; ?>
                            </div>
                            <div class="col-md-4" align="center">
                                <b>Pay Date</b><br><br>
                                <?php echo $row['o_date']; ?>
                            </div>
                            <div class="col-md-4" align="center">
                                <b>Slip</b><br><br>
                                <img src="img/slip/<?php echo $row['o_slip']; ?>" width="300">
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <form method="post" action="update_ordered">
                                <div class="col-md-6">
                                    <b>Status Ordered</b><br><br>
                                    <div class="form-floating mb-3">
                                        <select class="form-select" name="o_status" id="o_status" aria-label="Floating label select example" required>
                                            <option selected value=""><?php echo $row['o_status']; ?></option>
                                                <option value="Waiting for order confirmation">Waiting for order confirmation</option>
                                                <option value="Order confirmed">Order confirmed</option>
                                                <option value="The products has been delivered">The products has been delivered</option>
                                        </select>
                                        <label for="o_status">Status Ordered</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <b>Parcel Number</b><br><br>
                                    <div class="form-floating">
                                        <input type="text" class="form-control" name="parcel_number" id="parcel_number" value="<?php echo $row['parcel_number']; ?>" placeholder="Parcel Number" <?php if($row['o_status'] == "Waiting for order confirmation") { ?> disabled <?php } ?>>
                                        <label for="parcel_number">Parcel Number</label>
                                        <input type="hidden" class="form-control" name="o_id" id="o_id" value="<?php echo $row['o_id']; ?>">
                                    </div>
                                </div>
                        </div>
                    </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-success" name="ordered">Save</button>
                                </div>
                            </form>
                </div>
            </div>
        </div>

    <!------------------------------------------------------------------ DELETE ------------------------------------------------------------------>
        
        <div class="modal fade" id="delete<?php echo $row['o_id'];?>" tabindex="-1" aria-labelledby="delete<?php echo $row['o_id'];?>" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="delete<?php echo $row['o_id'];?>">Delete Ordered</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Confirm to delete Ordered <b><?php echo $row['u_user'];?><br><?php echo $row['o_product'];?></b> ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <a href="delete_ordered?o_id=<?php echo $row['o_id'];?>" class="btn btn-danger">Delete</a>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>
</table>