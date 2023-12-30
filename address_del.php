<?php
    SESSION_START();
    include('condb.php');

    $a_id = $_GET['a_id'];

    $sql = "DELETE FROM cs_address WHERE a_id = '$a_id'";
    $result = mysqli_query($con, $sql) or die ("Error in query: $sql" . mysqli_error());

    mysqli_close($con);

    if($result)
    {
        $_SESSION['success'] = "The Address has been deleted.";
        echo "<script type='text/javascript'>";
        echo "window.history.back();";
        echo "</script>";
    }
    else
    {
        echo "<script type='text/javascript'>";
        echo "alert('Failed');";
        echo "window.history.back();";
        echo "</script>";
    }
?>