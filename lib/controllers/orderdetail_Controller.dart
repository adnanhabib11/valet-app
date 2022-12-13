import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../models/order_details_model.dart';
import '../views/login/login.dart';
import '../views/services.dart';
import 'auth_controller.dart';

class OrderDetails extends GetxController {
  var isLoading = true.obs;
  var orderdetails = <OrderDetail>[].obs;
  final auth_controller = Get.put(AuthenticationManagerController());
  String id = Get.arguments;
  services request = services();
  @override
  void onInit() {
    super.onInit();
    print('vvvvvvvvvvvvvvv$id');
 fetchOrderDetails(id);
  }

  Future<void> fetchOrderDetails(id) async {
    print('ssssssss$id');
    String detail_url = request.mainurl + '/api/valet/order/view/$id';
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

      final response = await http.get(Uri.parse(detail_url), headers: header);

      print("response body: url hit good: ${response.body.toString()}");

      if (response.statusCode == 200) {
        OrderDetail _albumModel =
            OrderDetail.fromJson(jsonDecode(response.body));

        orderdetails.add(
            OrderDetail(status: _albumModel.status, order: _albumModel.order));

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
    update();
  }
}
