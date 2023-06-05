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
?>

<html>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<script>
  var amountInPaise = <?php echo $_SESSION['gtotal'] * 100; ?>; // Convert rupees to paise

  var options = {
    "key": "rzp_test_CsC4RgMXy0rEXg", // Enter the Key ID generated from the Dashboard
    "amount": amountInPaise,
    "currency": "INR",
    "description": "SHIV",
    "image": "https://s3.amazonaws.com/rzp-mobile/images/rzp.jpg",
    "prefill": {
      "email": "shivshankarkumar281@gmail.com",
      "contact": "+919900000000"
    },
    "config": {
      "display": {
        "blocks": {
          "utib": { //name for Axis block
            "name": "Pay using Axis Bank",
            "instruments": [
              {
                "method": "card",
                "issuers": ["UTIB"]
              },
              {
                "method": "netbanking",
                "banks": ["UTIB"]
              }
            ]
          },
          "other": { // name for other block
            "name": "Other Payment modes",
            "instruments": [
              {
                "method": "card",
                "issuers": ["ICIC"]
              },
              {
                "method": "netbanking"
              }
            ]
          },
          "banks": { // name for banks block
            "name": "Methods with Offers",
            "instruments": [
              {
                "method": "wallet",
                "wallets": ["olamoney"]
              }
            ]
          },
          "mostUsed": { // name for mostUsed block
            "name": "Most Used Methods",
            "instruments": [
              {
                "method": "wallet",
                "wallets": ["freecharge"]
              },
              {
                "method": "upi"
              }
            ]
          }
        },
        "hide": [],
        "sequence": ["block.banks"],
        "preferences": {
          "show_default_blocks": true
        }
      }
    },
    "handler": function (response) {
      var paymentId = response.razorpay_payment_id;
      var orderId = response.razorpay_order_id;
      var signature = response.razorpay_signature;

      // Redirect to update_fields.php with payment details
      var redirectURL = "update_fields.php" +
        "?payment_id=" + encodeURIComponent(paymentId) +
        "&order_id=" + encodeURIComponent(orderId) +
        "&signature=" + encodeURIComponent(signature);
      window.location.href = redirectURL;
    },
    "modal": {
      "ondismiss": function () {
        if (confirm("Are you sure you want to close the form?")) {
          txt = "You pressed OK!";
          console.log("Checkout form closed by the user");
        } else {
          txt = "You pressed Cancel!";
          console.log("Complete the Payment");
        }
      }
    }
  };

  var rzp1 = new Razorpay(options);
  rzp1.open();
</script>
</html>
