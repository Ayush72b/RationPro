import 'package:flutter/material.dart';
import 'package:i_am_rich/homepage.dart';
import 'package:i_am_rich/mybasket.dart';
import 'package:i_am_rich/searchscreen.dart';
import 'package:i_am_rich/wishlist.dart';

class LandingScreen extends StatefulWidget {
  static String id = 'landing_screen';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  static String id = 'landing_screen';
  int _selectedindex = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  void pageChanged(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      _selectedindex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          pageChanged(index);
        },
        children: <Widget>[
          HomePage(),
          search(),
          wishlist(),
          MyBasket(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'My Basket',
          ),
        ],
        currentIndex: _selectedindex,
        selectedItemColor: Color(0xffFFB319),
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        onTap: (index) {
          bottomTapped(index);
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
