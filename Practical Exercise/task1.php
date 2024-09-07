<?php
$connec = mysqli_connect("host","user","pass","grocerystore");
if($connec -> connect_errno){
    die("have a problem");
}

if(isset($_GET['submit'])){
    $search = $connec->real_escape_string($_GET['text']);
    $cons = $connec->query("SELECT * FROM products WHERE product_name LIKE '%text%'");
    while($row = $cons -> fetch_array()){
        echo $row['product_name'].'<br>';
    }
}
$connec->close();
?>