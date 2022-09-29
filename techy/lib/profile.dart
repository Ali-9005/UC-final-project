import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/profile.dart';
import 'package:techy/additem.dart';
import 'package:techy/home.dart';
import 'package:techy/main.dart';
import 'package:techy/search.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: Text(
            "Coming Soon",
            style: TextStyle(fontSize: 30),
          )),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Profile"),
        backgroundColor: Colors.transparent,
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
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          addItemScreen(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
