import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/splashscreen/splashscreen.dart';
import 'package:get_storage/get_storage.dart';

	Future<void> backgroundHandler(RemoteMessage message) async {
  	print(message.data.toString());
 	print(message.notification!.title);
	}
  

void main()async {
   await GetStorage.init();
   WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
 //   FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    
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