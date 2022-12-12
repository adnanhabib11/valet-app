import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hotel_vallet/models/loginmodel.dart';
import 'package:hotel_vallet/views/home/home.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../views/services.dart';
import 'inputvalidation_Controller.dart';

class AuthenticationManagerController extends GetxController with CacheManager {
  services request = services();
  final isLogged = false.obs;
  var isLoading = false.obs;
  final validation_controller = Get.put(InputVaildation());
  var customerlogo;
  var laundrylogo;

  void login_function(email, password) async {
    isLoading.value = true;
    // String login_url = "https://dev2.linentech.net/api/login";
    String login_url = request.mainurl + "/api/login";
    print('url is $login_url');
    var url = Uri.parse(login_url);
    var input = json.encode({
      "email": email,
      "password": password,
      'appname': 'Valet App',
    });
    await http
        .post(
      url,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
      },
      body: input,
    )
        .then((response) {
      //  print(res);

      if (response.statusCode == 200) {
        print("response is correct");
        isLogged.value = true;
        //this means API is working fine
        print(response.body);
        print('TTTTTTTTTTTTTTTTTTTTTTTTTT');
        var jsonResponse = jsonDecode(response.body);
        var token = jsonResponse['data']['token'];
        print('sssssssssssssssssssssss$token');
        saveToken(token);
        int orgid = jsonResponse['data']['user']['organization_id'];
        customerlogo = jsonResponse['data']['customer_logo'];
        laundrylogo = jsonResponse['data']['user_profile']['logo'];
        savecustomerlogo(customerlogo);
        saveLaundryLogo(laundrylogo);
        print('customerlogo is $customerlogo');
        print('uuuuuuuuuuu$orgid');
        saveOrganizationid(orgid);

        ///  Get.to(EmployeeLogin());
        Get.to(() => Home());
        //  Get.offAll(() => EmployeeLogin());
      } else {
        var jsonResponse = jsonDecode(response.body);

        var error = jsonResponse['data']['error'];
        print('RRRRRRRRRRRRRRRRRRRRRRRR${error}');
        validation_controller.showsnack(error);
         isLoading.value = false;
      
      }
    }).catchError((error) {
      print(error);
    });
  }

  void logOut() {
    isLogged.value = false;
    removeToken();
    removeOrganizationid();
    removeCustomerLogo();
    removeLaundrylogo();
  Get.deleteAll();

    // Get.to(Login());
  }

  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }

  Future<bool> saveOrganizationid(int? organizationid) async {
    final org_id = GetStorage();
    await org_id.write(
        CacheManagerKey.Organizationid.toString(), organizationid);
    return true;
  }

  int? getOrganizationid() {
    final org_id = GetStorage();
    return org_id.read(CacheManagerKey.Organizationid.toString());
  }

  Future<void> removeOrganizationid() async {
    final org_id = GetStorage();
    await org_id.remove(CacheManagerKey.Organizationid.toString());
  }

  Future<bool> savecustomerlogo(var logo) async {
    final customerlogo = GetStorage();
    await customerlogo.write(CacheManagerKey.CustomerLogo.toString(), logo);
    return true;
  }

  String? getcustomerlogo() {
    final customerlogo = GetStorage();
    return customerlogo.read(CacheManagerKey.CustomerLogo.toString());
  }

  Future<void> removeCustomerLogo() async {
    final customerlogo = GetStorage();
    await customerlogo.remove(CacheManagerKey.CustomerLogo.toString());
  }

  Future<bool> saveLaundryLogo(var logo) async {
    final laundryLogo = GetStorage();
    await laundryLogo.write(CacheManagerKey.LaundryLogo.toString(), logo);
    return true;
  }

  String? getLaundrylogo() {
    final laundryLogo = GetStorage();
    return laundryLogo.read(CacheManagerKey.LaundryLogo.toString());
  }

  Future<void> removeLaundrylogo() async {
    final customerlogo = GetStorage();
    await customerlogo.remove(CacheManagerKey.LaundryLogo.toString());
  }
}

enum CacheManagerKey { TOKEN, Organizationid, CustomerLogo, LaundryLogo }
