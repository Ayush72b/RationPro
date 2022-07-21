import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_am_rich/homepage.dart';

class profile extends StatefulWidget {
  static String id = 'profile';
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0XffFFB319),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, HomePage.id);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "My Profile",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 255,
              color: const Color(0XffFFB319),
              child: Column(
                children: [
                  const Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 105,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('Assets/Profile_image.png'),
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        children: [
                          const Expanded(child: SizedBox.expand()),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Edit",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            height: 24,
                            width: 64,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "Name:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 103, top: 10),
                  child: Text(
                    "Random Name",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "Phone Number:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "Random Number",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "Email:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 106, top: 10),
                  child: Text(
                    "Random Email",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "Address:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 10),
                  child: Text(
                    "Random Address",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 25,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      const Expanded(child: SizedBox.expand()),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: const Color(0XffFFB319),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, HomePage.id);
                          },
                          child: Text(
                            "Edit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        height: 24,
                        width: 64,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
