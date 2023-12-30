<?php
    include('condb.php');

    $t_id = $_POST['t_id'];
    $t_name = $_POST['t_name'];

    $sql = "UPDATE cs_type
    SET t_id = '$t_id',
        t_name = '$t_name'
    WHERE t_id = '$t_id'";

    $result = mysqli_query($con, $sql) or die ("Error in query: $sql" . mysqli_error());

    mysqli_close($con);

    if($result)
    {
        echo "<script type='text/javascript'>";
        echo "window.location='list_type';";
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