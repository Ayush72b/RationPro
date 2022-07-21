import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'list.dart';

class notiWidget extends StatefulWidget {
  final Item item;
  notiWidget({
    required this.item,
    Key? key,
  }) : super(key: key);
  @override
  _notiWidgetState createState() => _notiWidgetState();
}

class _notiWidgetState extends State<notiWidget> {
  Color col1 = Color(0xffE8F6EF);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
      child: ListTile(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        leading: Icon(Icons.notifications_active),
        tileColor: col1,
        onTap: () {},
      ),
    );
  }
}
