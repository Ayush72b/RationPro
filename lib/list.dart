import 'package:flutter/cupertino.dart';

class Item {
  final String title;
  final String desc;
  int tap;
  Item({required this.title, required this.desc, required this.tap});
}

class Notilist {
  static final notifications = [
    Item(
      title: "Notification 1",
      desc: 'Order no. XXX123 has been shipped',
      tap: 0,
    ),
  ];
}
