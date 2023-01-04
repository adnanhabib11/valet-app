import 'package:auto_size_text/auto_size_text.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_vallet/views/order_details/orderdetails.dart';
import 'package:http/http.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/order_controller.dart';
import '../../controllers/orderstatus_controller.dart';
import '../loading.dart';
import '../login/login.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// enum Daterange {
//   Today,
//   Yesterday,
//   This_Week,
//   Last_Week,
//   This_Month,
//   LastMonth,
//   This_Year,
//   Last_Year_Custom_Date
// }
enum Daterange {
  Today,
  Yesterday,
  This_Week,
  Last_Week,
  This_Month,
  Last_Month,
  This_Year,
  Last_Year
}

class _HomeState extends State<Home> {
  final auth_controller = Get.put(AuthenticationManagerController());
  final home_controller = Get.put(OrderController());
  final orderstatus_controller = Get.put(OrderStatus());
  final room = TextEditingController();
  final searching = TextEditingController();
  services request = services();
  String _groupValue = '';
  Color _c = Colors.redAccent;
  Daterange? _daterange;
  bool onclick = true;
  String dateis = '';
  String timeis = '';
  void checkRadio(String value) {
    setState(() {
      _groupValue = value;
    });
  }

  final List<String> daterange = <String>[
    'Today',
    'Yesterday',
    'This Week',
    'Last Week',
    'This Month',
    'Last Month',
    'This Year',
    'Last Year',
  ];

  // int indexdaterange = 0;

