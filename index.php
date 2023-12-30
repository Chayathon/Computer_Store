<!DOCTYPE html>
<html lang="en">
<head>
    <?php
        SESSION_START();
        include("head.php");
    ?>
</head>
<body>
    <?php include("navbar.php"); ?>
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/banner/banner001.jpeg" class="d-block w-100">
            </div>
            <div class="carousel-item">
                <img src="img/banner/banner002.jpeg" class="d-block w-100">
            </div>
            <div class="carousel-item">
                <img src="img/banner/banner003.jpeg" class="d-block w-100">
            </div>
            <div class="carousel-item">
                <img src="img/banner/banner004.jpeg" class="d-block w-100">
            </div>
            <div class="carousel-item">
                <img src="img/banner/banner005.jpeg" class="d-block w-100">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <p></p>
    <?php
        $product = (isset($_GET['product'])? $_GET['product'] : '');
        $search = (isset($_GET['search'])? $_GET['search'] : '');
        if($product == 'showbytype')
        {
            include('product_type.php');
        }
        elseif($search!='')
        {
            include('product_search.php');
        }
        else
        {
            include('product.php');
        }
    ?>

    <script>
        var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
        var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
            return new bootstrap.Popover(popoverTriggerEl)
        })
    </script>

    <script>
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        })
    </script>
</body>
</html>