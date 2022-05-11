import 'package:get/get.dart';
import 'package:getx_state_management/controller/shopping_controller.dart';

class ShoppingBindings extends Bindings{
  @override
  void dependencies() {
    Get.create<ShoppingController>(() => ShoppingController(), permanent: false);
    Get.put<ShoppingController>(ShoppingController(), tag: 'total');
  }
}