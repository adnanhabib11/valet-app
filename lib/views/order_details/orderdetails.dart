import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => orderdetail_controller.isLoading.value
            ? loadingPage.loader()
            : Column(
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
                            height: 40,
                          ),
                          Row(
                            children: [
                              Image.network(
                                  request.awsPath +
                                      'customers/' +
                                      auth_controller
                                          .getcustomerlogo()
                                          .toString(),
                                  height: 36, errorBuilder:
                                      (BuildContext context, Object exception,
                                          StackTrace? stackTrace) {
                                return const Text('');
                              }),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: (() {
                                  LogoutDialog();
                                }),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color.fromRGBO(156, 155, 174, 1),

                                  ///    size: 20.0,
                                  //  semanticLabel: 'Text to announce in accessibility modes',
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
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 13, 0, 13),
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
                              child: Text(
                                'Valet Orders',
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
                                  Image.network(
                                      request.awsPath +
                                          'customers/' +
                                          auth_controller
                                              .getcustomerlogo()
                                              .toString(),
                                      // height: 240,
                                      width: 170, errorBuilder:
                                          (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                    return const Text('');
                                  }),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
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
                                              Text(
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
                                                    : '',

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
                                              Text(
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
                                                    : '',
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
                                                  child: Text(
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
                                                            orderdetail_controller
                                                                .orderdetails[0]
                                                                .order!
                                                                .customer!
                                                                .customerAddress!
                                                                .shippingCity
                                                                .toString() +
                                                            orderdetail_controller
                                                                .orderdetails[0]
                                                                .order!
                                                                .customer!
                                                                .customerAddress!
                                                                .shippingState
                                                                .toString() +
                                                            orderdetail_controller
                                                                .orderdetails[0]
                                                                .order!
                                                                .customer!
                                                                .customerAddress!
                                                                .country
                                                                .toString()
                                                        : '',

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
                                          Row(
                                            children: [
                                              // Image.asset(
                                              //   'images/fluent_web-asset-24-regular.jpg',
                                              // ),
                                              Icon(
                                                Icons.web_asset_outlined,
                                                color: Color.fromARGB(
                                                    255, 109, 109, 121),
                                                size: 12,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                'not given',
                                                // 'www.laundryname.com',
                                                style: TextStyle(
                                                  //  fontWeight: FontWeight.bold,
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 3),
                              child: Container(
                                color: Color.fromRGBO(255, 255, 255, 1),
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
                                                    Text(
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
                                                    Text(
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
                                                    Text(
                                                      'Order Ref#',
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
                                                    Text(
                                                      // '492',
                                                      orderdetail_controller
                                                                  .orderdetails[
                                                                      0]
                                                                  .order!
                                                                  .referenceNumber
                                                                  .toString() !=
                                                              null
                                                          ? orderdetail_controller
                                                              .orderdetails[0]
                                                              .order!
                                                              .referenceNumber
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
                                                    Text(
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
                                                    Text(
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
                                                    Text(
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
                                                    Text(
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
                                                                width: 5,
                                                              ),
                                                              SvgPicture.asset(
                                                                'imagessvg/tabler_switch-2.svg',
                                                                //   height: 20.0,
                                                                // width: 20.0,
                                                                //  allowDrawingOutsideViewBox: true,
                                                              ),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              Text(
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
                                                  height: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
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
                                                    Text(
                                                      ///'Sep 05, 2022',
                                                      orderdetail_controller
                                                                  .orderdetails[
                                                                      0]
                                                                  .order!
                                                                  .orderDate
                                                                  .toString() !=
                                                              null
                                                          ? orderdetail_controller
                                                              .orderdetails[0]
                                                              .order!
                                                              .orderDate
                                                              .toString()
                                                              .split(" ")
                                                              .last
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
                                child: Text(
                                  'Order Time',
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
                                  color: Color.fromRGBO(255, 255, 255, 1),
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
                                            child: Text(
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
                                            child: Text(
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
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
                                                    Text(
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
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
                                                    Text(
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
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
                                                    Text(
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
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
                                                    Text(
                                                      //  '\$650',

                                                      double.parse(orderdetail_controller
                                                                  .orderdetails[
                                                                      0]
                                                                  .order!
                                                                  .service![
                                                                      services]
                                                                  .valetOrderItem![
                                                                      items]
                                                                  .quantity
                                                                  .toString() +
                                                              orderdetail_controller
                                                                  .orderdetails[
                                                                      0]
                                                                  .order!
                                                                  .service![
                                                                      services]
                                                                  .valetOrderItem![
                                                                      items]
                                                                  .price
                                                                  .toString())
                                                          .toString(),
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
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
                                                    Text(
                                                      //   '\$50',
                                                      orderdetail_controller
                                                                  .orderdetails[
                                                                      0]
                                                                  .order!
                                                                  .service![
                                                                      services]
                                                                  .valetOrderItem![
                                                                      items]
                                                                  .price
                                                                  .toString() !=
                                                              null
                                                          ? '\$' +
                                                              orderdetail_controller
                                                                  .orderdetails[
                                                                      0]
                                                                  .order!
                                                                  .service![
                                                                      services]
                                                                  .valetOrderItem![
                                                                      items]
                                                                  .price
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
                                                )
                                              ],
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

                        /*/                SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
                          child: Container(
                            color: Color.fromRGBO(255, 255, 255, 1),
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
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
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
                                                Text(
                                                  '2879',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
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
                                                Text(
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
                                                Text(
                                                  '5',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'tem Name',
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
                                                Text(
                                                  'Sheets',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
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
                                                Text(
                                                  'Rate#',
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
                                                Text(
                                                  '\$65.00',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Service Name',
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
                                                Text(
                                                  'Wash, Iron, Clean',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
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
                                                Text(
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
                                                Text(
                                                  '\$350.00',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
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
                        );
                      },
                    ),
                  ),*/
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
                              Text(
                                'Total:',
                                style: TextStyle(
                                  //  fontWeight: FontWeight.w500,
                                  fontSize: 12.0,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                              Text(
                                '\$650',
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

  LogoutDialog() {
    return showDialog(
        context: context,
        builder: (_) =>
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              // Aligns the container to center
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 35, 40, 0),
                child: Container(
                  // A simplified version of dialog.

                  child: Card(
                    child: TextButton(
                      child: Text(
                        'Signout',
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
                        Get.to(Login());
                      },
                    ),
                  ),
                ),
              )
            ]));
  }
}
