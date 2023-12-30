<?php
    include('condb.php');

    $o_id = $_GET['o_id'];

    $sql = "DELETE FROM cs_ordered WHERE o_id = '$o_id'";
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