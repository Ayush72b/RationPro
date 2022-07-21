import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_am_rich/filter.dart';
import 'package:i_am_rich/homepage.dart';
import 'package:i_am_rich/landingscreen.dart';
import 'package:i_am_rich/login_screen.dart';
import 'package:i_am_rich/mybasket.dart';
import 'package:i_am_rich/notification.dart';
import 'package:i_am_rich/otp_verification.dart';
import 'package:i_am_rich/profile.dart';
import 'package:i_am_rich/searchscreen.dart';
import 'package:i_am_rich/wishlist.dart';
import 'package:i_am_rich/mybasket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: login(),
        routes: {
          login.id: (context) => login(),
          OtpVer.id: (context) => OtpVer(),
          HomePage.id: (context) => HomePage(),
          LandingScreen.id: (context) => LandingScreen(),
          filter.id: (context) => filter(),
          search.id: (context) => search(),
          wishlist.id: (context) => wishlist(),
          MyBasket.id: (context) => MyBasket(),
          Notificationpage.id: (context) => Notificationpage(),
          profile.id: (context) => profile(),
        },
      ),
    );
  }
}
