// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx_state_management/controller/landing_page_controller.dart';
// import 'package:getx_state_management/view/Home.dart';
// import 'package:getx_state_management/view/MyCart.dart';
// import 'package:getx_state_management/view/TodoPage.dart';
//
// class LandingPage extends StatelessWidget{
//
//   LandingPageController landingPageController = Get.put(LandingPageController(), permanent: false);
//
//   LandingPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Obx(()=>SizedBox(
//         height: 54,
//         child: BottomNavigationBar(
//           onTap: (value) {
//             landingPageController.changeIndex(value);
//           },
//           currentIndex: landingPageController.tabIndex.value,
//           selectedItemColor: Colors.deepOrange.shade900,
//           unselectedItemColor: Colors.deepOrange.shade200,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
//             BottomNavigationBarItem(icon: Icon(Icons.list), label: 'todo'),
//             BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'cart'),
//             BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
//           ],
//         ),
//       )),
//       body: Obx(()=>IndexedStack(
//         index: landingPageController.tabIndex.value,
//         children: [
//           Home(),
//           TodoPage(),
//           MyCart(),
//           Home(),
//         ],
//       ),
//     ));
//   }
// }
