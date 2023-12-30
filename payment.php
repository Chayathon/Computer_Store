<!DOCTYPE html>
<html lang="en">
<head>
    <?php
        SESSION_START();
        include("condb.php");
        include("h_member.php");
        ?>
</head>
<body>
    <?php
        $ID = $_SESSION['ID'];

        $sql = "SELECT * FROM cs_user WHERE u_id = '$ID'";
        $result = mysqli_query($con, $sql) or die ("Error in query: $sql ".mysqli_error());

        $sql_address1 = "SELECT * FROM cs_address WHERE u_id = '$ID'"; 
        $result_address1 = mysqli_query($con, $sql_address1) or die ("Error in query: $sql_address1 ".mysqli_error());
    ?>

    <?php include("navbar_member.php"); ?>
    <p></p>
    <div class="container-fluid">
        <h1 align="center">Payments</h1>
        <p></p>
        <form class="was-validated" name="cart" id="cart" method="post" action="payment">
            <table class="table">
                <thead>
                    <tr style="background:royalblue; color:white;" align="center">
                        <th width="70%">Product</th>
                        <th width="10%">Price</th>
                        <th width="10%">Amount</th>
                        <th width="10%">Total/Product</th>
                    </tr>
                </thead>

                <?php
                    $cost = 0;
                    foreach($_SESSION['cart'] as $p_id => $qty) { ?>

                        <?php
                            $sql = "SELECT * FROM cs_product WHERE p_id = '$p_id'";
                            $query = mysqli_query($con, $sql);
                            $row = mysqli_fetch_array($query);
                            $sum = $row['p_price'] * $qty;
                            $cost += $sum;
                            $delivery = + 100;
                            $total_price = $cost + $delivery;
                            $stock = $row['p_amount'] - $qty;
                            $o_product = $row['p_name'];
                            $o_price = $row['p_price'];
                            $o_amount = $qty;

                            if($stock < 0)
                            {
                                $_SESSION['error'] = "Not enough <b>$o_product</b> Product.";
                                echo "<script type='text/javascript'>";
                                echo "window.history.back();";
                                echo "</script>";
                            }
                        ?>

                        <tr>
                            <td><?php echo $row['p_name']; ?></td>
                            <td align="center">฿<?php echo number_format($row['p_price'],2); ?></td>
                            <td align="center"><?php echo $qty; ?></td>
                            <td align="center">฿<?php echo number_format($sum,2); ?></td>
                        </tr>
                        
                        <?php
                            if(isset($_POST['ordered']))
                            {
                                @$u_id = $_SESSION['ID'];
                                $a_id = $_POST['a_id'];
                                $o_bank = $_POST['o_bank'];
                                $o_date = $_POST['o_date'];
                                $o_slip = $_POST['o_slip'];
                                $ref = date('YmdHis');

                                $sql_insert = "INSERT INTO cs_ordered(u_id,a_id,o_product,o_amount,o_price,total_price,o_bank,o_date,o_slip,o_status,parcel_number,ref)
                                            VALUES('$u_id','$a_id','$o_product','$o_amount','$o_price','$sum','$o_bank','$o_date','$o_slip','Waiting for order confirmation','-','$ref')";
                                $result_insert = mysqli_query($con, $sql_insert) or die ("Error in query: $sql_insert" . mysqli_error());

                                if($result_insert)
                                {
                                    $sql_stock = "UPDATE cs_product
                                    SET p_amount = $stock
                                    WHERE p_id = '$p_id'";
                                    $result_stock = mysqli_query($con, $sql_stock) or die ("Error in query: $sql_stock" . mysqli_error());
                                    
                                    unset($_SESSION['cart']);
                                    $_SESSION['success'] = "Your order has been completed.";
                                    echo "<script type='text/javascript'>";
                                    echo "window.location='order_lists';";
                                    echo "</script>";
                                }
                            }
                        ?>
                    <?php } ?>

                    <tfoot>
                        <tr class='table-info'>
                            <td colspan='3'><b>Price</b></td>
                            <td align='center'><b>฿<?php echo number_format($cost,2); ?></b></td>
                        </tr>
                        <tr class='table-info'>
                            <td colspan='3'><b>Delivery Cost</b></td>
                            <td align='center'><b>฿<?php echo number_format($delivery,2); ?></b></td>
                        </tr>
                        <tr class='table-info'>
                            <td colspan='3'><b><b>Total Price</b></b></td>
                            <td align='center'><b><b>฿<?php echo number_format($total_price,2); ?></b></b></td>
                        </tr>
                    </tfoot>

            </table>

            <div class="row">
                <p>
                    <a class="btn btn-info" onclick="window.history.back();">
                        <img src="img/logo/back.png" width="20" height="20">&nbsp;Back
                    </a>
                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#pay">
                        Pay
                    </button>
                </p>
            </div>

            <div class="modal fade" id="pay" tabindex="-1" aria-labelledby="payLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="payLabel">Pay</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="was-validated" name="pay" id="pay" enctype="multipart/form-data" method="post" action="payment">
                                <div class="form-floating mb-3">
                                    <select class="form-select is-invalid" name="a_id" id="a_id" aria-label="Floating label select example" required>
                                        <option selected value="">Select Address</option>
                                        <?php foreach ($result_address1 as $results) { ?>
                                            <option value="<?php echo $results['a_id'];?>">- <?php echo $results['a_name']; ?>,&nbsp;<?php echo $results['a_phone']; ?>,&nbsp;<?php echo $results['a_sub']; ?>,&nbsp;<?php echo $results['a_district']; ?>,&nbsp;<?php echo $results['a_province']; ?>,&nbsp;<?php echo $results['a_zip']; ?></option>
                                        <?php } ?>
                                    </select>
                                    <label for="a_id">Address</label>
                                </div>
                                <div class="form-check" align="left">
                                    <input type="radio" class="form-check-input" name="o_bank" id="scb" value="scb" required>
                                    <label class="form-check-label" for="scb">ธ.ไทยพาณิชย์ 728-2-62409-6 (นางสาวนิรวรรณ บุญทูป)</label>
                                </div>
                                <div class="form-check mb-3" align="left">
                                    <input type="radio" class="form-check-input" name="o_bank" id="kbank" value="kbank" required>
                                    <label class="form-check-label" for="kbank">ธ.กสิกรไทย 086-2-10519-2 (นางสาวสุดารัตน์ ดวงสุข)</label>
                                    <div class="invalid-feedback">Please select a payment account.</div>
                                </div>
                                <p align="left">Payment date : 
                                    <input type="date" name="o_date" id="o_date" value="<?php echo date('Y-m-d');?>">
                                    <label for="o_date"></label>
                                </p>
                                <div>
                                    <input type="file" class="form-control" name="o_slip" id="o_slip" accept="image/jpeg, image/png" aria-label="file example" required>
                                    <div class="invalid-feedback">Proof of payment.</div>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="hidden" name="o_price" id="o_price" value="<?php echo $o_price; ?>">
                                    <input class="form-control" type="hidden" name="total_price" id="total_price" value="<?php echo $total_price; ?>">
                                </div>
                        </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-success" name="ordered">Order</button>
                                </div>
                            </form>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>