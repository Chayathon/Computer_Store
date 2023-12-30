<?php
    include('condb.php');

    $t_id = $_GET['t_id'];

    $sql = "DELETE FROM cs_type WHERE t_id = '$t_id'";
    $result = mysqli_query($con, $sql) or die ("Error in query: $sql" . mysqli_error());

    mysqli_close($con);

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