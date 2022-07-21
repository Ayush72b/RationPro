// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:i_am_rich/otp_verification.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class OtpData {
  final String authToken;
  const OtpData({required this.authToken});
  factory OtpData.fromJson(Map<String, dynamic> json) {
    return OtpData(
      authToken: json['authtoken'],
    );
  }
}

Future<OtpData> createOtpData(String phone) async {
  final response = await http.post(
    Uri.parse(
        'https://igyk8qqvl5.execute-api.ap-south-1.amazonaws.com/Prod/user/sendOtp'),
    body: jsonEncode({
      'phoneno': phone,
    }),
  );

  if (response.statusCode == 200) {
    return OtpData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch data.');
  }
}

class login extends StatefulWidget {
  static String id = 'login screen';
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    margin: EdgeInsets.only(right: 160),
                    child: Text("PHONE NUMBER",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Playfair',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ))),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                        fillColor: Color(0xffE8F6EF),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color(0xffB8DFD8), width: 4.0),
                            borderRadius: BorderRadius.circular(16)),
                        hintText: 'Enter Number',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                      "A validation code will be sent on this phone number.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      )),
                )),
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
                        OtpData authtoken = await createOtpData(myController.text);
                        Navigator.pushNamed(context, OtpVer.id, arguments: authtoken);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Sent OTP",
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
