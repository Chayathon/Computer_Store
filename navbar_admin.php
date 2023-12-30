<!DOCTYPE html>
<html lang="en">
<head>
    <?php
        SESSION_START();
        include("condb.php");

        $ID = $_SESSION['ID'];

        $query_name = "SELECT * FROM cs_user WHERE u_id = '$ID'";
        $result_name = mysqli_query($con,$query_name) or die ("Error in query: $query_name" . mysqli_error());
    
        while($row = mysqli_fetch_array($result_name))
        {
            $name = $row['u_user'];
        }
    ?>
</head>
<body>
    <nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark">
        <div class="container-fluid">
            <a data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                <img src="img/logo/sidebar.png" width="40">
            </a>
            <center>
                <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasExampleLabel" align="center"><font color="DDC488"><b>Admin : <?php echo $name;?></font></b></h5>
                    </div>
                    <div class="offcanvas-body">
                        <table class="table table-hover table-dark">
                            <tr align="center" valign="middle">
                                <th height="50"><a href="list_admin" style="text-decoration: none;"><font color="white">Manage Admin</font></a></th>
                            </tr>
                            <tr align="center" valign="middle">
                                <th height="50"><a href="list_member" style="text-decoration: none;"><font color="white">Manage Member</font></a></th>
                            </tr>
                            <tr align="center" valign="middle">
                                <th height="50"><a href="list_type" style="text-decoration: none;"><font color="white">Manage Type</font></a></th>
                            </tr>
                            <tr align="center" valign="middle">
                                <th height="50"><a href="list_product" style="text-decoration: none;"><font color="white">Manage Product</font></a></th>
                            </tr>
                            <tr align="center" valign="middle">
                                <th height="50"><a href="list_ordered" style="text-decoration: none;"><font color="white">Manage Ordered</font></a></th>
                            </tr>
                        </table>
                    </div>
                </div>
            </center>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="signout">Sign Out</a>
                </li>
            </ul>
        </div>
    </nav>
</body>
</html>