import 'package:flutter/material.dart';

class Menuscreen extends StatefulWidget {
  const Menuscreen({Key? key}) : super(key: key);

  @override
  State<Menuscreen> createState() => _MenuscreenState();
}

class _MenuscreenState extends State<Menuscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white12,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xffB8DFD8),
            ),
            onPressed: () {
              print('object');
            },
          ),
          title: Text(
            'Menu',
            style: TextStyle(
              color: Color(0xffB8DFD8),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(children: [
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.person_pin,
              color: Color(0xffB8DFD8),
            ),
            title: Text(
              'My Profile',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.favorite,
              color: Color(0xffB8DFD8),
            ),
            title: Text(
              'My Wishlist',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.shopping_cart,
              color: Color(0xffB8DFD8),
            ),
            title: Text(
              'My Orders',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.notifications,
              color: Color(0xffB8DFD8),
            ),
            title: Text(
              'Notifications',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.help,
              color: Color(0xffB8DFD8),
            ),
            title: Text(
              'Help & Support',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ]));
  }
}
