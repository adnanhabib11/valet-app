import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class InputVaildation extends GetxController {
  bool validateField(String title, String value) {
    if (value.trim().isNotEmpty) {
      return true;
    }

    Get.snackbar(
      "$title",
      "Field is empty",
      snackPosition: SnackPosition.BOTTOM,
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
    );
    return false;
  }
}
