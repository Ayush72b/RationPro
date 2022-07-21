import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_am_rich/homepage.dart';
import 'package:i_am_rich/landingscreen.dart';
import 'package:i_am_rich/login_screen.dart';
//import 'package:pinput/pinput.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


enum SingingCharacter { lafayette, jefferson }

class OtpVer extends StatefulWidget {
  static String id = 'otp verification';
  const OtpVer({Key? key}) : super(key: key);

  @override
  State<OtpVer> createState() => _OtpVerState();
}

class OtpAuth {
  final String authToken;
  final int id;
  const OtpAuth({required this.authToken, required this.id});
  factory OtpAuth.fromJson(Map<String, dynamic> json) {
    return OtpAuth(
      authToken: json['authToken'],
      id: json['id'],
    );
  }
}

Future<OtpAuth> checkOtp(int otp, OtpData otpData) async {
  final response = await http.post(
    Uri.parse(
        'https://asbafvexcc.execute-api.ap-south-1.amazonaws.com/Prod/user/verifyOtp'),
    headers: {
      "authtoken": otpData.authToken,
      "content-type": "application/json"
    },
    body: jsonEncode({
      "otp": otp,
    }),
  );

  if (response.statusCode == 200) {
    return OtpAuth.fromJson(jsonDecode(response.body));
  } else {
    //throw Exception('Failed to fetch data.');
    return const OtpAuth(authToken: "null", id: 0);
  }
}

class _OtpVerState extends State<OtpVer> {
  String _mode = 'Cash';
  //var _result;
  OtpFieldController otpController = OtpFieldController();
  int otp = 0;
  OtpData get otpData => ModalRoute.of(context)!.settings.arguments as OtpData;

  SingingCharacter? _character = SingingCharacter.lafayette;
  @override
  Widget build(BuildContext context) {
    double width = 376;
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xffFFB319),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 124),
                  child: Text(
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Playfair',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    margin: EdgeInsets.only(left: 55),
                    child: Row(
                      children: [
                        Text(
                          "OTP",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Playfair',
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "(A code has been sent on your phone number)",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Playfair',
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: OTPTextField(
                    length: 6,
                    controller: otpController,
                    width: width - 100,
                    fieldWidth: 40,
                    style: TextStyle(fontSize: 17),
                    fieldStyle: FieldStyle.box,
                    onCompleted: (pin) {
                      otp = int.parse(pin);

                      //OtpAuth token = await checkOtp(otp, otpData);
                    },
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    //   showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return AlertDialog(
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(30),
                    //         ),
                    //         content: Container(
                    //           height: 400,
                    //           //width: 400,
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Center(
                    //                 child: Text(
                    //                   "Order Details",
                    //                   style: TextStyle(
                    //                     fontSize: 20,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Color(0XFFFFB319),
                    //                   ),
                    //                 ),
                    //               ),
                    //               Divider(
                    //                 color: Color(0xffB8DFD8),
                    //               ),
                    //               Container(
                    //                 child: Text(
                    //                   "Address",
                    //                   style: TextStyle(
                    //                     fontSize: 12,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Colors.black,
                    //                   ),
                    //                 ),
                    //               ),
                    //               Container(
                    //                 child: Text(
                    //                   "Random Text",
                    //                   style: TextStyle(
                    //                     fontSize: 10,
                    //                     //fontWeight: FontWeight.bold,
                    //                     color: Colors.black,
                    //                   ),
                    //                 ),
                    //               ),
                    //               Container(
                    //                 child: Text(
                    //                   "Payable Amount",
                    //                   style: TextStyle(
                    //                     fontSize: 12,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Colors.black,
                    //                   ),
                    //                 ),
                    //               ),
                    //               Container(
                    //                 child: Text(
                    //                   "Mode of payment",
                    //                   style: TextStyle(
                    //                     fontSize: 12,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Colors.black,
                    //                   ),
                    //                 ),
                    //               ),
                    //               ListTile(
                    //                 leading: Radio<String>(
                    //                   value: 'Cash',
                    //                   groupValue: _mode,
                    //                   onChanged: (value) {
                    //                     setState(() {
                    //                       _mode = value!;
                    //                     });
                    //                   },
                    //                 ),
                    //                 title: const Text('Cash on delivery'),
                    //               ),
                    //               ListTile(
                    //                 leading: Radio<String>(
                    //                   value: 'Online',
                    //                   groupValue: _mode,
                    //                   onChanged: (value) {
                    //                     setState(() {
                    //                       _mode = value!;
                    //                     });
                    //                   },
                    //                 ),
                    //                 title: const Text('Online payment'),
                    //               ),
                    //               Expanded(
                    //                 child: SizedBox(),
                    //               ),
                    //               Row(
                    //                 children: [
                    //                   InkWell(
                    //                     onTap: () {},
                    //                     child: Container(
                    //                       height: 36,
                    //                       width: 128,
                    //                       decoration: BoxDecoration(
                    //                         shape: BoxShape.rectangle,
                    //                         borderRadius:
                    //                             BorderRadius.circular(36),
                    //                         color: Color(0XffE8F6EF),
                    //                       ),
                    //                       child: Center(
                    //                         child: Text(
                    //                           "Cancel",
                    //                           style: TextStyle(
                    //                             fontSize: 18,
                    //                             color: Colors.grey,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   Expanded(child: SizedBox()),
                    //                   InkWell(
                    //                     onTap: () {},
                    //                     child: Container(
                    //                       height: 36,
                    //                       width: 128,
                    //                       decoration: BoxDecoration(
                    //                         shape: BoxShape.rectangle,
                    //                         borderRadius:
                    //                             BorderRadius.circular(36),
                    //                         color: Color(0XFFFFB319),
                    //                       ),
                    //                       child: Center(
                    //                         child: Text(
                    //                           "Confirm",
                    //                           style: TextStyle(
                    //                             fontSize: 18,
                    //                             color: Colors.white,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   );
                  },
                  child: Container(
                    child: Text(
                      "Resend OTP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Playfair',
                        //fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 60,
                    width: 280,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        //BoxShadow
                      ],
                      border: Border.all(
                          color: Colors.white,
                          width: 4.0,
                          style: BorderStyle.solid),
                      //boxShadow: BoxShadow,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(32),
                      color: Color(0xffFFB319),
                    ),
                    child: InkWell(
                      onTap: () async {
                        OtpAuth token = await checkOtp(otp, otpData);
                        if (token.authToken != "null") {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('authToken', token.authToken);
                          Navigator.pushNamed(context, LandingScreen.id);
                        }else{
                          const snackBar = SnackBar(content: Text('Yay! A SnackBar!'),);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
/*                         showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              content: Container(
                                height: 400,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            "Product Name",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Expanded(child: SizedBox()),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: Color(0xffB8DFD8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Divider(
                                        color: Color(0xffB8DFD8),
                                      ),
                                    ),
                                    Container(
                                      child: Image.asset(
                                        'Assets/grain.png',
                                        width: 268.0,
                                        height: 180.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Price INR-XX per quantity",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 14,
                                            //fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Expanded(child: SizedBox()),
                                        Text(
                                          "XX% OFF",
                                          //textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 14,
                                            //fontWeight: FontWeight.bold,
                                            color: Color(0xffFFB319),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Text(
                                        "Description",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 12,
                                          //fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "Random Text",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Container(
                                      height: 36,
                                      width: 268,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(36),
                                        color: Color(0XFFFFB319),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Add to Cart",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ); */
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Validate",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
