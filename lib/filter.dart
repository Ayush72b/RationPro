import 'package:flutter/material.dart';
import 'package:i_am_rich/searchscreen.dart';
// import 'package:material_dropdown_formfield/material_dropdown_formfield.dart';

class filter extends StatefulWidget {
  static String id = 'filter';
  const filter({Key? key}) : super(key: key);

  @override
  State<filter> createState() => _filter();
}

class _filter extends State<filter> {
  String? selectedValue1 = null;
  String? selectedValue2 = null;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Rice"), value: "Rice"),
      DropdownMenuItem(child: Text("Dal"), value: "Dal"),
      DropdownMenuItem(child: Text("Wheat"), value: "Wheat"),
      DropdownMenuItem(child: Text("Sauce"), value: "Sauce"),
      DropdownMenuItem(child: Text("Dry Friuts"), value: "Dry Friuts"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownsort {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Cheapest first"), value: "Cheapest first"),
      DropdownMenuItem(
          child: Text("Costliest first"), value: "Costliest first"),
      DropdownMenuItem(child: Text("Newest first"), value: "Newest first"),
      DropdownMenuItem(child: Text("Oldest first"), value: "Oldest first"),
      DropdownMenuItem(
          child: Text("Alphabetical Order"), value: "Alphabetical Order"),
      DropdownMenuItem(
          child: Text("Highest number of likes"),
          value: "Highest number of likes"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, search.id);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xffB8DFD8),
          ),
        ),
        title: Text(
          "Filter your search",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(0xffB8DFD8),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                "Category",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffB8DFD8), width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffB8DFD8), width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) =>
                        value == null ? "Select a Category" : null,
                    dropdownColor: Colors.white,
                    value: selectedValue1,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue1 = newValue!;
                      });
                    },
                    items: dropdownItems)),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                "Sort",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffB8DFD8), width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffB8DFD8), width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) => value == null ? "How to sort" : null,
                    dropdownColor: Colors.white,
                    value: selectedValue2,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue2 = newValue!;
                      });
                    },
                    items: dropdownsort)),
          ],
        ),
      ),
    );
  }
}
