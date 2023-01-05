import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/orderdetail_Controller.dart';
import '../loading.dart';
import '../login/login.dart';
import '../services.dart';

class Orderdetails extends StatefulWidget {
  @override
  State<Orderdetails> createState() => _OrderdetailsState();
}

class _OrderdetailsState extends State<Orderdetails> {
  final orderdetail_controller = Get.put(OrderDetails());
  final auth_controller = Get.put(AuthenticationManagerController());
  services request = services();
  LoadingPage loadingPage = LoadingPage();
  // String quantity = '0';
  // String price = '0';
  String rate = '0';
  String price = '0';
  String total = '0';
  String dateis = '';
  String rateis = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => orderdetail_controller.isLoading.value
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,

                    children: [loadingPage.loader()],
                  ),
                ],
              )
            : Column(
                children: [
                  //  SizedBox(height: 23),
                  // Container(
                  //   color: Color.fromRGBO(255, 255, 255, 1),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(14.0),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Image.network(
                  //           request.awsPath +
                  //               'profile/' +
                  //               auth_controller.getLaundrylogo().toString(),
                  //           height: 40,
                  //         ),
                  //         Row(
                  //           children: [
                  //             Image.network(
                  //                 request.awsPath +
                  //                     'customers/' +
                  //                     auth_controller
                  //                         .getcustomerlogo()
                  //                         .toString(),
                  //                 height: 36, errorBuilder:
                  //                     (BuildContext context, Object exception,
                  //                         StackTrace? stackTrace) {
                  //               return const Text('');
                  //             }),
                  //             SizedBox(
                  //               width: 10,
                  //             ),
                  //             InkWell(
                  //               onTap: (() {
                  //                 LogoutDialog();
                  //               }),
                  //               child: Icon(
                  //                 Icons.keyboard_arrow_down,
                  //                 color: Color.fromRGBO(156, 155, 174, 1),

                  //                 ///    size: 20.0,
                  //                 //  semanticLabel: 'Text to announce in accessibility modes',
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(9, 85, 193, 1),
                      // border: Border.all(
                      //     //color: Colors.black,
                      //     //    width: 1,
                      //     )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 35, 0, 13),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 14,
                          ),
                          InkWell(
                            onTap: (() {
                              Get.back();
                            }),
                            child: new SvgPicture.asset(
                              'imagessvg/back.svg',
                              //   height: 20.0,
                              // width: 20.0,
                              //  allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: AutoSizeText(
                                'Orders Detail',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 120,
                                    child: Image.network(
                                        request.awsPath +
                                            'customers/' +
                                            auth_controller
                                                .getcustomerlogo()
                                                .toString(),
                                        // height: 240,
                                        //width: 170,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                      return const Text('');
                                    }),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        'Customer Details',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.0,
                                          color: Color.fromRGBO(9, 85, 193, 1),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              // Image.asset(
                                              //   'images/carbon_phone.jpg',
                                              // ),
                                              Icon(
                                                Icons.phone_outlined,
                                                color: Color.fromARGB(
                                                    255, 109, 109, 121),
                                                size: 12,
                                              ),
                                              SizedBox(width: 5),
                                              AutoSizeText(
                                                //  '/024477755422',

                                                orderdetail_controller
                                                            .orderdetails[0]
                                                            .order!
                                                            .customer!
                                                            .customerAddress!
                                                            .shippingPhone
                                                            .toString() !=
                                                        null
                                                    ? orderdetail_controller
                                                        .orderdetails[0]
                                                        .order!
                                                        .customer!
                                                        .customerAddress!
                                                        .shippingPhone
                                                        .toString()
                                                    : 'not given',

                                                style: TextStyle(
                                                  //  fontWeight: FontWeight.bold,
                                                  fontSize: 10.0,
                                                  color: Color.fromRGBO(
                                                      93, 93, 106, 1),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              // Image.asset(
                                              //   'images/clarity_email-line.jpg',
                                              // ),
                                              Icon(
                                                Icons.mail_outline_outlined,
                                                color: Color.fromARGB(
                                                    255, 109, 109, 121),
                                                size: 12,
                                              ),
                                              SizedBox(width: 5),
                                              AutoSizeText(
                                                //   'laundryname@email.com',
                                                orderdetail_controller
                                                            .orderdetails[0]
                                                            .order!
                                                            .customer!
                                                            .email
                                                            .toString() !=
                                                        null
                                                    ? orderdetail_controller
                                                        .orderdetails[0]
                                                        .order!
                                                        .customer!
                                                        .email
                                                        .toString()
                                                    : 'not given',
                                                style: TextStyle(
                                                  //  fontWeight: FontWeight.bold,
                                                  fontSize: 10.0,
                                                  color: Color.fromRGBO(
                                                      93, 93, 106, 1),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              // Image.asset(
                                              //   'images/clarity_email-line.jpg',
                                              // ),
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: Color.fromARGB(
                                                    255, 109, 109, 121),
                                                size: 12,
                                              ),
                                              SizedBox(width: 5),
                                              Container(
                                                child: SizedBox(
                                                  width: 150,
                                                  child: AutoSizeText(
                                                    //    '/132, My Street,Kingston, New York 12401, United States',
                                                    orderdetail_controller
                                                                .orderdetails[0]
                                                                .order!
                                                                .customer!
                                                                .customerAddress
                                                                .toString() !=
                                                            null
                                                        ? orderdetail_controller
                                                                .orderdetails[0]
                                                                .order!
                                                                .customer!
                                                                .customerAddress!
                                                                .shippingAddress
                                                                .toString() +
                                                            ',' +
                                                            orderdetail_controller
                                                                .orderdetails[0]
                                                                .order!
                                                                .customer!
                                                                .customerAddress!
                                                                .shippingCity
                                                                .toString() +
                                                            ',' +
                                                            orderdetail_controller
                                                                .orderdetails[0]
                                                                .order!
                                                                .customer!
                                                                .customerAddress!
                                                                .shippingState
                                                                .toString() +
                                                            ',' +
                                                            orderdetail_controller
                                                                .orderdetails[0]
                                                                .order!
                                                                .customer!
                                                                .customerAddress!
                                                                .country
                                                                .toString()
                                                        : 'not given',

                                                    style: TextStyle(
                                                      //  fontWeight: FontWeight.bold,

                                                      fontSize: 10.0,
                                                      color: Color.fromRGBO(
                                                          93, 93, 106, 1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 3),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            8.0) //                 <--- border radius here
                                        ),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 206, 206, 212),
                                      width: 0,
                                    )),
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      'Guest',
                                                      style: TextStyle(
                                                        //  fontWeight: FontWeight.w500,
                                                        fontSize: 10.0,
                                                        color: Color.fromRGBO(
                                                            93, 93, 106, 1),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    AutoSizeText(
                                                      //   'John Doe',
                                                      orderdetail_controller
                                                                  .orderdetails[
                                                                      0]
                                                                  .order!
                                                                  .name
                                                                  .toString() !=
                                                              null
                                                          ? orderdetail_controller
                                                              .orderdetails[0]
                                                              .order!
                                                              .name
                                                              .toString()
                                                          : '',

                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10.0,
                                                        color: Color.fromRGBO(
                                                            9, 85, 193, 1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      'Room#',
                                                      style: TextStyle(
                                                        //  fontWeight: FontWeight.w500,
                                                        fontSize: 10.0,
                                                        color: Color.fromRGBO(
                                                            93, 93, 106, 1),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    AutoSizeText(
                                                      //'405',
                                                      orderdetail_controller
                                                                  .orderdetails[
                                                                      0]
                                                                  .order!
                                                                  .roomNumber
                                                                  .toString() !=
                                                              null
                                                          ? orderdetail_controller
                                                              .orderdetails[0]
                                                              .order!
                                                              .roomNumber
                                                              .toString()
                                                          : '',

                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10.0,
                                                        color: Color.fromRGBO(
                                                            93, 93, 106, 1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      'Phone#',
                                                      style: TextStyle(
                                                        //  fontWeight: FontWeight.w500,
                                                        fontSize: 10.0,
                                                        color: Color.fromRGBO(
                                                            93, 93, 106, 1),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    AutoSizeText(
                                                      // '(+1) 12345678',
                                                      orderdetail_controller
                                                                  .orderdetails[
                                                                      0]
                                                                  .order!
                                                                  .phone
                                                                  .toString() !=
                                                              null
                                                          ? orderdetail_controller
                                                              .orderdetails[0]
                                                              .order!
                                                              .phone
                                                              .toString()
                                                          : '',

                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10.0,
                                                        color: Color.fromRGBO(
                                                            93, 93, 106, 1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      'Email',
                                                      style: TextStyle(
                                                        //  fontWeight: FontWeight.w500,
                                                        fontSize: 10.0,
                                                        color: Color.fromRGBO(
                                                            93, 93, 106, 1),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    AutoSizeText(
                                                      //'405',
                                                      orderdetail_controller
                                                                  .orderdetails[
                                                                      0]
                                                                  .order!
                                                                  .email
                                                                  .toString() !=
                                                              null
                                                          ? orderdetail_controller
                                                              .orderdetails[0]
                                                              .order!
                                                              .email
                                                              .toString()
                                                          : '',

                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10.0,
                                                        color: Color.fromRGBO(
                                                            93, 93, 106, 1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        height: 20,
                                                        color: orderdetail_controller
                                                                    .orderdetails[
                                                                        0]
                                                                    .order!
                                                                    .status ==
                                                                0
                                                            ? Color.fromRGBO(
                                                                9, 85, 193, 1)
                                                            : Color.fromRGBO(52,
                                                                191, 163, 1),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              // SvgPicture.asset(
                                                              //   'imagessvg/tabler_switch-2.svg',
                                                              //   //   height: 20.0,
                                                              //   // width: 20.0,
                                                              //   //  allowDrawingOutsideViewBox: true,
                                                              // ),

                                                              AutoSizeText(
                                                                orderdetail_controller
                                                                            .orderdetails[0]
                                                                            .order!
                                                                            .status ==
                                                                        0
                                                                    ? 'OPEN'
                                                                    : 'PICKED',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        8.0,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            1)),
                                                              ),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 23,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      'Order Date',
                                                      style: TextStyle(
                                                        //  fontWeight: FontWeight.w500,
                                                        fontSize: 10.0,
                                                        color: Color.fromRGBO(
                                                            93, 93, 106, 1),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    if (orderdetail_controller
                                                            .orderdetails[0]
                                                            .order!
                                                            .orderDate
                                                            .toString() !=
                                                        null)
                                                      Container(
                                                        child: changedateformate(
                                                            orderdetail_controller
                                                                .orderdetails[0]
                                                                .order!
                                                                .orderDate
                                                                .toString()),
                                                      ),
                                                    AutoSizeText(
                                                      ///'Sep 05, 2022',
                                                      dateis,

                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10.0,
                                                        color: Color.fromRGBO(
                                                            93, 93, 106, 1),
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
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Order Summary',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.0,
                                    color: Color.fromRGBO(93, 93, 106, 1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // for (int i = 0; i < 100; i++)
                            //   Column(
                            //     children: [
                            //       Text("ll"),
                            //       for (var i = 0; i < 5; i++)
                            //         Column(
                            //           children: [Text('xxx')],
                            //         )
                            //     ],
                            //   ),

                            for (int services = 0;
                                services <
                                    orderdetail_controller
                                        .orderdetails[0].order!.service!.length;
                                services++)
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              8.0) //                 <--- border radius here
                                          ),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 206, 206, 212),
                                        width: 0,
                                      )),
                                  child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(16, 0, 16, 0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: AutoSizeText(
                                              'Service Name',
                                              style: TextStyle(
                                                //  fontWeight: FontWeight.w500,
                                                fontSize: 10.0,
                                                color: Color.fromRGBO(
                                                    93, 93, 106, 1),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: AutoSizeText(
                                              //  'Wash',
                                              orderdetail_controller
                                                          .orderdetails[0]
                                                          .order!
                                                          .service![services]
                                                          .name
                                                          .toString() !=
                                                      null
                                                  ? orderdetail_controller
                                                      .orderdetails[0]
                                                      .order!
                                                      .service![services]
                                                      .name
                                                      .toString()
                                                  : '',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.0,
                                                color: Color.fromRGBO(
                                                    9, 85, 195, 1),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          for (int items = 0;
                                              items <
                                                  orderdetail_controller
                                                      .orderdetails[0]
                                                      .order!
                                                      .service![services]
                                                      .valetOrderItem!
                                                      .length;
                                              items++)
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 12),
                                              child: Row(
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
                                                      AutoSizeText(
                                                        'Item#',
                                                        style: TextStyle(
                                                          //  fontWeight: FontWeight.w500,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              93, 93, 106, 1),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      AutoSizeText(
                                                        //'52223',
                                                        orderdetail_controller
                                                                    .orderdetails[
                                                                        0]
                                                                    .order!
                                                                    .service![
                                                                        services]
                                                                    .valetOrderItem![
                                                                        items]
                                                                    .itemNumber
                                                                    .toString() !=
                                                                null
                                                            ? orderdetail_controller
                                                                .orderdetails[0]
                                                                .order!
                                                                .service![
                                                                    services]
                                                                .valetOrderItem![
                                                                    items]
                                                                .itemNumber
                                                                .toString()
                                                            : '',

                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              93, 93, 106, 1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AutoSizeText(
                                                        'Item Name',
                                                        style: TextStyle(
                                                          //  fontWeight: FontWeight.w500,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              93, 93, 106, 1),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      AutoSizeText(
                                                        //  'Sheets',
                                                        orderdetail_controller
                                                                    .orderdetails[
                                                                        0]
                                                                    .order!
                                                                    .service![
                                                                        services]
                                                                    .valetOrderItem![
                                                                        items]
                                                                    .name
                                                                    .toString() !=
                                                                null
                                                            ? orderdetail_controller
                                                                .orderdetails[0]
                                                                .order!
                                                                .service![
                                                                    services]
                                                                .valetOrderItem![
                                                                    items]
                                                                .name
                                                                .toString()
                                                            : '',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              93, 93, 106, 1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AutoSizeText(
                                                        'Order QTY',
                                                        style: TextStyle(
                                                          //  fontWeight: FontWeight.w500,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              93, 93, 106, 1),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      AutoSizeText(
                                                        //  '5',
                                                        orderdetail_controller
                                                                    .orderdetails[
                                                                        0]
                                                                    .order!
                                                                    .service![
                                                                        services]
                                                                    .valetOrderItem![
                                                                        items]
                                                                    .quantity
                                                                    .toString() !=
                                                                null
                                                            ? orderdetail_controller
                                                                .orderdetails[0]
                                                                .order!
                                                                .service![
                                                                    services]
                                                                .valetOrderItem![
                                                                    items]
                                                                .quantity
                                                                .toString()
                                                            : '',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              93, 93, 106, 1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AutoSizeText(
                                                        'Rate',
                                                        style: TextStyle(
                                                          //  fontWeight: FontWeight.w500,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              93, 93, 106, 1),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      if (orderdetail_controller
                                                              .orderdetails[0]
                                                              .order!
                                                              .service![
                                                                  services]
                                                              .valetOrderItem![
                                                                  items]
                                                              .price !=
                                                          null)
                                                        Container(
                                                            child: removedercimal(
                                                                orderdetail_controller
                                                                    .orderdetails[
                                                                        0]
                                                                    .order!
                                                                    .service![
                                                                        services]
                                                                    .valetOrderItem![
                                                                        items]
                                                                    .price)),
                                                      AutoSizeText(
                                                        rateis,
                                                        // \$650',
                                                        // orderdetail_controller
                                                        //             .orderdetails[
                                                        //                 0]
                                                        //             .order!
                                                        //             .service![
                                                        //                 services]
                                                        //             .valetOrderItem![
                                                        //                 items]
                                                        //             .price
                                                        //             .toString() !=
                                                        //         null
                                                        //     ? '\$' +
                                                        //         orderdetail_controller
                                                        //             .orderdetails[
                                                        //                 0]
                                                        //             .order!
                                                        //             .service![
                                                        //                 services]
                                                        //             .valetOrderItem![
                                                        //                 items]
                                                        //             .price
                                                        //             .toString()
                                                        //     : '',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              93, 93, 106, 1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    child: totalprice(
                                                        orderdetail_controller
                                                            .orderdetails[0]
                                                            .order!
                                                            .service![services]
                                                            .valetOrderItem![
                                                                items]
                                                            .quantity,
                                                        orderdetail_controller
                                                            .orderdetails[0]
                                                            .order!
                                                            .service![services]
                                                            .valetOrderItem![
                                                                items]
                                                            .price),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AutoSizeText(
                                                        'Price',
                                                        style: TextStyle(
                                                          //  fontWeight: FontWeight.w500,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              93, 93, 106, 1),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      AutoSizeText(
                                                        //   '\$50',
                                                        rate,

                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              93, 93, 106, 1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    child: totalsum(rate),
                                                  )
                                                ],
                                              ),
                                            ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                        ],
                                      )),
                                ),
                              )
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        child: Container(
                          color: Color.fromRGBO(9, 85, 193, 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                'TOTAL: ',
                                style: TextStyle(
                                  //  fontWeight: FontWeight.w500,
                                  fontSize: 12.0,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                              AutoSizeText(
                                '\$$total',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ])
                ],
              ),
      ),
    );
  }

  // LogoutDialog() {
  //   return showDialog(
  //       context: context,
  //       builder: (_) =>
  //           Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
  //             // Aligns the container to center
  //             Padding(
  //               padding: const EdgeInsets.fromLTRB(0, 35, 40, 0),
  //               child: Container(
  //                 // A simplified version of dialog.

  //                 child: Card(
  //                   child: TextButton(
  //                     child: AutoSizeText(
  //                       'Logout',
  //                       style: TextStyle(
  //                         //  fontWeight: FontWeight.w500,
  //                         fontSize: 10.0,
  //                         color: Color.fromRGBO(93, 93, 106, 1),
  //                       ),
  //                     ),

  //                     style: ButtonStyle(
  //                       shape:
  //                           MaterialStateProperty.all<RoundedRectangleBorder>(
  //                         RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(5.0),

  //                           //   side: BorderSide(color: Colors.red.shade900),
  //                         ),
  //                       ),
  //                     ),
  //                     //      color: Colors.black,
  //                     //  textColor: Colors.white,
  //                     //     shape: RoundedRectangleBorder(
  //                     //borderRadius: BorderRadius.circular(30)),
  //                     onPressed: () {
  //                       auth_controller.logOut();
  //                       Get.to(Login());
  //                     },
  //                   ),
  //                 ),
  //               ),
  //             )
  //           ]));
  // }

  totalprice(order, price) {
    print('order is$order');
    print('order is$price');
    num orderis = order;
    num priceis = double.parse(price);
    priceis = priceis * order;
    print('rate is $priceis');
    String removezeros = priceis.toStringAsFixed(2);
    rate = removezeros.toString();

    priceis = 0;
  }

  totalsum(priceis) {
    print('price is$priceis');
    num princeis = double.parse(priceis);
    num totl = double.parse(total);
    princeis = princeis + totl;
    print('price total  is$priceis');
    total = princeis.toStringAsFixed(2);
    print(' total  isssssssss$total');
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

  removedercimal(decimalvalue) {
    print('values gwet is ssss$decimalvalue');
    num val = double.parse(decimalvalue);

    String removezeros = val.toStringAsFixed(2);
    rateis = removezeros.toString();
    // print('aaaaaaaaaaaa$removezeros');
  }
}
