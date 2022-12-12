import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel_vallet/models/orderlistmodel.dart';

import 'package:http/http.dart' as http;

import '../views/services.dart';
import 'auth_controller.dart';
import 'package:intl/intl.dart';

class OrderController extends GetxController {
  services request = services();
  var orderlisting = <Orderlist>[].obs;
  var isLoading = true.obs;
  var loaddata = ''.obs;

  final auth_controller = Get.put(AuthenticationManagerController());
  RxInt followerCount = 2.obs;
  var roomnunber = ''.obs;
  var selectstatus = '0'.obs;
  var selectfirstdate = ''.obs;
  var selectenddate = ''.obs;
  var search = ''.obs;
  ScrollController controller = ScrollController();

  RxInt start = 0.obs;
  RxInt limit = 10.obs;
  @override
  void onInit() {
    var today = DateTime.now();
    var startdate = DateFormat('yyyy-MM-dd')
        .format(today.subtract(new Duration(days: today.weekday - 1)));
    var enddate = DateFormat('yyyy-MM-dd').format(
        today.add(new Duration(days: DateTime.daysPerWeek - today.weekday)));
    selectfirstdate.value = startdate;
    selectenddate.value = enddate;

    fetchorder(startdate, enddate);
    addItems();
    super.onInit();
  }

  addItems() async {
    print('on scrollllllll');
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        start.value = orderlisting[0].order!.length;
        callnew(selectfirstdate.value, selectenddate.value);
      }
    });
  }

  updateStoreName(int val) {
    followerCount.value = val;
    return followerCount;
  }

  Future<void> fetchorder(startdate, enddate) async {
    print('value in list is $orderlisting');
    isLoading.value = true;
    print("start date is $startdate  end date is $enddate");
    print('picked  and open is  $selectstatus');
    print("room no is $roomnunber");
    String home_url = request.mainurl +
        "/api/valet/order/show?date_from=$startdate&date_to=$enddate&room=$roomnunber&status=$selectstatus&search[value]=$search&start=$start&length=$limit";
    print('tttttttttt$home_url');
    try {
      // orderlisting.clear();
      var token = auth_controller.getToken();
      var org_id = auth_controller.getOrganizationid();
      print('ssssssssssssss');
      Map<String, String> header = {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'org-id': org_id.toString(),
      };

      final response = await http.get(Uri.parse(home_url), headers: header);

      print("response body: url hit good: ${response.body.toString()}");

      if (response.statusCode == 200) {
        orderlisting.clear();
        Orderlist _albumModel = Orderlist.fromJson(jsonDecode(response.body));

        orderlisting.add(Orderlist(
          status: _albumModel.status,
          order: _albumModel.order,

          //  url: _albumModel.url,
          //   thumbnailUrl: _albumModel.thumbnailUrl,
          //   id: _albumModel.id,
          //   albumId: _albumModel.albumId,
          // ),
        ));

        isLoading.value = false;
        roomnunber.value = '';
     

        // selectstatus.value = '';
        update();
      } else {
        throw Exception('Failed to load ');
      }
    } catch (e) {
      print('APi issue$e');
      throw e;
    }
    update();
  }

  Future callnew(startdate, enddate) async {
    loaddata.value = 'true';
    print("start date is $startdate  end date is $enddate");
    print('start number is $start');
    print('end number issssssssssssssssssssssss $limit');
    String home_url = request.mainurl +
        "/api/valet/order/show?date_from=$startdate&date_to=$enddate&room=$roomnunber&status=$selectstatus&search[value]=$search&start=$start&length=$limit";
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

      final response = await http.get(Uri.parse(home_url), headers: header);

      print("response body: url hit  ${response.body.toString()}");

      if (response.statusCode == 200) {
        Orderlist _albumModel = Orderlist.fromJson(jsonDecode(response.body));

        for (var i = 0; i < _albumModel.order!.length; i++) {
          orderlisting[0].order!.add(Order(
              id: _albumModel.order![i].id,
              name: _albumModel.order![i].name,
              referenceNumber: _albumModel.order![i].referenceNumber,
              customerId: _albumModel.order![i].customerId,
              organizationId: _albumModel.order![i].organizationId,
              email: _albumModel.order![i].email,
              roomNumber: _albumModel.order![i].roomNumber,
              phone: _albumModel.order![i].phone,
              orderDate: _albumModel.order![i].orderDate,
              status: _albumModel.order![i].status,
              createdAt: _albumModel.order![i].createdAt,
              updatedAt: _albumModel.order![i].updatedAt,
              customerName: _albumModel.order![i].customerName));
        }

        // start.value = orderlisting[0].order!.length;
        for (int i = 0; i < orderlisting[0].order!.length; i++) {
          print('$i is ${orderlisting[0].order![i].name}');
        }

        roomnunber.value = '';
        orderlisting.refresh();
        loaddata.value = 'false';
        // selectstatus.value = '';
        update();
      } else {
        throw Exception('Failed to load ');
      }
    } catch (e) {
      print('APi issue$e');
      throw e;
    }
    update();
  }
// Future<Orderlist> fetchorder() async {

//   var token = auth_controller.getToken();

//   Map<String, String> header = {
//        "Content-Type": "application/json",
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//       'org-id': '92',
//     };

//     final response =
//     await http.get(Uri.parse( 'https://dev2.linentech.net/api/valet-order/show?date_from=2022-10-10&date_to=2022-10-12'),headers: header);

//     print("response body: url hit good: ${response.body.toString()}");

//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body);
//        print("response body: url : ${parsed}");
//        return Orderlist.fromJson(parsed);

//     } else {
//       throw Exception('Failed to load ');
//     }
// }
}
