<?php
    include('condb.php');

    $p_id = $_GET['p_id'];
    
    $sql = "DELETE FROM cs_product WHERE p_id = '$p_id'"; 
    $result = mysqli_query($con,$sql) or die ("Error in query: $sql ".mysqli_error());

    if($result)
    {
        echo "<script type='text/javascript'>";
        echo "window.history.back();";
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