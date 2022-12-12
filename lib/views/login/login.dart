import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/inputvalidation_Controller.dart';
import '../home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final login_controller = Get.put(AuthenticationManagerController());
  final validation_controller = Get.put(InputVaildation());
  bool valuefirst = false;

  bool _showPassword = true;
  final email = TextEditingController();
  final password = TextEditingController();
  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 199, 198, 198),
      body: Column(
        //  crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/Vector.png',
              fit: BoxFit.cover,
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   //   width: double.infinity,
          //   child: Image.asset('images/Vector.png'),
          // ),

          // Text(
          //   'Login',
          //   style: TextStyle(
          //       fontWeight: FontWeight.w500,
          //       fontSize: 30.0,
          //       color: Colors.black
          //       //    color: Color.fromRGBO(255, 255, 255, 1),
          //       ),
          // ),
          SvgPicture.asset(
            'imagessvg/loginlogo.svg',
            //   height: 20.0,
            // width: 20.0,
            //  allowDrawingOutsideViewBox: true,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Proceed with your',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromRGBO(56, 70, 78, 1),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'LOGIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Color.fromRGBO(9, 85, 193, 1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(14),
            child: TextFormField(
              //  obscureText: _changePassword,
              controller: email,
              style:
                  TextStyle(fontSize: 14.0, color: Color.fromRGBO(56, 70, 78, 1)
                      // fontWeight: FontWeight.bold
                      ),
              cursorColor: Colors.grey.shade500,

              decoration: InputDecoration(
                fillColor: Color.fromARGB(156, 234, 235, 239),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5.0)),
                contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                labelText: "Email",
                hintStyle: TextStyle(
                    fontSize: 12.0,
                    color: Color.fromRGBO(83, 83, 83, 1),
                    fontWeight: FontWeight.w500),
                labelStyle: TextStyle(
                    fontSize: 12.0,
                    color: Color.fromRGBO(83, 83, 83, 1),
                    fontWeight: FontWeight.w500),
              ),
              autocorrect: false,
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: EdgeInsets.all(14),
            child: TextFormField(
              controller: password,
              obscureText: _showPassword,
              style:
                  TextStyle(fontSize: 14.0, color: Color.fromRGBO(56, 70, 78, 1)
                      // fontWeight: FontWeight.bold
                      ),
              cursorColor: Colors.grey.shade500,
              decoration: InputDecoration(
                fillColor: Color.fromARGB(156, 234, 235, 239),
                filled: true,
                suffixIcon: GestureDetector(
                  onTap: _togglePasswordVisibility,
                  child: _showPassword
                      ? Icon(Icons.visibility_outlined,
                          color: Color.fromARGB(156, 45, 46, 48))
                      : Icon(Icons.visibility_off_outlined,
                          color: Color.fromARGB(156, 45, 46, 48)),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5.0)),
                contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                labelText: "Password",
                hintStyle: TextStyle(
                    fontSize: 12.0,
                    color: Color.fromRGBO(83, 83, 83, 1),
                    fontWeight: FontWeight.w500),
                labelStyle: TextStyle(
                    fontSize: 12.0,
                    color: Color.fromRGBO(83, 83, 83, 1),
                    fontWeight: FontWeight.w500),
              ),
              autocorrect: false,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(1, 0, 14, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color.fromRGBO(9, 85, 193, 1),
                    value: valuefirst,
                    onChanged: (value) {
                      setState(() {
                        valuefirst = !valuefirst;
                      });
                    },
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(
                      //   fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color: Color.fromRGBO(50, 70, 78, 1),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                    //   color: Color.fromRGBO(23, 197, 204, 1),
                    //        width: 230,
                    child: Obx(
                      (() => Container(
                            height: 50,
                            child: TextButton(
                              child: login_controller.isLoading.value
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'LOGIN',
                                      //   'Login',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        color: Colors.white,
                                      ),
                                    ),

                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        login_controller.isLoading.value
                                            ? Color.fromRGBO(9, 85, 193, 1)
                                            : Color.fromRGBO(9, 85, 193, 1)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),

                                    //   side: BorderSide(color: Colors.red.shade900),
                                  ),
                                ),
                              ),
                              //      color: Colors.black,
                              //  textColor: Colors.white,
                              //     shape: RoundedRectangleBorder(
                              //borderRadius: BorderRadius.circular(30)),

                              onPressed: () {
                                if (validation_controller.validateField(
                                        "Email", email.text.trim()) &&
                                    validation_controller.validateField(
                                        "Password", password.text.trim())) {
                                  login_controller.login_function(
                                      email.text, password.text);
                                }
                                ;
                              },
                            ),
                          )),
                    ),
                  )
                ]),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/Vector (1).png',
              fit: BoxFit.cover,
              //   alignment: Alignment.bottomCenter,
            ),
          ),
        ],
      ),
    );
  }
}
