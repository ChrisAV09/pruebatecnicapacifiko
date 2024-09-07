<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>task</title>
</head>
<body>
    <h1>
        Employee Salary
    </h1>
<?php
    $ch = curl_init();
    $url = 'http://dummy.restapiexample.com/api/v1/employees';

    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch,CURLOPT_HTTPGET,true);

    $response = curl_exec($ch);
    
    $i = 0;

    if($response === false){
        echo "Error: " . curl_error($ch);
    }else{
        $data = json_decode($response,true);
        if(isset($data['data']) && is_array($data['data'])){
                foreach($data['data'] as $employee){
                    if($employee['employee_salary'] > 300000){
                        echo "Name: ".$employee['employee_name']."&nbsp"."Salary: ".$employee['employee_salary']."<hr>";
                        $i++;
                    }
                }
                echo "<br>";
                echo "<h3>"."employees earning more than 300,000 are: ".$i."</h3>";
                
                
        }else{
                echo "non data";
        }
        
    }
        curl_close($ch);
    ?>
</body>
</html>