<?php
    include('condb.php');

    $numrand = (mt_rand());

    $p_id = $_POST['p_id'];
    $p_name = $_POST['p_name'];
    $t_id = $_POST['t_id'];
    $p_detail = $_POST['p_detail'];
    $p_price = $_POST['p_price'];
    $p_amount = $_POST['p_amount'];
    $p_img = (isset($_POST['p_img']) ? $_POST['p_img']: '');

    $upload = $_FILES["p_img"];

    if($upload <> '')
    {
        $path = "img/ad/";
        $type = strrchr($_FILES["p_img"]["name"], ".");
        $newname = "p_img".$numrand.$type;
        $path_copy = $path.$newname;
        $path_link = "p_img/".$newname;
    
        move_uploaded_file($_FILES["p_img"]["tmp_name"],$path_copy);
    }

    $sql = "UPDATE cs_product
    SET p_id = '$p_id',
        p_name = '$p_name',
        t_id = '$t_id',
        p_detail = '$p_detail',
        p_price = '$p_price',
        p_amount = '$p_amount',
        p_img = '$newname'
    WHERE p_id = '$p_id'";

    $result = mysqli_query($con, $sql) or die ("Error in query: $sql" . mysqli_error());

    mysqli_close($con);

    if($result)
    {
        echo "<script type='text/javascript'>";
        echo "window.location='list_product';";
        echo "</script>";
    }
    else
    {
        echo "<script type='text/javascript'>";
        echo "alert('ล้มเหลว');";
        echo "window.history.back();";
        echo "</script>";
    }
?>