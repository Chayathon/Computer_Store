<!DOCTYPE html>
<html lang="en">
<head>
    <?php
        SESSION_START();
        include('h_member.php');
    ?>
</head>
<body>
    <?php
        include('condb.php');
        $p_id = $_GET['p_id'];

        $sql = "SELECT * FROM cs_product AS p INNER JOIN cs_type AS t
        ON p.t_id = t.t_id WHERE p_id = '$p_id' ORDER BY p_id ASC";
        $result = mysqli_query($con, $sql) or die ("Error in query: $sql" . mysqli_error());

        $sql_update = "UPDATE cs_product
        SET p_view = p_view + 1
        WHERE p_id = '$p_id'";
        $result_update = mysqli_query($con, $sql_update) or die ("Error in query: $sql_update" . mysqli_error());
    ?>

    <?php include('navbar_member.php');?>
        <?php foreach($result as $row) { ?>
            <div class="container-fluid" style="margin-top: 100px">
                <div class="row">
                    <div class="col-md-6">
                        <div class="polaroid">
                            <center>
                                <img src="img/ad/<?php echo $row['p_img'];?>" width="60%">
                            </center>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h4><b><?php echo $row['p_name'];?></h4><br>
                                <?php echo $row['p_detail'];?><br><br></b>
                        <font color="gray">
                            <small>
                                <img src="img/logo/stock.png" width="20">&ensp;<?php echo $row['p_amount'];?><br>
                                <img src="img/logo/view.png" width="20">&ensp;<?php echo $row['p_view'];?>
                            </small>
                        </font><br><br>
                        <a class="btn btn-info btn-lg" onclick="window.history.back();"><img src="img/logo/back.png" width="20" height="20">&nbsp;Back</img></a>
                        &emsp;
                        <a class="btn btn-success btn-lg" href="cart?p_id=<?php echo $row['p_id'];?>&product=add"><img src="img/logo/cart.png" width="20" height="18">&ensp;<b><?php echo number_format($row['p_price']); ?>.-</b></h5></a>
                    </div>
                </div>
            </div>
        <?php } ?>
</body>
</html>