import 'package:get/get.dart';
import 'package:getx_state_management/view/Home.dart';
import 'package:getx_state_management/view/TodoPage.dart';

class Routes{
  var routes = [
    GetPage(name: '/home', page: ()=>Home()),
    GetPage(name: '/todo', page: ()=>TodoPage()),
  ];
}