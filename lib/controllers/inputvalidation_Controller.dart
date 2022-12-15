import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class InputVaildation extends GetxController {
  bool validateField(String title, String value) {
    if (value.trim().isNotEmpty) {
      return true;
    }

    Get.snackbar(
      "$title",
      "$title field is required",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color.fromARGB(255, 236, 69, 57),
    );
    return false;
  }

  bool showsnack(String value) {
    print("DDDDDDDDDDDDDDDDDDD$value");
    if (value.trim().isEmpty) {
      return true;
    }

    Get.snackbar(
      "Error",
      "$value",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color.fromARGB(255, 236, 69, 57),
    );
    return false;
  }

  bool changestatus(String value) {
    print("DDDDDDDDDDDDDDDDDDD$value");
    if (value.trim().isEmpty) {
      return true;
    }

    Get.snackbar("Change Order Status", "$value",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 43, 187, 48));
    return false;
  }
}
