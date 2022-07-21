import 'dart:convert';
import 'package:i_am_rich/filter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Items {
  final int id;
  final String name;
  final String description;
  final int price;
  final int stock;
  final String primaryImage;
  final int category;
  final int? likes;
  final List<String> images;

  const Items(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.stock,
      required this.primaryImage,
      required this.category,
      required this.likes,
      required this.images});
  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      stock: json['stock'],
      primaryImage: json['primary_image'],
      category: json['category'],
      likes: json['likes'],
      images: json['images'].cast<String>(),
    );
  }
}

Future<List<Items>> getProductData() async {
  final prefs = await SharedPreferences.getInstance();
  final String authToken = prefs.getString('authToken')!;
  final response = await http.post(
    Uri.parse(
        'https://58wlnugovh.execute-api.ap-south-1.amazonaws.com/Prod/user/getallProductDetails'),
    headers: {"authtoken": authToken, "content-type": "application/json"},
  );

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    var itemss = data.map((e) => Items.fromJson(e)).toList();
    return itemss;
  } else {
    throw Exception('Failed to fetch data.');
  }
}

class search extends StatefulWidget {
  static String id = 'search';
  const search({Key? key}) : super(key: key);

  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  TextEditingController controller = TextEditingController();

  /*List<String> img_lst = [
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
  ];*/
  Icon liked = Icon(Icons.favorite, color: Colors.red);
  Icon unliked = Icon(Icons.favorite_outline_rounded);
  
  List<int> current = [];
  
  int _selectedindex = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Items>> snap;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFB319),
        title: Container(
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      controller.text = "";
                    },
                  ),
                  hintText: 'search items',
                  border: InputBorder.none),
            ),
          ),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.only(right: 8.0),
          //     child: IconButton(
          //         onPressed: () {
                    
          //         },
          //         icon: Icon(
          //           Icons.filter_alt_outlined,
          //           size: 30,
          //         )),
          //   )
          // ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  print('filter');
                  Navigator.pushNamed(context, filter.id);
                },
                icon: Icon(
                  Icons.filter_alt_outlined,
                  size: 30,
                )),
          )
        ],
      ),
      body: FutureBuilder<List<Items>>(
          future: getProductData(),
          builder: (BuildContext context, AsyncSnapshot<List<Items>> snap) {
            if (snap.data == null) {
              return CircularProgressIndicator();
            } else if (snap.hasError) {
              return Text(snap.error.toString());
            } else {
              return ListView(
                children: [
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 0.5,
                    shrinkWrap: true,
                    children: List.generate(
                      snap.data!.length, //FIX NULL ISSUEE
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
                                                            snap.data![index].name,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child:
                                                                  SizedBox()),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Icon(
                                                              Icons.cancel,
                                                              color: Color(
                                                                  0xffB8DFD8),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Divider(
                                                        color:
                                                            Color(0xffB8DFD8),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 180.0,
                                                      width: 268.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(snap.data![index].primaryImage),
                                                          fit: BoxFit.fill,
                                                          )

                                                      ) 
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Price: ₹"+snap.data![index].price.toString(),
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            //fontWeight: FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Expanded(
                                                            child: SizedBox()),
                                                        Text(
                                                          "XX% OFF",
                                                          //textAlign: TextAlign.right,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            //fontWeight: FontWeight.bold,
                                                            color: Color(
                                                                0xffFFB319),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        snap.data![index].description,
                                                        textAlign:
                                                            TextAlign.left,
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
                                                        shape:
                                                            BoxShape.rectangle,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(36),
                                                        color:
                                                            Color(0XFFFFB319),
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
                                            image: NetworkImage(
                                                snap.data![index].primaryImage),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                      snap.data![index].name,
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
                                        if (current.contains(snap.data![index].id))
                                          current.remove(snap.data![index].id);
                                        else
                                          current.add(snap.data![index].id);
                                      });
                                    },
                                    child: current.contains(snap.data![index].id) ? liked : unliked,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 17.0),
                                  child: Text('₹' +
                                      snap.data![index].price.toString() +
                                      ' per Kg'),
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
              );
            }
          }),
    ));
  }
}
