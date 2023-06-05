<?php
session_start();
error_reporting(0);
include_once('includes/config.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Shop Homepage</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
</head>

<body>
    <?php include_once('includes/header.php'); ?>
    <!-- Header-->
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">Online Shopping</h1>
                <!-- <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p> -->
            </div>
        </div>
    </header>
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 justify-content-center">
                <?php
                $query = mysqli_query($con, "SELECT products.id as pid,products.productImage1,products.productName,products.productPriceBeforeDiscount,products.productPrice FROM products ORDER BY pid DESC LIMIT 12");
                while ($row = mysqli_fetch_array($query)) {
                ?>
                    <div class="col mb-4">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="admin/productimages/<?php echo htmlentities($row['productImage1']); ?>" alt="<?php echo htmlentities($row['productName']); ?>" />
                            <!-- Product details-->
                            <div class="card-body">
                                <!-- Product name-->
                                <h5 class="card-title"><?php echo htmlentities($row['productName']); ?></h5>
                                <!-- Product price-->
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="text-decoration-line-through">₹<?php echo htmlentities($row['productPriceBeforeDiscount']); ?></span>
                                    <span class="fw-bold">₹<?php echo htmlentities($row['productPrice']); ?></span>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="product-details.php?pid=<?php echo htmlentities($row['pid']); ?>">View options</a>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
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
