<?php
session_start();
if(isset($_SESSION['uid'])){
    echo "";
    }else{
    header('location: ../index.php');
    }

?>
<?php
include('header.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pricing</title>
<style>
        body
        {
        background-image:url('images/back.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        }
    </style>
</head>
<body >
    <table width='30%' border="10px solid" style="margin-top:80px;margin-left:auto ;margin-right:auto ;font-weight:bold;border-spacing: 10px 10px;border-collapse: collapse;">
    <tr style="background-color: orange;font-size:30px">
    <th>Weight in Kg</th><th>Price</th>
    </tr>
    <tr>
    <td style="font-size:20px">0-10</td><td style="font-size:20px">1000</td>
    </tr>
    <tr>
    <td style="font-size:20px">11-20</td><td style="font-size:20px" >2000</td>
    </tr>
    <tr>
    <td style="font-size:20px">21-30</td><td style="font-size:20px">2500</td>
    </tr>
    <tr>
    <td style="font-size:20px">31-50</td><td style="font-size:20px">3000</td>
    </tr>
    <tr>
    <td style="font-size:20px">50-70</td><td style="font-size:20px">4000</td>
    </tr>
    <tr>
    <td style="font-size:20px">70-above</td><td style="font-size:20px">5000</td>
    </tr>
    </table>
    <h3 align="center" style="margin-top:20px;"> As per your courier's weight pay the amount on:</h3>
    <div style="margin-left:45% ;margin-right:auto ;font-weight:bold;">
    <ol>
    <li>UPI: rapidrunner@sbi.com</li>
    <li>GPay: 6362626782</li>
    <li>PhnPay: 9565656555</li>
    </ol>
    </div>
</body>
</html>