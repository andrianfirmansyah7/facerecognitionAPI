<?php
	$username = "root";
	$password = "";
	$database = "tugasakhir";
	$host = "localhost";

	$connect = mysqli_connect($host,$username,$password,$database);
    $verifQuery = "SELECT * FROM verifikasi";
	$hasil = mysqli_query($connect,$verifQuery); 
    $i = 1;
?>    
<html>
    <title>Rekap</title>
    <head>
    <title>Verifikasi Pemilih</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/webcamjs/1.0.25/webcam.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" />
    <style type="text/css">
        #results { padding:20px; border:1px solid; background:#ccc; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Pengujian Verifikasi Wajah Pemilih</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.php">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="rekap.php">Rekap</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
    <h1 class="text-center">Rekap</h1>
    <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">ID Pemilih</th>
      <th scope="col">Waktu Verifikasi</th>
      <th scope="col">Status</th>
      <th scope="col">TPS</th>
      <th scope="col">Evidence</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach($hasil as $hs){ ?>
    <tr>
      <th scope="row"><?php echo $i++ ?></th>
      <td><?php echo $hs['pemilih'] ?></td>
      <td><?php echo $hs['waktu_verifikasi'] ?></td>
      <td>Berhasil</td>
      <td><?php echo $hs['tps'] ?></td>
      <td><a href="/verifikasi/src/<?php echo $hs['evidence'] ?>"><?php echo $hs['evidence'] ?></a></td>
    </tr>
    <?php } ?>
  </tbody>
</table>
</div>
  
</html>    