<?php session_start();
include_once('includes/config.php');
error_reporting(0);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Shopping Portal | Category wise Shop</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
<?php include_once('includes/header.php'); ?>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">About Us</h1>
        </div>
    </div>
</header>
<!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-1 justify-content-center">
            <div class="col-lg-8">
                <p class="lead">
                    E-commerce is revolutionizing the way we all shop in India. Why hop from one store to another in search of the latest phone when you can find it on the Internet in a single click? At Shopping Portal, we offer a wide range of products, from trending electronics like laptops, tablets, smartphones, and mobile accessories to in-vogue fashion staples like shoes, clothing, and lifestyle accessories. We also provide modern furniture, home appliances, home furnishings, toys, musical instruments, and much more. Whatever you need, you can find it here.
                </p>
                <p class="lead">
                    What sets us apart is our commitment to convenience. With our user-friendly website, you can shop from the comfort of your home, at any time of the day. Whether it's early morning or late at night, our e-commerce platform is always open. No more rushing to stores or dealing with crowded malls. Shop in your pajamas and enjoy a hassle-free shopping experience.
                </p>
                <p class="lead">
                    We take pride in offering competitive prices and attractive discounts throughout the year. Our shopping festivals and events are designed to make your shopping experience even more rewarding. You'll find irresistible deals and a wide range of products to choose from. Why settle for less when you can shop with confidence at Shopping Portal?
                </p>
                <p class="lead">
                    So, why wait? Start exploring our vast collection of products and enjoy a seamless shopping experience like never before. We're here to make your online shopping journey enjoyable, convenient, and affordable. Happy shopping!
                </p>
            </div>
        </div>
    </div>
</section>
<!-- Footer-->
<?php include_once('includes/footer.php'); ?>
<!-- Bootstrap core JS-->
<script src="js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
