<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task2</title>
</head>
<body>
    <?php
        $ch = curl_init();
        $url = 'http://dummy.restapiexample.com/api/v1/create';
        $data = array(
            'id' => '25', 
            'employee_name' => 'Christopher Valencia',
            'employee_salary' => '205500',
            'employee_age' => '18',
            'profile_image' => ''
        );

        curl_setopt($ch,CURLOPT_URL,$url);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($ch,CURLOPT_POST,true);
        curl_setopt($ch,CURLOPT_POSTFIELDS,http_build_query($data));

        $response = curl_exec($ch);
        if($response === false){
            echo "error: ".curl_error($ch);
        }else{
            echo "Server request: ".$response;
        }
        curl_close($ch);
        
        //my user id is: 5236
        
    ?>
    
</body>
</html>