  @override
  Widget build(BuildContext context) {
    String customer = auth_controller.getcustomerlogo().toString();
    LoadingPage loadingPage = LoadingPage();

    return SafeArea(
      top: false,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 25),
            Container(
              color: Color.fromRGBO(255, 255, 255, 1),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                        request.awsPath +
                            'profile/' +
                            auth_controller.getLaundrylogo().toString(),
                        height: 45, errorBuilder: (BuildContext context,
                            Object exception, StackTrace? stackTrace) {
                      return const Icon(
                        Icons.image,
                        color: Colors.grey,
                        size: 40,
                      );
                    }),
                    // Image.asset(
                    //   'images/letter-s-inside-the-splash-with-sparkling-stars-5031ld 1.png',
                    // ),
                    Row(
                      children: [
                        AvatarView(
                          radius: 26,
                          // borderColor: Colors.grey,
                          avatarType: AvatarType.CIRCLE,
                          //   backgroundColor: Colors.red,
                          imagePath: request.awsPath +
                              'customers/' +
                              auth_controller.getcustomerlogo().toString(),
                          placeHolder: Container(),
                          errorWidget: Container(
                            child: Icon(
                              Icons.image,
                              color: Colors.grey,
                              size: 40,
                            ),
                          ),
                        ),

                        // Container(
                        //     child: AvatarView(
                        //   radius: 33,
                        //   //borderWidth: 8,
                        //   // borderColor: Colors.yellow,
                        //   avatarType: AvatarType.CIRCLE,
                        //   //   backgroundColor: Colors.red,
                        //   imagePath: request.awsPath +
                        //       'customers/' +
                        //       auth_controller.getcustomerlogo().toString(),
                        //   placeHolder: Image.network(
                        //     request.awsPath +
                        //         'customers/' +
                        //         auth_controller.getcustomerlogo().toString(),
                        //     width: 50,
                        //     height: 50,
                        //     //fit: BoxFit.cover,
                        //   ),
                        // )),
                        // Image.network(
                        //     request.awsPath +
                        //         'customers/' +
                        //         auth_controller.getcustomerlogo().toString(),
                        //     height: 36, errorBuilder: (BuildContext context,
                        //         Object exception, StackTrace? stackTrace) {
                        //   return const Text('');
                        // }),

                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: (() {
                            LogoutDialog();
                          }),
                          child: SvgPicture.asset(
                            'imagessvg/downword.svg',
                            //   height: 20.0,
                            // width: 20.0,
                            //  allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(9, 85, 193, 1),
                // border: Border.all(
                //   color: Colors.black,
                //   width: 1,
                // )
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AutoSizeText(
                      'Valet Orders',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 14, 0),
                      child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (() {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return SearchDialog();
                                },
                              );
                            }),
                            child: new SvgPicture.asset(
                              'imagessvg/eva_arrow-ios-downward-outline (1).svg',
                              //   height: 20.0,
                              // width: 20.0,
                              //  allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              datefilter();
                            },
                            child: new SvgPicture.asset(
                              'imagessvg/eva_arrow-ios-downward-outline.svg',
                              //   height: 20.0,
                              // width: 20.0,
                              //  allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              color: Color.fromRGBO(255, 255, 255, 1),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 3, 16, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            home_controller.selectstatus.value = '0'.toString();
                            home_controller.start.value = 0;
                            home_controller.fetchorder(
                                home_controller.selectfirstdate.value,
                                home_controller.selectenddate.value);
                            print('sss$onclick');
                            onclick = true; //  Get.to(Orderdetails());
                          });
                        },
                        child: Container(
                          //   height: 40,
                          child: Column(children: [
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: AutoSizeText(
                                'OPEN',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.0,
                                    color: onclick == false
                                        ? Color.fromRGBO(156, 155, 174, 1)
                                        : Color.fromRGBO(9, 85, 193, 1)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14),
                              child: Container(
                                  height: 3,
                                  color: onclick == false
                                      ? Color.fromRGBO(255, 255, 255, 1)
                                      : Color.fromRGBO(9, 85, 193, 1)),
                            ),
                            // TextButton(
                            //   child: AutoSizeText(
                            //     'OPEN',
                            //     style: TextStyle(
                            //         // fontWeight: FontWeight.bold,
                            //         fontSize: 11.0,
                            //         color: onclick == false
                            //             ? Color.fromRGBO(156, 155, 174, 1)
                            //             : Colors.black),
                            //   ),

                            //   style: ButtonStyle(
                            //     // backgroundColor: onclick == false
                            //     //     ? MaterialStateProperty.all<Color>(
                            //     //         Color.fromARGB(95, 239, 239, 239))
                            //     //     : MaterialStateProperty.all<Color>(
                            //     //         Color.fromRGBO(9, 85, 193, 1)),
                            //     shape: MaterialStateProperty.all<
                            //         RoundedRectangleBorder>(
                            //       RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(10.0),
                            //         //       side: BorderSide(  color: Color.fromRGBO(156, 155, 174, 1))
                            //       ),
                            //     ),
                            //   ),

                            //   //   style: ButtonStyle(
                            //   // backgroundColor:MaterialStateProperty.all<Color>(
                            //   //        Color.fromRGBO(52, 191, 163, 1
                            //   //      )),
                            //   //     shape: MaterialStateProperty.all<
                            //   //         RoundedRectangleBorder>(
                            //   //       RoundedRectangleBorder(
                            //   //         borderRadius: BorderRadius.circular(10.0),

                            //   //         //   side: BorderSide(color: Colors.red.shade900),
                            //   //       ),
                            //   //     ),
                            //   //   ),

                            //   onPressed: () {
                            //     setState(() {
                            //       home_controller.selectstatus.value =
                            //           '0'.toString();
                            //       home_controller.start.value = 0;
                            //       home_controller.fetchorder(
                            //           home_controller.selectfirstdate.value,
                            //           home_controller.selectenddate.value);
                            //       print('sss$onclick');
                            //       onclick = true; //  Get.to(Orderdetails());
                            //     });
                            //   },
                            // ),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            home_controller.selectstatus.value = '1'.toString();
                            home_controller.start.value = 0;
                            home_controller.fetchorder(
                                home_controller.selectfirstdate.value,
                                home_controller.selectenddate.value);
                            onclick = false;
                          });
                        },
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              AutoSizeText(
                                'PICKED',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.0,
                                    color: onclick == true
                                        ? Color.fromRGBO(156, 155, 174, 1)
                                        : Color.fromRGBO(52, 191, 163, 1)),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: Container(
                                  height: 3,
                                  color: onclick == true
                                      ? Color.fromRGBO(255, 255, 255, 1)
                                      : Color.fromRGBO(52, 191, 163, 1),
                                ),
                              ),
                              // TextButton
                              // (
                              //   child: AutoSizeText(
                              //     'PICKED',
                              //     style: TextStyle(
                              //         // fontWeight: FontWeight.bold,
                              //         fontSize: 11.0,
                              //         color: onclick == true
                              //             ? Color.fromRGBO(156, 155, 174, 1)
                              //             : Colors.white),
                              //   ),

                              //   style: ButtonStyle(

                              //     shape: MaterialStateProperty.all<
                              //         RoundedRectangleBorder>(
                              //       RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(10.0),

                              //       ),
                              //     ),
                              //   ),

                              //   onPressed: () {

                              //     setState(() {
                              //       home_controller.selectstatus.value =
                              //           '1'.toString();
                              //       home_controller.start.value = 0;
                              //       home_controller.fetchorder(
                              //           home_controller.selectfirstdate.value,
                              //           home_controller.selectenddate.value);
                              //       onclick = false;
                              //     });
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => home_controller.isLoading.value
                  ? Column(
                      children: [SizedBox(height: 70), loadingPage.loader()],
                    )
                  : Expanded(
                      child: Column(
                        children: [
                          if (home_controller.orderlisting[0].order!.length ==
                              0)
                            Column(
                              children: [
                                SizedBox(height: 70),
                                AutoSizeText(
                                  'No Record',
                                  style: TextStyle(
                                    //  fontWeight: FontWeight.w500,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(93, 93, 106, 1),
                                  ),
                                ),
                              ],
                            ),
                          Expanded(
                            //TODO: Add Expanded here

                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              controller: home_controller.controller,
                              itemCount:
                                  home_controller.orderlisting[0].order!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 0, 10),
                                  child: Slidable(
                                      key: const ValueKey(0),
                                      endActionPane: ActionPane(
                                        extentRatio: 0.40,
                                        motion: const DrawerMotion(),
                                        children: [
                                          CustomSlidableAction(
                                            onPressed: (_) {
                                              var id = home_controller
                                                  .orderlisting[0]
                                                  .order![index]
                                                  .id
                                                  .toString();
                                              print('ddd$id');
                                              Get.to(
                                                Orderdetails(),
                                                arguments: id,
                                              );
                                            },
                                            backgroundColor:
                                                Color.fromRGBO(116, 17, 178, 1),

                                            // padding: EdgeInsets.symmetric(
                                            //   horizontal: 24.w,
                                            //   vertical: 11.h,
                                            // ),

                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                new SvgPicture.asset(
                                                  'imagessvg/akar-icons_eye-open.svg',
                                                  color: Colors.white,

                                                  height: 15.0,
                                                  width: 15.0,
                                                  //  allowDrawingOutsideViewBox: true,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                AutoSizeText(
                                                  'view',
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          CustomSlidableAction(
                                            onPressed: (_) {
                                              var id = home_controller
                                                  .orderlisting[0]
                                                  .order![index]
                                                  .id
                                                  .toString();
                                              String a = home_controller
                                                  .orderlisting[0]
                                                  .order![index]
                                                  .status
                                                  .toString();
                                              print('aaaaa$a');
                                              int st = int.parse(a);
                                              st == 1
                                                  ? ""
                                                  : changestatus(id, index, a);
                                            },
                                            backgroundColor: home_controller
                                                        .orderlisting[0]
                                                        .order![index]
                                                        .status ==
                                                    0
                                                ? Color.fromRGBO(9, 85, 193, 1)
                                                : Color.fromRGBO(
                                                    52, 191, 163, 1),
                                            // padding: EdgeInsets.symmetric(
                                            //   horizontal: 24.w,
                                            //   vertical: 11.h,
                                            // ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (home_controller
                                                        .orderlisting[0]
                                                        .order![index]
                                                        .status ==
                                                    0)
                                                  SvgPicture.asset(
                                                    'imagessvg/tabler_switch-2.svg',
                                                    height: 15.0,
                                                    width: 15.0,
                                                    //  allowDrawingOutsideViewBox: true,
                                                  ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                AutoSizeText(
                                                  home_controller
                                                              .orderlisting[0]
                                                              .order![index]
                                                              .status ==
                                                          0
                                                      ? 'OPEN'
                                                      : 'PICKED',
                                                  style: TextStyle(
                                                      fontSize: 8.0,
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // SlidableAction(
                                          //   autoClose: false,
                                          //   flex: 1,
                                          //   onPressed: (value) {
                                          //     //    myList.removeAt(index);
                                          //     setState(() {});
                                          //   },
                                          //   backgroundColor:
                                          //       Color.fromRGBO(52, 191, 163, 1),
                                          //   foregroundColor: Colors.white,
                                          //   icon: Icons.edit,
                                          //   label: 'view',
                                          // ),
                                          // SlidableAction(
                                          //   autoClose: false,
                                          //   flex: 1,
                                          //   onPressed: (value) {
                                          //     //   myList.removeAt(index);
                                          //     setState(() {});
                                          //   },
                                          //   backgroundColor:
                                          //       Color.fromRGBO(9, 85, 193, 1),
                                          //   foregroundColor: Colors.white,
                                          //   icon: Icons.edit,
                                          //   label: 'Status',
                                          // )
                                        ],
                                      ),
                                      child: Container(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                16, 0, 16, 0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Order Ref#',
                                                              style: TextStyle(
                                                                //  fontWeight: FontWeight.w500,
                                                                fontSize: 10.0,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        93,
                                                                        93,
                                                                        106,
                                                                        1),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            AutoSizeText(
                                                              home_controller
                                                                          .orderlisting[
                                                                              0]
                                                                          .order![
                                                                              index]
                                                                          .referenceNumber
                                                                          .toString() !=
                                                                      null
                                                                  ? home_controller
                                                                      .orderlisting[
                                                                          0]
                                                                      .order![
                                                                          index]
                                                                      .referenceNumber
                                                                      .toString()
                                                                  : '',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 10.0,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        93,
                                                                        93,
                                                                        106,
                                                                        1),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Phone#',
                                                              style: TextStyle(
                                                                //  fontWeight: FontWeight.w500,
                                                                fontSize: 10.0,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        93,
                                                                        93,
                                                                        106,
                                                                        1),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            AutoSizeText(
                                                              home_controller
                                                                          .orderlisting[
                                                                              0]
                                                                          .order![
                                                                              index]
                                                                          .phone
                                                                          .toString() !=
                                                                      null
                                                                  ? home_controller
                                                                      .orderlisting[
                                                                          0]
                                                                      .order![
                                                                          index]
                                                                      .phone
                                                                      .toString()
                                                                  : '',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 10.0,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        93,
                                                                        93,
                                                                        106,
                                                                        1),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Room#',
                                                              style: TextStyle(
                                                                //  fontWeight: FontWeight.w500,
                                                                fontSize: 10.0,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        93,
                                                                        93,
                                                                        106,
                                                                        1),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            AutoSizeText(
                                                              home_controller
                                                                          .orderlisting[
                                                                              0]
                                                                          .order![
                                                                              index]
                                                                          .roomNumber
                                                                          .toString() !=
                                                                      null
                                                                  ? home_controller
                                                                      .orderlisting[
                                                                          0]
                                                                      .order![
                                                                          index]
                                                                      .roomNumber
                                                                      .toString()
                                                                  : '',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 10.0,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        93,
                                                                        93,
                                                                        106,
                                                                        1),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Order Placed on',
                                                              style: TextStyle(
                                                                //  fontWeight: FontWeight.w500,
                                                                fontSize: 10.0,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        93,
                                                                        93,
                                                                        106,
                                                                        1),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            if (home_controller
                                                                    .orderlisting[
                                                                        0]
                                                                    .order![
                                                                        index]
                                                                    .orderDate
                                                                    .toString() !=
                                                                null)
                                                              Container(
                                                                  child: changedateformate(home_controller
                                                                      .orderlisting[
                                                                          0]
                                                                      .order![
                                                                          index]
                                                                      .orderDate
                                                                      .toString())),
                                                            AutoSizeText(
                                                              dateis,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 10.0,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        93,
                                                                        93,
                                                                        106,
                                                                        1),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                          height:
                                                                              20,
                                                                          color: home_controller.orderlisting[0].order![index].status == 0
                                                                              ? Color.fromRGBO(9, 85, 193,
                                                                                  1)
                                                                              : Color.fromRGBO(52, 191, 163,
                                                                                  1),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: 8,
                                                                                ),
                                                                                AutoSizeText(
                                                                                  home_controller.orderlisting[0].order![index].status == 0 ? 'OPEN' : 'PICKED',
                                                                                  style: TextStyle(fontSize: 8.0, color: Color.fromRGBO(255, 255, 255, 1)),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 8,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          )),
                                                                ),
                                                                SizedBox(
                                                                    width: 5),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 13,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Order Time',
                                                              style: TextStyle(
                                                                //  fontWeight: FontWeight.w500,
                                                                fontSize: 10.0,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        93,
                                                                        93,
                                                                        106,
                                                                        1),
                                                              ),
                                                            ),
                                                            if (home_controller
                                                                    .orderlisting[
                                                                        0]
                                                                    .order![
                                                                        index]
                                                                    .orderDate
                                                                    .toString() !=
                                                                null)
                                                              Container(
                                                                child: changetimeformat(home_controller
                                                                    .orderlisting[
                                                                        0]
                                                                    .order![
                                                                        index]
                                                                    .orderDate
                                                                    .toString()),
                                                              ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            if (home_controller
                                                                    .orderlisting[
                                                                        0]
                                                                    .order![
                                                                        index]
                                                                    .orderDate
                                                                    .toString() !=
                                                                null)
                                                              AutoSizeText(
                                                                timeis,
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      10.0,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          93,
                                                                          93,
                                                                          106,
                                                                          1),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            )),
                                      )),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
            ),
            Center(
                child: Obx(() => home_controller.loaddata.value == 'true'
                    ? CircularProgressIndicator()
                    : Container()))
          ],
        ),
      ),
    );
  }

  SearchDialog() {
    return Dialog(
      alignment: Alignment.topRight,
      insetPadding: EdgeInsets.only(right: 50, top: 115, left: 14),
      child: Container(
          height: 35,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: TextField(
                    controller: searching,
                    decoration: InputDecoration(
                        // suffixIcon: IconButton(
                        //   icon: IconButton(
                        //       onPressed: () {
                        //         var searchitem = searching.text.trim();
                        //         home_controller.search.value = searchitem.toString();
                        //         home_controller.fetchorder(
                        //             home_controller.selectfirstdate.value,
                        //             home_controller.selectenddate.value);
                        //         Get.back();
                        //         //  home_controller.search = searching.text.toString();
                        //       },
                        //       icon: const Icon(
                        //         Icons.search,
                        //       )),
                        //   onPressed: () {
                        //     /* Clear the search field */
                        //   },
                        // ),
                        hintText: 'Search',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                color: Color.fromRGBO(9, 85, 193, 1),
                child: IconButton(
                    onPressed: () {
                      var searchitem = searching.text.trim();
                      home_controller.search.value = searchitem.toString();
                      home_controller.start.value = 0;
                      home_controller.fetchorder(
                          home_controller.selectfirstdate.value,
                          home_controller.selectenddate.value);

                      Get.back();
                      //  home_controller.search = searching.text.toString();
                    },
                    icon: const Icon(Icons.search,
                        size: 20, color: Colors.white)),
              )
            ],
          )),
    );
  }

  LogoutDialog() {
    return showDialog(
        context: context,
        builder: (_) =>
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              // Aligns the container to center
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 16, 0),
                child: Container(
                  // A simplified version of dialog.

                  child: Card(
                    child: TextButton(
                      child: AutoSizeText(
                        ' Logout ',
                        style: TextStyle(
                          //  fontWeight: FontWeight.w500,
                          fontSize: 10.0,
                          color: Color.fromRGBO(93, 93, 106, 1),
                        ),
                      ),

                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),

                            //   side: BorderSide(color: Colors.red.shade900),
                          ),
                        ),
                      ),
                      //      color: Colors.black,
                      //  textColor: Colors.white,
                      //     shape: RoundedRectangleBorder(
                      //borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        auth_controller.logOut();
                        Get.offAll(Login());
                      },
                    ),
                  ),
                ),
              )
            ]));
  }

  changestatus(id, index, status) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Status'),
          content: Text('Are you sure you want to change the order status ?'),
          actions: [
            FlatButton(
              textColor: Colors.black,
              onPressed: () {
                Get.back();
              },
              child: Text('CANCEL'),
            ),
            FlatButton(
              textColor: Colors.black,
              onPressed: () {
                print("statuss$status");
                status = status == '0' ? 1 : 0;
                print('status $status');
                orderstatus_controller.fetchorderstatus(id, index, status);
                Get.back();
              },
              child: Text('CONFIRM'),
            ),
          ],
        );
      },
    );
  }

  datefilter() {
    return showDialog(
        context: context,
        builder: (dialogContex) {
          return Dialog(
            alignment: Alignment.bottomCenter,
            insetPadding: EdgeInsets.zero,
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(14, 7, 14, 7),
                      child: Container(
                        height: 36,
                        child: TextFormField(
                          //  obscureText: _changePassword,
                          controller: room,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromRGBO(56, 70, 78, 1)
                              // fontWeight: FontWeight.bold
                              ),
                          cursorColor: Colors.grey.shade500,

                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5.0)),
                            contentPadding:
                                EdgeInsets.only(left: 10.0, right: 10.0),
                            labelText: "Room number",
                            hintStyle: TextStyle(
                              fontSize: 12.0,
                              color: Color.fromRGBO(93, 93, 106, 1),
                              //  fontWeight: FontWeight.w500
                            ),
                            labelStyle: TextStyle(
                              fontSize: 12.0,
                              color: Color.fromRGBO(93, 93, 106, 1),
                            ),
                          ),
                          autocorrect: false,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        popuplist();
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(14, 7, 14, 7),
                        child: Container(
                          height: 36,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 7, 14, 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => AutoSizeText(
                                    daterange[int.parse(home_controller
                                        .followerCount
                                        .toString())],
                                    style: const TextStyle(

                                        //  fontWeight: FontWeight.w500,
                                        fontSize: 10.0,
                                        color: Color.fromRGBO(93, 93, 93, 1)),
                                  ),
                                ),
                                // Text(
                                //   _daterange.toString(),

                                //   //  indexdaterange.toString(),
                                //   style: TextStyle(
                                //       //  fontWeight: FontWeight.w500,
                                //       fontSize: 10.0,
                                //       color: Color.fromRGBO(56, 70, 78, 1)),
                                // ),
                                Icon(
                                  Icons.date_range_outlined,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(14, 7, 14, 7),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 36,
                              child: TextButton(
                                child: AutoSizeText(
                                  'Apply Filter',
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 11.0,
                                    color: Colors.white,
                                  ),
                                ),

                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromRGBO(9, 85, 193, 1)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),

                                      //   side: BorderSide(color: Colors.red.shade900),
                                    ),
                                  ),
                                ),
                                //      color: Colors.black,
                                //  textColor: Colors.white,
                                //     shape: RoundedRectangleBorder(
                                //borderRadius: BorderRadius.circular(30)),
                                onPressed: () {
                                  var roomno = room.text.trim();
                                  print("qqqqqqqqqqqqq$roomno");
                                  home_controller.roomnunber.value =
                                      roomno.toString();

                                  home_controller.start.value = 0;
                                  callapi(
                                      home_controller.followerCount.toString());
                                  Get.back();
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Container(
                            height: 36,
                            child: TextButton(
                              child: AutoSizeText(
                                'Reset',
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 11.0,
                                  color: Colors.white,
                                ),
                              ),

                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(56, 70, 78, 1),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),

                                    //   side: BorderSide(color: Colors.red.shade900),
                                  ),
                                ),
                              ),
                              //      color: Colors.black,
                              //  textColor: Colors.white,
                              //     shape: RoundedRectangleBorder(
                              //borderRadius: BorderRadius.circular(30)),
                              onPressed: () {
                                home_controller.roomnunber.value = '';
                                searching.text = ''.toString();
                                home_controller.search.value = '';
                                home_controller.followerCount.value = 2;
                                room.text = '';
                                home_controller.start.value = 0;
                                var today = DateTime.now();
                                var weekstart = DateFormat('yyyy-MM-dd').format(
                                    today.subtract(
                                        new Duration(days: today.weekday - 1)));
                                print('this week is ${weekstart}');
                                var weekend = DateFormat('yyyy-MM-dd').format(
                                    today.add(new Duration(
                                        days: DateTime.daysPerWeek -
                                            today.weekday)));
                                home_controller.selectfirstdate.value =
                                    weekstart;
                                home_controller.selectenddate.value = weekend;
                                home_controller.fetchorder(weekstart, weekend);
                                Get.back();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  popuplist() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.center,
          insetPadding: EdgeInsets.fromLTRB(30, 80, 30, 80),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: AutoSizeText(
                            'Select Date',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Color.fromRGBO(9, 85, 193, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*  ListView.builder(/
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        //  itemExtent: 8.0,
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return SizedBox(
                              height: 45,
                              child: Transform.scale(
                                scale: 1,
                                child: RadioListTile(
                                  title: Text(
                                    '${daterange[index]}',
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(93, 93, 106, 1),
                                    ),
                                  ),
                                  value: index,
                                  groupValue: selectedRadio,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  onChanged: (value) {
                                    //setState(() => selectedRadio = index);
                                    setState(
                                      () {
                                        selectedRadio = index;
                                        home_controller.updateStoreName(index);

                                        // indexdaterange = index;
                                      },
                                    );
                                    print('$index');
                                  },
                                ),
                              ));
                        }),
                        */
                    SizedBox(
                      height: 35,
                      child: Transform.scale(
                        scale: 0.90,
                        child: RadioListTile<Daterange>(
                          title: const Text(
                            'Today',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color.fromRGBO(93, 93, 106, 1),
                            ),
                          ),
                          value: Daterange.Today,
                          groupValue: _daterange,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (Daterange? value) {
                            setState(() {
                              _daterange = value;
                              print('ssss$_daterange');
                              home_controller.updateStoreName(0);
                              //   Get.back();
                              Get.back();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Transform.scale(
                        scale: 0.90,
                        child: RadioListTile<Daterange>(
                          title: const Text(
                            'Yesterday',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color.fromRGBO(93, 93, 106, 1),
                            ),
                          ),
                          value: Daterange.Yesterday,
                          groupValue: _daterange,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (Daterange? value) {
                            setState(() {
                              _daterange = value;
                              print('ssss$_daterange');
                              home_controller.updateStoreName(1);
                              Get.back();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Transform.scale(
                        scale: 0.90,
                        child: RadioListTile<Daterange>(
                          title: const Text(
                            'This Week',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color.fromRGBO(93, 93, 106, 1),
                            ),
                          ),
                          value: Daterange.This_Week,
                          groupValue: _daterange,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (Daterange? value) {
                            setState(() {
                              _daterange = value;
                              print('ssss$_daterange');
                              home_controller.updateStoreName(2);
                              Get.back();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Transform.scale(
                        scale: 0.90,
                        child: RadioListTile<Daterange>(
                          title: const Text(
                            'Last Week',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color.fromRGBO(93, 93, 106, 1),
                            ),
                          ),
                          value: Daterange.Last_Week,
                          groupValue: _daterange,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (Daterange? value) {
                            setState(() {
                              _daterange = value;
                              print('ssss$_daterange');
                              home_controller.updateStoreName(3);
                              Get.back();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Transform.scale(
                        scale: 0.90,
                        child: RadioListTile<Daterange>(
                          title: const Text(
                            'This Month',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color.fromRGBO(93, 93, 106, 1),
                            ),
                          ),
                          value: Daterange.This_Month,
                          groupValue: _daterange,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (Daterange? value) {
                            setState(() {
                              _daterange = value;
                              print('ssss$_daterange');
                              home_controller.updateStoreName(4);
                              Get.back();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Transform.scale(
                        scale: 0.90,
                        child: RadioListTile<Daterange>(
                          title: const Text(
                            'Last Month',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color.fromRGBO(93, 93, 106, 1),
                            ),
                          ),
                          value: Daterange.Last_Month,
                          groupValue: _daterange,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (Daterange? value) {
                            setState(() {
                              _daterange = value;
                              print('ssss$_daterange');
                              home_controller.updateStoreName(5);
                              Get.back();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 34,
                      child: Transform.scale(
                        scale: 0.90,
                        child: RadioListTile<Daterange>(
                          title: const Text(
                            'This Year',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color.fromRGBO(93, 93, 106, 1),
                            ),
                          ),
                          value: Daterange.This_Year,
                          groupValue: _daterange,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (Daterange? value) {
                            setState(() {
                              _daterange = value;
                              print('ssss$_daterange');
                              home_controller.updateStoreName(6);
                              Get.back();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 34,
                      child: Transform.scale(
                        scale: 0.90,
                        child: RadioListTile<Daterange>(
                          title: const Text(
                            'Last Year',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color.fromRGBO(93, 93, 106, 1),
                            ),
                          ),
                          value: Daterange.Last_Year,
                          groupValue: _daterange,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (Daterange? value) {
                            setState(() {
                              _daterange = value;
                              print('ssss$_daterange');
                              home_controller.updateStoreName(7);
                              Get.back();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Padding(
                    //         padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    //         child: Container(
                    //           height: 36,
                    //           child: TextButton(
                    //             child: Text(
                    //               'cancel',
                    //               style: TextStyle(
                    //                 // fontWeight: FontWeight.bold,
                    //                 fontSize: 11.0,
                    //                 color: Color.fromRGBO(93, 93, 106, 1),
                    //               ),
                    //             ),

                    //             style: ButtonStyle(
                    //               backgroundColor:
                    //                   MaterialStateProperty.all<Color>(
                    //                       Colors.white),
                    //               shape: MaterialStateProperty.all<
                    //                   RoundedRectangleBorder>(
                    //                 RoundedRectangleBorder(
                    //                   borderRadius: BorderRadius.circular(5.0),
                    //                   side: BorderSide(
                    //                       color: Colors.grey.shade300),
                    //                 ),
                    //               ),
                    //             ),
                    //             //      color: Colors.black,
                    //             //  textColor: Colors.white,
                    //             //     shape: RoundedRectangleBorder(
                    //             //borderRadius: BorderRadius.circular(30)),
                    //             onPressed: () {
                    //               //  Get.to(Orderdetails());
                    //               Get.back();
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  callapi(index) {
    print("index is call ap $index");
    // var now = DateTime.now();
    var today = DateTime.now();

    if (int.parse(index) == 0) {
      print('today date is${today}');
      home_controller.fetchorder(today, today);
      home_controller.selectfirstdate.value = today.toString();
      home_controller.selectenddate.value = today.toString();
    } else if (int.parse(index) == 1) {
      var yesterday = DateTime.now().subtract(Duration(days: 1)).toString();
      home_controller.fetchorder(yesterday, yesterday);
      print('yesterday date is${yesterday}');
      home_controller.selectfirstdate.value = yesterday.toString();
      home_controller.selectenddate.value = yesterday.toString();
    } else if (int.parse(index) == 2) {
      print('////////////week////////////////');
      var weekstart = DateFormat('yyyy-MM-dd')
          .format(today.subtract(new Duration(days: today.weekday - 1)));
      print('this week is ${weekstart}');
      var weekend = DateFormat('yyyy-MM-dd').format(
          today.add(new Duration(days: DateTime.daysPerWeek - today.weekday)));
      home_controller.fetchorder(weekstart, weekend);
      home_controller.selectfirstdate.value = weekstart.toString();
      home_controller.selectenddate.value = weekend.toString();
      print('previousweek end is ${weekend}');
    } else if (int.parse(index) == 3) {
      var prestartweek = DateFormat('yyyy-MM-dd')
          .format(today.subtract(new Duration(days: today.weekday + 6)));
      var preendweek = DateFormat('yyyy-MM-dd')
          .format(today.subtract(new Duration(days: today.weekday + 0)));
      home_controller.fetchorder(prestartweek, preendweek);
      //  print('sss$prestartweek aaaaaaaa$preendweek');
      home_controller.selectfirstdate.value = prestartweek.toString();
      home_controller.selectenddate.value = preendweek.toString();
    } else if (int.parse(index) == 4) {
      print('////////////Month////////////////');
      //  var thismonth = DateFormat('yyyy-MM-dd').format(today);
      var fistDaythismonth = new DateTime(today.year, today.month, 1);

      var lastDaythismonth = (today.month < 12)
          ? new DateTime(today.year, today.month + 1, 0)
          : new DateTime(today.year + 1, 1, 0);
      home_controller.fetchorder(fistDaythismonth, lastDaythismonth);
      home_controller.selectfirstdate.value = fistDaythismonth.toString();
      home_controller.selectenddate.value = lastDaythismonth.toString();
      print(
          "first date this month is $fistDaythismonth and last day of month is $lastDaythismonth");
    } else if (int.parse(index) == 5) {
      var firstdaylastmonth = new DateTime(today.year, today.month - 1, 1);
      var lastdaylastmonth = new DateTime(today.year, today.month, 0);
      home_controller.fetchorder(firstdaylastmonth, lastdaylastmonth);

      home_controller.selectfirstdate.value = firstdaylastmonth.toString();
      home_controller.selectenddate.value = lastdaylastmonth.toString();
      print(
          "first date this month is $firstdaylastmonth and last day of month is $lastdaylastmonth");
    } else if (int.parse(index) == 6) {
      var thisyearfistdate = new DateTime(today.year);
      var thisyearlastdate = new DateTime(today.year, 12, 31);
      home_controller.fetchorder(thisyearfistdate, thisyearlastdate);
      print('ssssss$thisyearfistdate     $thisyearlastdate');
      home_controller.selectfirstdate.value = thisyearfistdate.toString();
      home_controller.selectenddate.value = thisyearlastdate.toString();
    } else if (int.parse(index) == 8) {
      var startdate = DateFormat('yyyy-MM-dd')
          .format(today.subtract(new Duration(days: today.weekday - 1)));
      var enddate = DateFormat('yyyy-MM-dd').format(
          today.add(new Duration(days: DateTime.daysPerWeek - today.weekday)));
      home_controller.fetchorder(startdate, enddate);
      print('ssssss$startdate     $enddate');
      home_controller.selectfirstdate.value = startdate.toString();
      home_controller.selectenddate.value = enddate.toString();
    } else {
      var preyearfistdate = new DateTime(today.year - 1);
      var preyearlastdate = new DateTime(today.year - 1, 12, 31);
      home_controller.fetchorder(preyearfistdate, preyearlastdate);
      print('ssssss$preyearfistdate     $preyearlastdate');
      home_controller.selectfirstdate.value = preyearfistdate.toString();
      home_controller.selectenddate.value = preyearlastdate.toString();
    }
  }

  changedateformate(var date) {
    print('date is $date');
    // var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
    // var inputDate = inputFormat.parse(date);
    var localDate = DateTime.parse(date).toLocal();
    // var inputFormat = DateFormat('M-dd-yyyy');
    // var inputDate = inputFormat.parse(localDate.toString());
    // var myDate = DateFormat('').parse(date);
    dateis = DateFormat.yMMMd().format(localDate);

    print('object$dateis');
  }

  changetimeformat(var time) {
    print('time isssssssssssssssssss$time');
    var localDate = DateTime.parse(time).toLocal();
    // var inputFormat = DateFormat('M-dd-yyyy');
    // var inputDate = inputFormat.parse(localDate.toString());
    // var myDate = DateFormat('').parse(date);
    dateis = DateFormat.jm().format(localDate);

    print('object$dateis');
    timeis = dateis;
  }
}
