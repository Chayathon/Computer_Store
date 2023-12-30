<?php
    require_once('condb.php');
    $query_type = "SELECT * FROM cs_type ORDER BY t_id ASC";
    $result_type = mysqli_query($con, $query_type) or die ("Error in query: $query_type" . mysqli_error());
?>

<nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand"><img src="img/logo/logo2.png" width="30" height="30"></a>&emsp;
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link active" href="index"><b>Home</b>&emsp;</a>
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
                            <li><a href="index.php?product=showbytype&t_id=<?php echo $row['t_id'];?>" class="dropdown-item">
                            <b><?php echo $row['t_name'];?></b></a></li>
                        <?php } ?>
                    </ul>
                </li>
                &emsp;
                <li class="nav-item">
                    <a class="nav-link" href="#" tabindex="0" data-bs-toggle="popover" data-bs-trigger="focus" title="Alert" data-bs-content="Please sign in"><b>Address</b></a>
                </li>
                &emsp;
                <li class="nav-item">
                    <a class="nav-link" href="#" tabindex="0" data-bs-toggle="popover" data-bs-trigger="focus" title="Alert" data-bs-content="Please sign in"><b>Carts</b></a>
                </li>
                &emsp;
                <li class="nav-item">
                    <a class="nav-link" href="#" tabindex="0" data-bs-toggle="popover" data-bs-trigger="focus" title="Alert" data-bs-content="Please sign in"><b>Order Lists</b></a>
                </li>
                &emsp;
                <li class="nav-item">
                    <a class="nav-link" href="contactus"><b>Contact Us</b></a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <form class="d-flex" method="GET" action="index.php">
                    <input class="form-control me-2" type="search" name="search" placeholder="Search" aria-label="Search">
                </form>
                &emsp;
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                        <img src="img/logo/account.png" width="28" height="28">
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-dark" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="signin">Sign In</a></li>
                        <li><a class="dropdown-item" href="signup">Sign Up</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>