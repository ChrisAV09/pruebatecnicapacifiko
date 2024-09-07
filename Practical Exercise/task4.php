<?php
    function bestproductssales($listproducts){
        $i = array();
        foreach($listproducts as $product){
            $quantity = $product['quantity'];
            if(isset($i[$quantity])){
                $i[$quantity]++;
            }else{
                $i[$quantity] = 1;
            }
        }
        return $i;
    }
?>