<?php
    $time = microtime();
    $time = explode(' ', $time);
    $time = $time[1] + $time[0];
    $start = $time;
    require __DIR__ . '/vendor/autoload.php';
    use GuzzleHttp\Client;

    $img = $_POST['image'];
    $folderPath = "src/";
  
    $image_parts = explode(";base64,", $img);
    $image_type_aux = explode("image/", $image_parts[0]);
    $image_type = $image_type_aux[1];
  
    $image_base64 = base64_decode($image_parts[1]);
    $fileName = uniqid() . '.jpg';
  
    $file = $folderPath . $fileName;
    file_put_contents($file, $image_base64);

 
    $client = new Client([
        'base_uri' => 'http://127.0.0.1:5000',
        // default timeout 5 detik
        'timeout'  => 5,
    ]);
     
    $response = $client->request('POST', '/recognition', [
        'json' => [
            'nik' => $_POST['nik'],
            'gambar' => $fileName,
            'tps' => 1
        ]
    ]);
    $body = $response->getBody();
    $body_array = json_decode($body);
    $a = $body_array->message;
    echo "<h1>".$a."</h1>";
    echo "Kembali ke menu <a href='index.php'>awal</a><br>";

    $time = microtime();
    $time = explode(' ', $time);
    $time = $time[1] + $time[0];
    $finish = $time;
    $total_time = round(($finish - $start), 4);
    echo 'Page generated in '.$total_time.' seconds.';
    
?>
