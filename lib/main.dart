import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/Routes.dart';
import 'package:getx_state_management/controller/shopping_bindings.dart';
import 'package:getx_state_management/view/Home.dart';
import 'package:getx_state_management/view/LandingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx Management',
      initialRoute: '/landing_page',
      getPages: Routes().routes,
      home: LandingPage(),
    );
  }
}

