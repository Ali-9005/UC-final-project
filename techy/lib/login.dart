import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techy/home.dart';
import 'package:techy/main.dart';
import 'package:techy/mysql.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var db = new Mysql();

  final emailinput = TextEditingController();
  final passwordinput = TextEditingController();

  @override
  void dispose() {
    emailinput.dispose();
    passwordinput.dispose();
    super.dispose();
  }

  void _getThings() async {
    var conn = await db.getConnection();
    final box = await SharedPreferences.getInstance();
    String sql =
        'select password from users where email = \'${emailinput.text}\' and password = \'${passwordinput.text}\';';
    var results = await conn.query(sql);
    if (results.length > 0) {
      Get.to(HomeScreen());
      await box.setBool("isLogin", true);
      await box.setString("email", emailinput.text);
    } else {
      Get.defaultDialog(
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
        //   centerTitle: true,
        // ),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: SvgPicture.asset(
            "assets/images/logo.svg",
            width: 100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Text(
            "Login",
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
        MaterialButton(
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
            "Login",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    ));
  }
}
