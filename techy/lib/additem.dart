import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techy/home.dart';
import 'package:techy/mysql.dart';

import 'dart:io';

import 'package:techy/profile.dart';
import 'package:techy/search.dart';

class addItemScreen extends StatefulWidget {
  addItemScreen({super.key});

  @override
  State<addItemScreen> createState() => _addItemScreenState();
}

class _addItemScreenState extends State<addItemScreen> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  var db = new Mysql();

  final priceinput = TextEditingController();

  final descriptioninput = TextEditingController();

  final nameinput = TextEditingController();

  final categoryinput = TextEditingController();

  @override
  void dispose() {
    priceinput.dispose();
    descriptioninput.dispose();
    nameinput.dispose();
    super.dispose();
  }

  void getThings() async {
    final bytes = File(image!.path).readAsBytesSync();
    String base64Image = "data:image/png;base64," + base64Encode(bytes);

    print("img_pan : $base64Image");
    var conn = await db.getConnection();
    String sql =
        'insert into  products (name, price, description, image, category) VALUES (\'${nameinput.text}\', \'${priceinput.text}\', \'${descriptioninput.text}\', \'${base64Image}\', \'${categoryinput.text}\');';
    var results = await conn.query(sql);
    print("Test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Techy"),
      //   ce
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: SvgPicture.asset(
                "assets/images/logo.svg",
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                "Add Product",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: nameinput,
                  cursorHeight: 20,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Enter your product name",
                    prefixIcon: Icon(Icons.arrow_forward),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: priceinput,
                  // keyboardType: TextInputType.number,
                  cursorHeight: 20,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Enter your product price",
                    prefixIcon: Icon(Icons.arrow_forward),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: descriptioninput,
                  cursorHeight: 20,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Enter your product description",
                    prefixIcon: Icon(Icons.arrow_forward),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: categoryinput,
                  cursorHeight: 20,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Enter your product category",
                    prefixIcon: Icon(Icons.arrow_forward),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 60),
                child: Row(
                  children: [
                    Center(
                      child: MaterialButton(
                        minWidth: 100,
                        height: 60,
                        color: Colors.grey,
                        child: Text("Select photo"),
                        onPressed: () {
                          pickImage();
                        },
                      ),
                    ),
                    image != null
                        ? Image.file(
                            image!,
                            width: 50,
                          )
                        : Text("No image selected"),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 60),
              child: MaterialButton(
                minWidth: 300,
                height: 60,
                onPressed: () {
                  getThings();
                  // nameinput.clear();
                  // priceinput.clear();
                  // descriptioninput.clear();
                  Get.defaultDialog(
                      title: "ِAdd Product",
                      middleText: "Done , wait for your product to be approved",
                      textCancel: "OK");
                },
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Add Product",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          notchMargin: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          HomeScreen(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          SearchPage(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          profile(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}
