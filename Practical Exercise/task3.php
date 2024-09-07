<?php
function add($id, $cant, $discount = 0){
    $res = 0;
    if($id > 0 && $can > 0 && is_numeric($cant) && is_numeric($discount) && $discount >= 0 && $discount <= 100){
        if(isset($_SESSION['shoppingcart']['products'][$id])){
            $_SESSION['shoppingcart']['products'][$id]['quantity'] = $cant;
            $_SESSION['shoppingcart']['products'][$id]['discount'] = $discount;
        } else {
           
            $_SESSION['shoppingcart']['products'][$id] = [
                'quantity' => $cant,
                'discount' => $discount
            ];
        }
    }
    

    $ttprice = 0;

    if(isset($_SESSION['shoppingcart']['products']) && is_array($_SESSION['shoppingcart']['products'])){
            foreach($_SESSION['shoppingcart']['products'] as $product){
                    $quantity = $product['quantity'];
                    $discount = $product['discount'];

                    $priceprod = getProductPrice($id);
                    $realprice = $priceprod * (1 - ($discount/100));
                    $totalprice += $realprice * $quantity;
            }
    }
    return $totalprice;
}

function getProductPrice($id){
    $products = [
        1 => 100, 
        2 => 150, 
        3 => 200, 
        4 => 250, 
    ];
    
    return isset($products[$id]) ? $products[$id] : 0;
}
?>