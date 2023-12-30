<!DOCTYPE html>
<html lang="en">
<head>
    <?php include("h_member.php"); ?>
</head>
<body>
    <?php
        SESSION_START();
        include("condb.php");
        $ID = $_SESSION['ID'];

        $sql = "SELECT * FROM cs_ordered AS o INNER JOIN cs_user AS u ON o.u_id = u.u_id WHERE o.u_id = '$ID'";
        $result = mysqli_query($con, $sql) or die ("Error in query: $sql" . mysqli_error());
    ?>

    <?php include("navbar_member.php"); ?>
    <p></p>
    <div class="container-fluid">
        <h1 align="center">Order Lists</h1>
        <p></p>
        <div class="row">
            <center>
                <div class="col-md-6">
                    <?php if(isset($_SESSION['success'])) { ?>
                        <div class="alert alert-success d-flex align-items-center" role="alert">
                        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                            <div>
                                <?php
                                    echo $_SESSION['success'];
                                    unset($_SESSION['success']);
                                ?>
                            </div>
                        </div>
                        <p></p>
                    <?php } ?>
                </div>
            </center>
        </div>
        <table class="table table-hover">
            <thead>
                <tr class="table table-active" align="center">
                    <th>Date</th>
                    <th>Product</th>
                    <th>Amount</th>
                    <th>Price</th>
                    <th>Status</th>
                    <th>Parcel Number</th>
                </tr>
            </thead>
            <?php foreach($result as $row) { ?>
                <tr align="center">
                    <td><?php echo $row['o_date']; ?></td>
                    <td><?php echo $row['o_product']; ?></td>
                    <td><?php echo $row['o_amount']; ?></td>
                    <td><?php echo number_format($row['total_price']); ?></td>
                    <td>
                        <b>
                            <font color="red"><?php if($row['o_status'] === "Waiting for order confirmation") { echo $row['o_status']; } ?></font>
                            <font color="orange"><?php if($row['o_status'] === "Order confirmed") { echo $row['o_status']; } ?></font>
                            <font color="green"><?php if($row['o_status'] === "The products has been delivered") { echo $row['o_status']; } ?></font>
                        </b>
                    </td>
                    <td><b><?php echo $row['parcel_number']; ?></b></td>
                </tr>
            <?php } ?>
        </table>
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