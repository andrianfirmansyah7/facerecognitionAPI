<?php
    $time = microtime();
    $time = explode(' ', $time);
    $time = $time[1] + $time[0];
    $start = $time;
    require __DIR__ . '/vendor/autoload.php';
    use GuzzleHttp\Client;

    $connect = mysqli_connect('localhost','root','','tugasakhir');
    $nik = $_POST['nik'];
    $query1 = "SELECT * FROM pemilih WHERE id = '$nik' AND tps = 1";
    $hasil = mysqli_query($connect,$query1); 
    if(mysqli_fetch_array($hasil) == null){
        echo "NIK tidak ditemukan";
    }
    else{
        $query2 = "SELECT * FROM verifikasi WHERE pemilih = '$nik'";
        $hasil2 = mysqli_query($connect,$query2);
        if(mysqli_fetch_array($hasil2) == null){
            echo "Anda sudah pernah melakukan verifikasi";
        }else{
            foreach($hasil as $hs) {
            $fotoktp = $hs['foto_ktp'];
            }
            $gambarktp = mysqli_fetch_array($hasil);
            $img = $_POST['image'];
            $folderPath = "src/";
        
            $image_parts = explode(";base64,", $img);
            $image_type_aux = explode("image/", $image_parts[0]);
            $image_type = $image_type_aux[1];
        
            $image_base64 = base64_decode($image_parts[1]);
            $fileName = uniqid() . '.jpg';
        
            $file = $folderPath . $fileName;
            file_put_contents($file, $image_base64);
            
            $img = file_get_contents('http://127.0.0.1/dataset/'.$fotoktp);
            $data = base64_encode($img);
            $base64 = "data:image/jpeg;base64,".$data;
        
            $client = new Client([
                'base_uri' => 'http://127.0.0.1:5000',
                // default timeout 5 detik
                'timeout'  => 5,
            ]);
          
            $response = $client->request('POST', '/verify', [
                'json' => [
                    'model_name' => 'Facenet512',
                    'img1' => "a",
                    'img2' => "b"
                ]
            ]);

            $body = $response->getBody();
            $body_array = json_decode($body);
            $a = json_decode($body_array);
            $hasil = $a->verified;
            echo "<h1>".$hasil."</h1>";
            echo "Kembali ke menu <a href='index.php'>awal</a><br>";
        
            $time = microtime();
            $time = explode(' ', $time);
            $time = $time[1] + $time[0];
            $finish = $time;
            $total_time = round(($finish - $start), 4);
            echo 'Page generated in '.$total_time.' seconds.';    
    }
}

?>
