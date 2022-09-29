import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:techy/additem.dart';
import 'package:techy/details.dart';
import 'package:techy/home.dart';
import 'package:techy/models/products.dart';
import 'package:techy/profile.dart';
import 'package:techy/search.dart';

class PhonesScreen extends StatefulWidget {
  const PhonesScreen({super.key});

  @override
  State<PhonesScreen> createState() => _PhonesScreenState();
}

class _PhonesScreenState extends State<PhonesScreen> {
  @override
  void initState() {
    super.initState();
  }

  var products = [
    Products(
        name: "Apple iPhone 11",
        price: 167,
        description:
            "4GB RAM, 128GB Internal Memory\n6.1 inches Liquid Retina IPS LCD Capacitive Touchscreen, 16M Colors Display\n4G LTE + Wi-Fi + BLuetooth + 3110 mAh battery\niOS, v13.0",
        image: "assets/images/iphone1.png",
        category: "phones"),
    Products(
        name: "Apple iPhone 13 Pro Max",
        price: 370,
        description:
            "6.7-inch Super Retina XDR display with ProMotion for a faster, more responsive feel\nDurable design with Ceramic Shield\n5G for superfast downloads and high-quality streaming",
        image: "assets/images/iphone2.png",
        category: "phones"),
    Products(
        name: "Apple iPhone 13 Pro Max",
        price: 370,
        description:
            "6.7-inch Super Retina XDR display with ProMotion for a faster, more responsive feel\nDurable design with Ceramic Shield\n5G for superfast downloads and high-quality streaming",
        image: "assets/images/iphone2.png",
        category: "phones"),
    Products(
        name: "Apple iPhone 13 Pro Max",
        price: 370,
        description:
            "6.7-inch Super Retina XDR display with ProMotion for a faster, more responsive feel\nDurable design with Ceramic Shield\n5G for superfast downloads and high-quality streaming",
        image: "assets/images/iphone2.png",
        category: "phones"),
  ];

  // If I have time I will see what's the problem here

  // var products = [];

  // var db = new Mysql();

  // void getThings() async {
  //   var conn = await db.getConnection();
  //   String sql =
  //       "SELECT * FROM products WHERE status = 1 AND category = 'laptops';";
  //   var results = await conn.query(sql);
  //   for (var row in results) {
  //     products.add(row);
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 90,
                            child: Container(
                              height: 120,
                              width: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset("${products[index].image}",
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${products[index].name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  child: RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                products: products[index])));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    // fixedSize: Size(110, 10),
                                    backgroundColor: Colors.black,
                                  ),
                                  child: Icon(Icons.arrow_forward),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              );
            })),
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
