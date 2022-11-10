import 'package:flutter/material.dart';

import '../../controllers/auth_controller.dart';
import '../home/home.dart';
import '../login/login.dart';
import 'package:get/get.dart';

class Checkstatus extends StatelessWidget {
  const Checkstatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManagerController _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? Home() : Login();
    });
  }
}
