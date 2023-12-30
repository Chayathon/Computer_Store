<?php
    include('condb.php');
    $errors = array();

    if(isset($_POST['add']))
    {
        $t_name = mysqli_real_escape_string($con, $_POST["t_name"]);

        $type_check = "SELECT * FROM cs_type WHERE t_name = '$t_name'";
        $query = mysqli_query($con, $type_check);
        $result_check = mysqli_fetch_assoc($query);

        if($result_check)
        {
            if($result_check['t_name'] === $t_name)
            {
                array_push($errors, "Already have this type");
            }
        }
        
        if(count($errors) == 0)
        {
            $sql = "INSERT INTO cs_type(t_name)
            VALUES('$t_name')"; 
            $result = mysqli_query($con,$sql) or die ("Error in query: $sql ".mysqli_error());

            if($result)
            {
                echo "<script type='text/javascript'>";
                echo "window.location='list_type';";
                echo "</script>";
            }
        }

        if($result_check)
        {
            echo "<script type='text/javascript'>";
            echo "alert('Already have this type');";
            echo "window.history.back();";
            echo "</script>";
        }
    }
?>