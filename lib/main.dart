import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_state_management/Routes.dart';
import 'package:getx_state_management/view/Home.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  var mySystemOverlay = SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.yellow.shade50,
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: mySystemOverlay,
      child: GetMaterialApp(
        title: 'Getx',
        getPages: Routes().routes,
        home: Home(),
      ),
    );
  }
}

