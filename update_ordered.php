<?php
    include("condb.php");

    if(isset($_POST['ordered']))
    {
        $o_id = $_POST['o_id'];
        $o_status = $_POST['o_status'];
        $parcel_number = $_POST['parcel_number'];

        $sql = "UPDATE cs_ordered
                SET o_id = '$o_id',
                    o_status = '$o_status',
                    parcel_number = '$parcel_number'
                WHERE o_id = '$o_id'";
        $result = mysqli_query($con, $sql) or die ("Error in query: $sql" . mysqli_error());

        if($result)
        {
            echo "<script type='text/javascript'>";
            echo "window.location='list_ordered';";
            echo "</script>";
        }
    }
?>