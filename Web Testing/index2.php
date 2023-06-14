<!DOCTYPE html>
<html>
<head>
    <title>Capture webcam image with php and jquery - ItSolutionStuff.com</title>
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
      </ul>
    </div>
  </div>
</nav>

<div class="container">
    <h1 class="text-center">Pengujian Verifikasi Wajah</h1>
   
        <div class="row">
        <form method="POST" action="storeBase64.php">
        <div class="col-md-12">    
            <table>
                <tr>
                    <td style="padding:5px"><div id="my_camera"></div></td>
                    <td><div id="results">Preview...</div></td>    
                </tr>
            </table>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="mb-3">
                    <label for="NIK" class="form-label">NIK</label>
                    <input type="text" class="form-control" id="NIK" name="nik" aria-describedby="NIK" required>
                    <div id="emailHelp" class="form-text">Masukkan NIK dengan Benar.</div>
                </div>
                <input type="hidden" name="image" class="image-tag" required>
                <input type="button" class="btn btn-primary" value="Ambil Gambar" onClick="take_snapshot()">
                
                <button class="btn btn-success">Submit</button>
            </div>
        </div>
    </form>
</div>
  

<!-- <div class="container">
<div class="row" style="margin-top:20px">
    <div class="col-3"></div>
    <div class="col-6">    
    <h1>Verifikasi Pemilih</h1>
    </div>
    <div class="col-3"></div>
</div>   
    <form method="POST" action="storeImage.php">
        <div class="row">
            <div class="col-8">
                <div id="my_camera"></div>
                <br/>
                <input type=button value="Take Snapshot" onClick="take_snapshot()">
                <input type="hidden" name="image" class="image-tag">
                <input type="text" name="nik">
            </div>
            <div class="col-md-12 text-center">
                <br/>
                <button class="btn btn-success">Submit</button>
            </div>
            <div id="results">Your captured image will appear here...</div>
        </div>
    </form>
</div> -->
  
<!-- Configure a few settings and attach camera -->
<script language="JavaScript">
    Webcam.set({
        width: 640,
        height: 480,
        image_format: 'jpeg',
        jpeg_quality: 90
    });
  
    Webcam.attach( '#my_camera' );
  
    function take_snapshot() {
        Webcam.snap( function(data_uri) {
            $(".image-tag").val(data_uri);
            document.getElementById('results').innerHTML = '<h3>Preview</h1> <img src="'+data_uri+'" style="width:360px;height:240px"/>';
        } );
    }
</script>
 
</body>
</html>