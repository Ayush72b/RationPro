import 'package:flutter/material.dart';

class MyBasket extends StatefulWidget {
  static String id = 'MyBasket';
  const MyBasket({Key? key}) : super(key: key);

  @override
  _MyBasketState createState() => _MyBasketState();
}

class _MyBasketState extends State<MyBasket> {
  setupAlertDialoadContainer() {
    return Container(
      // height: 300.0, // Change as per your requirement
      // width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        //itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(name[index]),
            trailing: Text('+ XXXX'),
          );
        },
      ),
    );
  }

  List<String> options = [
    'Cash on delivery',
    'Online payment',
  ];
  List<String> images = [
    'images/wheat.jpg',
    'images/wheat.jpg',
    'images/wheat.jpg',
    'images/wheat.jpg',
    'images/wheat.jpg',
  ];
  List<String> name = ["Wheat", "Wheat", "Wheat", "Wheat", "Wheat"];
  List<int> price = [20, 30, 40, 50, 60];
  List<int> quantity = [1, 1, 1, 1, 1];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffFFB319),
          title: Text(
            'My Basket',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
        ),
        body: ListView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext, index) {
                return Card(
                  elevation: 0,
                  child: ListTile(
                    leading: Image(
                      image: AssetImage(
                        images[index],
                      ),
                    ),
                    title: Text(
                      name[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("₹" + price[index].toString() + " per Kg"),
                        Text(
                          "Total Price",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffE8F6EF),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "₹" + (price[index] * quantity[index]).toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(height: 3),
                        Container(
                          height: 18,
                          width: 40,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (quantity[index] > 1) quantity[index]--;
                                  });
                                },
                                child: Text(
                                  '- ',
                                  style: TextStyle(
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                              Text(
                                quantity[index].toString(),
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      quantity[index]++;
                                    },
                                  );
                                },
                                child: Text(
                                  ' +',
                                  style: TextStyle(
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: name.length,
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
            ),
            ListTile(
              leading: Text('Payable amount',
                  style: TextStyle(
                    fontSize: 23,
                  )),
              trailing: GestureDetector(
                onTap: () {},
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('Apply Coupon'),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffFFB319),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext, index) {
                return Container(
                  height: 20,
                  child: ListTile(
                    leading: Text(name[index]),
                    trailing: Text('+ XXXX'),
                  ),
                );
              },
              itemCount: name.length,
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                height: 20,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('Discount'),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text('- XXXX'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.0, right: 20, left: 20),
              child: Container(
                height: 28,
                child: Center(child: Text('XXXX')),
                decoration: BoxDecoration(color: Color(0xffE8F6EF)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 80, left: 80),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      int _mode = 1;
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        content: Container(
                          height: 400,
                          //width: 400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "Order Details",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFFFFB319),
                                  ),
                                ),
                              ),
                              Divider(
                                color: Color(0xffB8DFD8),
                              ),
                              Container(
                                child: Text(
                                  "Address",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Random Text",
                                  style: TextStyle(
                                    fontSize: 14,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "Payable Amount",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 0),
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'XXXX',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Color(0XFFFFB319),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //setupAlertDialoadContainer(),
                              Container(
                                child: Text(
                                  "Mode of payment",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return Row(
                                    //mainAxisSize: MainAxisSize.min,
                                    children:
                                        List<Widget>.generate(2, (int index1) {
                                      return Row(
                                        children: [
                                          Radio<int>(
                                            value: index1,
                                            groupValue: _mode,
                                            onChanged: (value) {
                                              setState(() => _mode = value!);
                                            },
                                          ),
                                          Text(
                                            options[index1],
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  );
                                },
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 36,
                                      width: 128,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(36),
                                        color: Color(0XffE8F6EF),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 36,
                                      width: 128,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(36),
                                        color: Color(0XFFFFB319),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Confirm",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 33,
                  width: 60,
                  child: Center(
                      child: Text(
                    'Place Order',
                    style: TextStyle(fontSize: 18),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xffFFB319),
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
