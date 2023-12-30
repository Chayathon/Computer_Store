<?php
    include("condb.php");

    $query_type = "SELECT * FROM cs_type ORDER BY t_id ASC";
    $result_type = mysqli_query($con, $query_type) or die ("Error in query: $query_type" . mysqli_error());
    
    $ID = $_SESSION['ID'];
    $query_name = "SELECT * FROM cs_user WHERE u_id = '$ID'";
    $result_name = mysqli_query($con, $query_name) or die ("Error in query: $query_name" . mysqli_error());
    
    while($row = mysqli_fetch_array($result_name))
    {
        $username = $row['u_user'];
    }
?>

<nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand"><img src="img/logo/logo2.png" width="30" height="30"></a>&emsp;
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link active" href="member"><b>Home</b>&emsp;</a>
            </li>
        </ul>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <b>Product Lists</b>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdownMenuLink">
                        <?php foreach($result_type as $row) { ?>
                            <li><a href="member?product=showbytype&t_id=<?php echo $row['t_id'];?>" class="dropdown-item">
                            <b><?php echo $row['t_name'];?></b></a></li>
                        <?php } ?>
                    </ul>
                </li>
                &emsp;
                <li class="nav-item">
                    <a class="nav-link" href="address"><b>Address</b></a>
                </li>
                &emsp;
                <li class="nav-item position-relative">
                    <a class="nav-link" href="cart">
                        <b>
                            Carts
                            <?php if(!empty($_SESSION['cart'])) { ?>
                                <span class="position-absolute translate-bottom p-1 bg-danger border border-light rounded-circle">
                                    <span class="visually-hidden">New alerts</span>
                                </span>
                            <?php } ?>
                        </b>
                    </a>
                </li>
                &emsp;
                <li class="nav-item">
                    <a class="nav-link" href="order_lists"><b>Order Lists</b></a>
                </li>
                &emsp;
                <li class="nav-item">
                    <a class="nav-link" href="contactus_member"><b>Contact Us</b></a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <form class="d-flex" method="GET" action="index.php">
                    <input class="form-control me-2" type="search" name="search" placeholder="Search" aria-label="Search">
                </form>
                &emsp;
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                        <font color="cyan"><b><?php echo $username;?></b></font>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-dark" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="member_update">Edit Profile</a></li>
                        <li><a class="dropdown-item" href="signout">Sign Out</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>