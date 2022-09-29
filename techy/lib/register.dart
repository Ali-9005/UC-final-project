import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techy/home.dart';
import 'package:techy/main.dart';
import 'package:techy/mysql.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  var db = new Mysql();

  final emailinput = TextEditingController();
  final passwordinput = TextEditingController();
  final confirmpasswordinput = TextEditingController();
  final nameinput = TextEditingController();
  final phoneinput = TextEditingController();

  @override
  void dispose() {
    emailinput.dispose();
    passwordinput.dispose();
    nameinput.dispose();
    phoneinput.dispose();
    confirmpasswordinput.dispose();
    super.dispose();
  }

  void _getThings() async {
    var conn = await db.getConnection();
    final box = await SharedPreferences.getInstance();
    String sql =
        'insert into  users (name, email, phone_number, password) VALUES (\'${nameinput.text}\', \'${emailinput.text}\', \'${phoneinput.text}\', \'${passwordinput.text}\');';
    if (nameinput.text.length > 0 &&
        emailinput.text.length > 0 &&
        phoneinput.text.length > 0 &&
        passwordinput.text.length > 0 &&
        confirmpasswordinput.text.length > 0 &&
        passwordinput.text == confirmpasswordinput.text) {
      var results = await conn.query(sql);
      Get.to(HomeScreen());
    } else {
      passwordinput.text != confirmpasswordinput.text
          ? Get.defaultDialog(
              title: "Error",
              middleText: "Passwords are not match.",
              textCancel: "OK")
          : Get.defaultDialog(
              title: "Error",
              middleText: "Something wrong please check again.",
              textCancel: "OK");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Techy"),
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
              "Register",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: emailinput,
                cursorHeight: 20,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  prefixIcon: Icon(Icons.mail),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: nameinput,
                cursorHeight: 20,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Enter your Name",
                  prefixIcon: Icon(Icons.person),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: passwordinput,
                obscureText: true,
                cursorHeight: 20,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  prefixIcon: Icon(Icons.lock),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: confirmpasswordinput,
                obscureText: true,
                cursorHeight: 20,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Confirm your password",
                  prefixIcon: Icon(Icons.lock),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: phoneinput,
                cursorHeight: 20,
                autofocus: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter your phone number",
                  prefixIcon: Icon(Icons.phone),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
            padding: const EdgeInsets.only(bottom: 60),
            child: MaterialButton(
              minWidth: 300,
              height: 60,
              onPressed: () {
                _getThings();
              },
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "Register",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
