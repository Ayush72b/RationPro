import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class wishlist extends StatefulWidget {
  static String id = 'wishlist';
  const wishlist({Key? key}) : super(key: key);

  @override
  _wishlistState createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  List<String> img_lst = [
    'images/img1.jpg',
    'images/img2.jpg',
    'images/img3.jpg',
    'images/img4.jpg',
    'images/img5.jpg',
  ];
  List<String> items = [
    'Sauce',
    'Dals',
    'Rice',
    'Dry Fruits',
    'Vegetables',
  ];
  Icon liked = Icon(Icons.favorite, color: Colors.red);
  Icon unliked = Icon(Icons.favorite_outline_rounded);
  List<Icon> current = [
    Icon(Icons.favorite, color: Colors.red),
    Icon(Icons.favorite, color: Colors.red),
    Icon(Icons.favorite, color: Colors.red),
    Icon(Icons.favorite, color: Colors.red),
    Icon(Icons.favorite, color: Colors.red)
  ];
  List<int> price = [12, 20, 34, 45, 100];
  int _selectedindex = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Wishlist',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xffFFB319),
        ),
        body: ListView(
          children: [
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 0.5,
              shrinkWrap: true,
              children: List.generate(
                5,
                (index) {
                  return Column(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 0.2,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: GestureDetector(
                              onTap: () {
                                print('products');
                              },
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        content: Container(
                                          height: 400,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Product Name",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                        color:
                                                            Color(0xffB8DFD8),
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
                                                  borderRadius:
                                                      BorderRadius.circular(36),
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
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(img_lst[index]),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            //color: Colors.red,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                items[index],
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: GestureDetector(
                              onTap: () {
                                print('liked');
                                setState(() {
                                  if (current[index] == liked)
                                    current[index] = unliked;
                                  else
                                    current[index] = liked;
                                });
                              },
                              child: current[index],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 17.0),
                            child:
                                Text('₹' + price[index].toString() + ' per Kg'),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              print('added to cart');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 45.0, vertical: 3.0),
                              child: Text(
                                'Add to cart',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffFFB319),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
