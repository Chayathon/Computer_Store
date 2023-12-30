<?php
    include('condb.php');

    $u_id = $_GET['u_id'];

    $sql = "DELETE FROM cs_user WHERE u_id = '$u_id'";
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