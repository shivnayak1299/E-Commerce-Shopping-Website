<?php
session_start();
include_once('includes/config.php');

if (strlen($_SESSION['id']) == 0) {
    header('location:logout.php');
} else {
    if ($_SESSION['address'] == 0) {
        echo "<script type='text/javascript'> document.location ='checkout.php'; </script>";
        exit;
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Retrieve the payment ID, order ID, and signature from the query parameters
    $paymentId = $_GET['payment_id'];
    $orderId = $_GET['order_id'];
    $signature = $_GET['signature'];
    $orderno = mt_rand(100000000, 999999999);
    // Update the fields in the database
    $orderno = $orderno;
    $userid = $_SESSION['id'];
    $address = $_SESSION['address'];
    $totalamount = $_SESSION['gtotal'];
    $txntype = 'e-Wallet';
    $txnno = $paymentId;

    // Perform the database update
    $query = mysqli_query($con, "INSERT INTO orders (orderNumber, userId, addressId, totalAmount, txnType, txnNumber) 
        VALUES ('$orderno','$userid','$address','$totalamount','$txntype','$txnno')");

    if ($query) {
        $sql = "INSERT INTO ordersdetails (userId, productId, quantity) 
            SELECT userID, productId, productQty FROM cart WHERE userID='$userid';";
        $sql .= "UPDATE ordersdetails SET orderNumber='$orderno' WHERE userId='$userid' AND orderNumber IS NULL;";
        $sql .= "DELETE FROM cart WHERE userID='$userid'";
        $result = mysqli_multi_query($con, $sql);

        if ($result) {
            unset($_SESSION['address']);
            unset($_SESSION['gtotal']);
            header('location: my-orders.php'); // Redirect to my-orders.php after successful payment
            exit();
        } else {
            echo json_encode(array('success' => false, 'message' => 'Failed to update ordersdetails and cart.'));
        }
    } else {
        echo json_encode(array('success' => false, 'message' => 'Failed to insert into orders.'));
    }
} else {
    echo json_encode(array('success' => false, 'message' => 'Invalid request.'));
    header('location: payment.php'); // Redirect to payment.php in case of an invalid request
    exit();
}
?>
