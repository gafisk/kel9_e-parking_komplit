<?php
include_once("function/helper.php");
session_start();
// include_once("function/koneksi.php");
if (isset($_SESSION["login"])) {
header("location: ".BASE_URL."masuk.php");
exit;
}
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Login</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="css/login.css">
    <!-- <script src="vendor/bootstrap/js/bootstrap.min.js"></script> -->
    <!-- <script src="/js/3.2.1/jquery.min.js"></script> -->
  </head>
  <body style="background-image: url(img/bg.jpg);">
    
    <div class="wrapper fadeInDown">
      <div id="formContent">
        <div class="fadeIn first">
          <img src="img/icon.png" width="100%" alt="User Icon" />
        </div>
        <form action="proseslogin.php" method="post">
          <?php $notif = isset($_GET["notif"]) ? $_GET["notif"] : false?>
          <?php if( $notif == true) : ?>
          <p id="pesan">Username dan Password salah<p>
            <?php endif; ?>
            <input type="text" id="login" class="fadeIn second" name="username" placeholder="Username" autocomplete="off">
            <input type="password" id="password" class="fadeIn third" name="password" placeholder="password"><br>
            <button type="submit" name="login" class="fadeIn fourth ">Login</button>
          </form>
          <div id="formFooter">
            <p class="underlineHover" href="#">Selamat datang di aplikasi parkir</p>
          </div>
        </div>
      </div>
    </body>
  </html>