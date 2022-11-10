import 'dart:async';

import 'package:flutter/material.dart';

import '../../controllers/auth_controller.dart';
import '../login/login.dart';
import 'package:get/get.dart';

import 'checkstatus.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final AuthenticationManagerController _authmanager =
      Get.put(AuthenticationManagerController());

  void initState() {
    super.initState();
    initializeSettings();
  }

  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError)
            return errorView(snapshot);
          else
            return Checkstatus();
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          //color: Color.fromRGBO(108, 22, 162, 100),
          height: double.infinity,
          width: double.infinity,

          child: Image.asset(
            'images/valet app.jpg',
            fit: BoxFit.cover,
            // color: Color(0xff0d69ff).withOpacity(0.1),
            // colorBlendMode: BlendMode.softLight,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 250),
            new SvgPicture.asset(
              'imagessvg/Logosplash.svg',
              //   height: 20.0,
              // width: 20.0,
              //  allowDrawingOutsideViewBox: true,
            ),
            // Container(
            //   alignment: Alignment.center,
            //   child: Image.asset(
            //     'images/logo svg.png',
            //   ),
            // ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Divider(
                    color: Colors.white,
                    thickness: 1.0,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Valet Laundry Management',
                style: TextStyle(
                  // fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  //   color: Colors.black
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Divider(
            //     color: Colors.white,
            //     thickness: 1.0,
            //   ),
            // ),
            // SizedBox(height: 7),
            // Center(
            //   child: Text(
            //     'Valet Laundry Management',
            //     style: TextStyle(
            //       // fontWeight: FontWeight.w500,
            //       fontSize: 12.0,
            //       //   color: Colors.black
            //       color: Color.fromRGBO(255, 255, 255, 1),
            //     ),
            //   ),
            // ),
          ],
        )
      ],
    ));

    //    Container(
    //       height: double.infinity,
    //       width: double.infinity,
    //       child: FittedBox(child: Image.asset('images/Imageflash.png'),   fit: BoxFit.cover)),
    // );
  }
}
