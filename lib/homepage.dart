import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:i_am_rich/mybasket.dart';
import 'package:i_am_rich/notification.dart';
import 'package:i_am_rich/profile.dart';
import 'package:i_am_rich/wishlist.dart';

class HomePage extends StatefulWidget {
  static String id = 'homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> img_lst = [
    'images/img1.jpg',
    'images/img2.jpg',
    'images/img3.jpg',
    'images/img4.jpg',
    'images/img5.jpg',
    'images/img6.jpg',
    'images/img7.jpg',
  ];
  List<String> items = [
    'Sauce',
    'Dals',
    'Rice',
    'Dry Fruits',
    'Vegetables',
    'Fruits',
    'Biscuits',
    'Chips'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          title: Text(
            'Ration Pro',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          backgroundColor: Color(0xffFFB319),
          actions: [
            GestureDetector(
              onTap: () {
                print('profile');
              },
              child: Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('images/img2.jpg'), fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Shubham Raj',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                accountEmail: Text(
                  'sr9331616@gmail.com',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                currentAccountPicture: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, profile.id);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xffFFB319),
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, wishlist.id);
                  },
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('My Wishlist'),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MyBasket.id);
                  },
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text('My Orders'),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Notificationpage.id);
                  },
                  child: ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notifications'),
                  )),
              InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help & Support'),
                  )),
            ],
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
              items: img_lst
                  .map((e) => ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              e,
                              height: 250,
                              width: 150,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: false,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                height: 200,
              ),
            ),
            SizedBox(
              height: 15.0,
              width: 50.0,
              child: Divider(
                indent: 16,
                endIndent: 32,
                color: Color(0xffFFB319),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 27),
              child: Text(
                'Products',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffFFB319),
                ),
              ),
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 0.5,
              shrinkWrap: true,
              children: List.generate(
                6,
                (index) {
                  return Padding(
                    padding: EdgeInsets.all(7.0),
                    child: GestureDetector(
                      onTap: () {
                        print('products');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(img_lst[index]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                          color: Colors.black26,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              items[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.0,
              width: 50.0,
              child: Divider(
                indent: 16,
                endIndent: 32,
                color: Color(0xffFFB319),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27, vertical: 3),
              child: Text(
                'Shop by Category',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffB8DFD8),
                ),
              ),
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: (1 / 0.325),
              crossAxisSpacing: 3.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              children: List.generate(
                8,
                (index) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          items[index],
                          style: TextStyle(
                            color: Color(0xffFFB319),
                            fontSize: 20,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          elevation: 1,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              color: Colors.red,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Browse All',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xffFFB319),
                  primary: Colors.white,
                  elevation: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
