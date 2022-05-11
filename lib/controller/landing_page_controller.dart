import 'package:get/get.dart';

class LandingPageController extends GetxController{
  var tabIndex = 0.obs;

  void changeIndex(int index){
    tabIndex.value = index;
  }
}

// class LandingPageBinding extends Bindings{
//   @override
//   void dependencies() {
//     Get.put(LandingPageController(), permanent: false);
//   }
// }