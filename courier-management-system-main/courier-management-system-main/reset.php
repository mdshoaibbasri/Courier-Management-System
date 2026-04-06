<?php

include('dbconnection.php');
session_start();
$gd = $_SESSION['gid'];

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Set Pswd</title>
    <style>
        body {
            background-image: url('images/reset2.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            margin-left: 30px;
        }

    </style>
</head>

<body>
    <form action="reset.php" method="POST">
        <table border="0px solid" style="margin-left: auto; margin-right:10px; margin-top:140px; font-weight:bold;border-spacing: 50px 30px;">
            <th colspan="3" style="text-align: center;color:blue;font-size:35px; width: 300px; height: 70px;font-weight:bold;">TIME TO RESET PASSWORD</th>
            <tr>
                <td colspan="2" style="font-size: 20px;color:blue;font-weight:bold">New Password</td>
                <td><input type="password" name="pass" placeholder="Enter new password" style="font-size: 10px;color:red;font-weight:bold" required /></td>
            </tr>

            <tr>
                <td colspan="3" align="center">
                    <input type="submit" name="submit" value="Update" style="background-color:orange; border-radius: 30px; width: 140px; height: 30px;" />
                </td>
            </tr>
        </table>

    </form>
</body>

</html>

<?php

if (isset($_POST['submit'])) {

    $password = $_POST['pass'];

    $qryd = "UPDATE `login` SET `password` = '$password' WHERE `u_id` = '$gd'";
    $run = mysqli_query($dbcon, $qryd);

    if ($run == true) {
        ?> <script>
            alert('Password Updated Successfully 🤩');
            window.open('logout.php', '_self');
            </script>
        <?php
    }
}
?>