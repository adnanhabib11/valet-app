import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../models/orderstatus_model.dart';
import '../views/login/login.dart';
import '../views/services.dart';
import 'auth_controller.dart';
import 'inputvalidation_Controller.dart';
import 'order_controller.dart';

class OrderStatus extends GetxController {
  final auth_controller = Get.put(AuthenticationManagerController());
  var orderstatus = <OrderStatusCheck>[].obs;
  final home_controller = Get.put(OrderController());
  var isLoading = true.obs;
  services request = services();
  final validation_controller = Get.put(InputVaildation());
  // final RxString rxstring = "".obs;
  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchorderstatus();
  // }
  Future<void> fetchorderstatus(var id, var index, var status) async {
    print('ssssssssss$status');

    String status_url = request.mainurl + "/api/valet/order/status/$id";
    try {
      var token = auth_controller.getToken();
      var org_id = auth_controller.getOrganizationid();
      print('ssssssssssssss');
      Map<String, String> header = {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'org-id': org_id.toString(),
      };
      var input = json.encode({
        "status": status,
      });
      print("Status is $status");
//https://dev2.linentech.net/api/valet-order/status/$id
      final response =
          await http.post(Uri.parse(status_url), headers: header, body: input);

      print("response body: url hit good: ${response.body.toString()}");

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        home_controller.orderlisting[0].order![index].status =
            jsonResponse['data']['order_status'];
        home_controller.selectstatus.value = '0'.toString();
        //           home_controller.fetchorder(    home_controller.selectfirstdate.value, home_controller.selectenddate.value);
        validation_controller.changestatus('Status has been changed successfully');
        isLoading.value = false;
        update();
      }
      else if (response.statusCode == 400) {
        print('logout');
           auth_controller.logOut();
                        Get.to(Login());
      }
       else {
        throw Exception('Failed to load ');
      }
    } catch (e) {
      throw e;
    }
    home_controller.orderlisting.refresh();
    //   update();
  }
}
