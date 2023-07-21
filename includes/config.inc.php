<?php
  session_start();
  $servername = "localhost"; //localhost id
  $dBUsername = "root"; //Database Username
  $dBPassword = "root"; //Database Password : Default-root
  $dBName = "gs_hostel"; //Database name
  // session_start();
  $conn=mysqli_connect($servername, $dBUsername, $dBPassword, $dBName, 3307);

  if (!$conn) {
    die("Connection Failed: ".mysqli_connect_error());
  }
?>
