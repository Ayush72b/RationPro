import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list.dart';
import 'notiWidget.dart';

class Notificationpage extends StatefulWidget {
  static String id = 'notification';
  const Notificationpage({Key? key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notificationpage> {
  List<Icon> ic1 = [
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active),
    Icon(Icons.notifications_active)
  ];
  List<Icon> ic2 = [
    Icon(Icons.notifications),
    Icon(Icons.notifications),
    Icon(Icons.notifications),
    Icon(Icons.notifications),
    Icon(Icons.notifications),
    Icon(Icons.notifications),
    Icon(Icons.notifications),
    Icon(Icons.notifications),
    Icon(Icons.notifications),
    Icon(Icons.notifications),
    Icon(Icons.notifications),
    Icon(Icons.notifications),
    Icon(Icons.notifications),
    Icon(Icons.notifications),
    Icon(Icons.notifications)
  ];
  Color col1 = Color(0xffE8F6EF);
  Color col2 = Color(0xffE8F6EF);
  Color col3 = Color(0xffE8F6EF);
  Color col4 = Color(0xffE8F6EF);
  Color col5 = Color(0xffE8F6EF);
  Color col6 = Color(0xffE8F6EF);
  Color col7 = Color(0xffE8F6EF);
  Color col8 = Color(0xffE8F6EF);
  Color col9 = Color(0xffE8F6EF);
  Color col10 = Color(0xffE8F6EF);
  Color col11 = Color(0xffE8F6EF);
  Color col12 = Color(0xffE8F6EF);
  Color col13 = Color(0xffE8F6EF);
  Color col14 = Color(0xffE8F6EF);
  Color col15 = Color(0xffE8F6EF);

  @override
  Widget build(BuildContext context) {
    final longlist = List.generate(20, (index) => Notilist.notifications[0]);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFFB319),
          title: Text(
            'Notifications',
            textAlign: TextAlign.center,
          ),
        ),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[0],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col1,
              onTap: () {
                setState(() {
                  if (col1 != Colors.white) {
                    col1 = Colors.white;
                    ic1[0] = ic2[0];
                  } else {
                    col1 = Color(0xffE8F6EF);
                    ic1[0] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[1],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col2,
              onTap: () {
                setState(() {
                  if (col2 != Colors.white) {
                    col2 = Colors.white;
                    ic1[1] = ic2[1];
                  } else {
                    col2 = Color(0xffE8F6EF);
                    ic1[1] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[2],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col3,
              onTap: () {
                setState(() {
                  if (col3 != Colors.white) {
                    col3 = Colors.white;
                    ic1[2] = ic2[2];
                  } else {
                    col3 = Color(0xffE8F6EF);
                    ic1[2] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[3],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col4,
              onTap: () {
                setState(() {
                  if (col4 != Colors.white) {
                    col4 = Colors.white;
                    ic1[3] = ic2[3];
                  } else {
                    col4 = Color(0xffE8F6EF);
                    ic1[3] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[4],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col5,
              onTap: () {
                setState(() {
                  if (col5 != Colors.white) {
                    col5 = Colors.white;
                    ic1[4] = ic2[4];
                  } else {
                    col5 = Color(0xffE8F6EF);
                    ic1[4] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[5],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col6,
              onTap: () {
                setState(() {
                  if (col6 != Colors.white) {
                    col6 = Colors.white;
                    ic1[5] = ic2[5];
                  } else {
                    col6 = Color(0xffE8F6EF);
                    ic1[5] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[6],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col7,
              onTap: () {
                setState(() {
                  if (col7 != Colors.white) {
                    col7 = Colors.white;
                    ic1[6] = ic2[6];
                  } else {
                    col7 = Color(0xffE8F6EF);
                    ic1[6] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[7],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col8,
              onTap: () {
                setState(() {
                  if (col8 != Colors.white) {
                    col8 = Colors.white;
                    ic1[7] = ic2[7];
                  } else {
                    col8 = Color(0xffE8F6EF);
                    ic1[7] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[8],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col9,
              onTap: () {
                setState(() {
                  if (col9 != Colors.white) {
                    col9 = Colors.white;
                    ic1[8] = ic2[8];
                  } else {
                    col9 = Color(0xffE8F6EF);
                    ic1[8] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[9],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col10,
              onTap: () {
                setState(() {
                  if (col10 != Colors.white) {
                    col10 = Colors.white;
                    ic1[9] = ic2[9];
                  } else {
                    col10 = Color(0xffE8F6EF);
                    ic1[9] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[10],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col12,
              onTap: () {
                setState(() {
                  if (col12 != Colors.white) {
                    col12 = Colors.white;
                    ic1[10] = ic2[10];
                  } else {
                    col12 = Color(0xffE8F6EF);
                    ic1[10] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[11],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col13,
              onTap: () {
                setState(() {
                  if (col13 != Colors.white) {
                    col13 = Colors.white;
                    ic1[11] = ic2[11];
                  } else {
                    col13 = Color(0xffE8F6EF);
                    ic1[11] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[12],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col14,
              onTap: () {
                setState(() {
                  if (col14 != Colors.white) {
                    col14 = Colors.white;
                    ic1[12] = ic2[12];
                  } else {
                    col14 = Color(0xffE8F6EF);
                    ic1[12] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[13],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col15,
              onTap: () {
                setState(() {
                  if (col15 != Colors.white) {
                    col15 = Colors.white;
                    ic1[13] = ic2[13];
                  } else {
                    col15 = Color(0xffE8F6EF);
                    ic1[13] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              leading: ic1[14],
              title: Text('Notification 1'),
              subtitle: Text('Order no. XXX123 has been shipped'),
              tileColor: col11,
              onTap: () {
                setState(() {
                  if (col11 != Colors.white) {
                    col11 = Colors.white;
                    ic1[14] = ic2[14];
                  } else {
                    col11 = Color(0xffE8F6EF);
                    ic1[14] = Icon(Icons.notifications_active);
                  }
                });
              },
            ),
          ),
        ]),
      ),
    );
  }
}
