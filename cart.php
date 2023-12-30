<!DOCTYPE html>
<html lang="en">
<head>
    <?php
        SESSION_START();
        include("h_member.php");
        ?>
</head>
<body>
    <?php include('navbar_member.php');?>
    <p></p>
    <div class="container-fluid">
        <?php
            @$p_id = $_GET['p_id'];
            @$product = $_GET['product'];

            if(@$product == 'add' && !empty($p_id))
            {
                if(isset($_SESSION['cart'][$p_id]))
                {
                    $_SESSION['cart'][$p_id]++;
                }
                else
                {
                    $_SESSION['cart'][$p_id]=1;
                }
            }

            if(@$product == 'remove' && !empty($p_id))
            {
                unset($_SESSION['cart'][$p_id]);
            }
            
            if(@$product == 'update')
            {
                $amount_array = $_POST['amount'];
                foreach($amount_array as $p_id=>$amount)
                {
                    $_SESSION['cart'][$p_id]=$amount;
                }
            }
        ?>

        <h1 align="center">Carts</h1>
        <p></p>
        <div class="row">
            <center>
                <div class="col-md-6">
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
                        <p></p>
                    <?php } ?>
                </div>
            </center>
        </div>
        <form name="cart" id="cart" method="post" action="?product=update">
            <table class="table table-hover">
                <thead style="background:royalblue; color:white;" align="center">
                    <tr style="background:royalblue; color:white;" align="center">
                        <th width="60%">Product</th>
                        <th width="12%">Price</th>
                        <th width="10%">Amount</th>
                        <th width="12%">Total/Product</th>
                        <th width="6%">Remove</th>
                    </tr>
                </thead>

                <?php
                    $cost = 0;
                    if(!empty($_SESSION['cart']))
                    {
                        include('condb.php');
                        foreach($_SESSION['cart'] as $p_id => $qty)
                        {
                            $sql = "SELECT * FROM cs_product WHERE p_id = '$p_id'";
                            $query = mysqli_query($con, $sql);
                            $row = mysqli_fetch_array($query);
                            $sum = $row['p_price'] * $qty;
                            $cost += $sum;
                            $delivery = + 100;
                            $total = $cost + $delivery;

                            echo "<tbody>";
                                echo "<tr>";
                                    echo "<td>" .$row['p_name']. "</td>";
                                    echo "<td align='center'>฿" .number_format($row['p_price'],2). "</td>";
                                    echo "<td align='center'>";
                                    echo "<input type='number' name='amount[$p_id]' value='$qty' min='1' max='99' size='0.5'/></td>";
                                    echo "<td align='center'>฿" .number_format($sum,2). "</td>";
                                    echo "<td align='center'><a href='cart?p_id=$p_id&product=remove'><img src='img/logo/delete.png' width='20'></a></td>";
                                echo "</tr>";
                        }
                        echo "<tbody>";
                            echo "<tr class='table-info'>";
                                echo "<th colspan='4'>Price</th>";
                                echo "<th>฿" .number_format($cost,2). "</th>";
                            echo "</tr>";
                            echo "<tr class='table-info'>";
                                echo "<th colspan='4'>Delivery Cost</th>";
                                echo "<th>฿" .number_format($delivery,2). "</th>";
                            echo "</tr>";
                            echo "<tr class='table-info'>";
                                echo "<th colspan='4'><b>Total Price</b></th>";
                                echo "<th>"."<b>฿" .number_format($total,2). "</b>"."</th>";
                            echo "</tr>";
                        echo "</tbody>";
                    }
                    else
                    {
                        echo "<tr align='center'>";
                            echo "<th colspan='5'><font color='red'>-&emsp;Your carts is empty&emsp;-</font></th>";
                        echo "</tr>";
                    }
                ?>
                <tfoot>
                    <tr>
                        <td><a class="btn btn-info" onclick="window.history.back();"><img src="img/logo/back.png" width="20" height="20">&nbsp;Back</img></a></td>
                        <td colspan="4" align="right">
                            <input class="btn btn-warning" type="submit" name="button" value="Update" <?php if(empty($_SESSION['cart'])) { ?> disabled <?php } ?>>
                            &nbsp;
                            <input class="btn btn-success" type="button" name="submit" value="Check Bill"<?php if(empty($_SESSION['cart'])) { ?> disabled <?php } ?> onclick="window.location='payment';">
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
    </div>
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