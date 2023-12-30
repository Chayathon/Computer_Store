<?php
    include('condb.php');

    $t_id = $_GET['t_id'];
    $sql = "SELECT * FROM cs_product AS p INNER JOIN cs_type AS t ON p.t_id = t.t_id WHERE p.t_id = $t_id ORDER BY p_id ASC";
    $result = mysqli_query($con, $sql) or die ("Error in query: $sql" . mysqli_error());
?>

<div class="container-fluid">
    <div class="row row-cols-1 row-cols-md-5 g-3">
        <?php foreach($result as $row) { ?>
            <div class="col">
                <div class="card h-100 border-dark mb-3">
                    <a href="product_detail?p_id=<?php echo $row['p_id']; ?>"><img src="img/ad/<?php echo $row['p_img'];?>" class="card-img-top" alt="Product" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Detail"></a>
                    <div class="card-body">
                        <h5 class="card-title"><?php echo $row['p_name']; ?></h5>
                        <p class="card-text">
                            <small><?php echo $row['p_detail']; ?></small>
                        </p>
                    </div>
                    <div class="card-footer" style="background:white;">
                        <center>
                            <a class="btn btn-primary" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart" href="signin"><img src="img/logo/cart.png" width="20" height="18">&ensp;&nbsp;<?php echo number_format($row['p_price']); ?>.-</h5></a>
                        </center>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
</div>