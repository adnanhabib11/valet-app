import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/splashscreen/splashscreen.dart';
import 'package:get_storage/get_storage.dart';
void main()async {
   await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}