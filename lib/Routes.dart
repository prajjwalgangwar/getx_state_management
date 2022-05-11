import 'package:get/get.dart';
import 'package:getx_state_management/controller/landing_page_controller.dart';
import 'package:getx_state_management/controller/shopping_bindings.dart';
import 'package:getx_state_management/controller/shopping_controller.dart';
import 'package:getx_state_management/view/Home.dart';
import 'package:getx_state_management/view/LandingPage.dart';

class Routes{
  var routes = [
    GetPage(name: '/home', page: ()=>Home(), binding: ShoppingBindings(),),
    GetPage(name: '/landing_page', page: ()=>LandingPage(), bindings: [ShoppingBindings()]),
  ];
}