import 'package:get/get.dart';

class ShoppingController extends GetxController{
 var quantity = 0.obs;
 var total = 0.obs;

 addProduct(){
  quantity.value++;
 }
 removeProduct(){
  if(quantity.value > 1) {
   quantity.value--;
  }else{
   quantity.value = 0;
  }
 }
}

