<?php
function add($id, $quantity){
    $res  = 0;
    if($id > 0 && $quantity > 0 && is_numeric(($quantity))){
        if(isset($_SESSION['shoppingcart']['products'][$id])){
            $_SESSION['shoppingcart']['products'][$id] = $quantity;
        } else {
            $_SESSION['shoppingcart']['products'][$id] = $quantity;
        }
    }

    $totalProducts = 0;

    if(isset($_SESSION['shoppingcart']['products']) && is_array($_SESSION['shoppingcart']['products'])){
        foreach($_SESSION['shoppingcart']['products'] as $producttt){
            $totalProducts += $producttt; 
        }
    }
    
    return $totalProducts;
}

?>