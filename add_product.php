<?php
    include('condb.php');
    $errors = array();

    if(isset($_POST['add']))
    {
        $p_name = mysqli_real_escape_string($con, $_POST["p_name"]);
        $t_id = mysqli_real_escape_string($con, $_POST["t_id"]);
        $p_detail = mysqli_real_escape_string($con, $_POST["p_detail"]);
        $t_id = mysqli_real_escape_string($con, $_POST["t_id"]);
        $p_price = mysqli_real_escape_string($con, $_POST["p_price"]);
        $p_amount = mysqli_real_escape_string($con, $_POST["p_amount"]);
        $p_img = (isset($_POST['p_img']) ? $_POST['p_img']: '');

        $numrand = (mt_rand());
        $upload = $_FILES["p_img"];

        $product_check = "SELECT * FROM cs_product WHERE p_name = '$p_name' AND p_detail = '$p_detail'";
        $query = mysqli_query($con, $product_check);
        $result_check = mysqli_fetch_assoc($query);

        if($result_check)
        {
            if($result_check['p_name'] === $p_name)
            {
                array_push($errors, "Already have this product");
            }

            if($result_check['p_detail'] === $p_detail)
            {
                array_push($errors, "Already have this product");
            }
        }

        if(count($errors) == 0)
        {
            if($upload <> '')
            {
                $path = "img/ad/";
                $type = strrchr($_FILES["p_img"]["name"], ".");
                $newname = "p_img".$numrand.$type;
                $path_copy = $path.$newname;
                $path_link = "p_img/".$newname;

                move_uploaded_file($_FILES["p_img"]["tmp_name"],$path_copy);
            }
            
            $sql = "INSERT INTO cs_product(p_name,t_id,p_detail,p_price,p_amount,p_view,p_img)
            VALUES('$p_name','$t_id','$p_detail','$p_price','$p_amount','0','$newname')";
            $result = mysqli_query($con,$sql) or die ("Error in query: $sql ".mysqli_error());

            if($result)
            {
                echo "<script type='text/javascript'>";
                echo "window.location='list_product';";
                echo "</script>";
            }
        }

        if($result_check)
        {
            echo "<script type='text/javascript'>";
            echo "alert('Already have this product');";
            echo "window.history.back();";
            echo "</script>";
        }
    }
?>