import 'dart:convert';

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
  final auth_controller = Get.put(AuthenticationManagerController());
  RxInt followerCount = 8.obs;
  var roomnunber = ''.obs;
  var selectstatus = '0'.obs;
  var selectfirstdate = ''.obs;
  var selectenddate = ''.obs;
  var search = ''.obs;
  @override
  void onInit() {
    var today = DateTime.now();
    var startdate = DateFormat('yyyy-MM-dd')
        .format(today.subtract(new Duration(days: today.weekday - 1)));
    var enddate = DateFormat('yyyy-MM-dd').format(
        today.add(new Duration(days: DateTime.daysPerWeek - today.weekday)));
    selectfirstdate.value = startdate;
    selectenddate.value = enddate;

    super.onInit();
    fetchorder(startdate, enddate);
  }

  updateStoreName(int val) {
    followerCount.value = val;
    return followerCount;
  }

  Future<void> fetchorder(startdate, enddate) async {
    isLoading.value = true;
    print("start date is $startdate  end date is $enddate");
    print('picked  and open is  $selectstatus');
    print("room no is $roomnunber");
    String home_url = request.mainurl +
        "/api/valet/order/show?date_from=$startdate&date_to=$enddate&room=$roomnunber&status=$selectstatus&search[value]=$search";
    print('$home_url');
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
        search.value = '';
       
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
