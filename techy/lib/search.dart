import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:techy/additem.dart';
import 'package:techy/details.dart';
import 'package:techy/home.dart';
import 'package:techy/main.dart';
import 'package:techy/models/list.dart';
import 'package:techy/models/products.dart';
import 'package:techy/profile.dart';
import 'package:techy/widgets/rowsearchwidget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  _SearchPageState();

  static List<Products> searchList = [
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
        name: "Lenovo Flex 5",
        price: 285,
        description:
            "Display: 14 inch FHD 1920*1080 Glossy Touch\nCHIPEST CPU: Intel i7 1165G7 4.7 Ghz\nStorage: RAM: 16GB DDR4 & SSD: 512GB\nOS: Windows 11 Home\nGraphics Details: Nvidia Geforce MX450 2GB GDDR6",
        image: "assets/images/laptop1.png",
        category: "laptops"),
    Products(
        name: "Apple Mackbook 2021",
        price: 800,
        description:
            "Up to 32-core GPU with up to 4x faster performance for graphics-intensive apps and games\n16-core Neural Engine for 5x faster machine learning performance",
        image: "assets/images/laptop2.png",
        category: "laptops"),
    Products(
        name: "HP Pavilion 15",
        price: 300,
        description:
            "Display: 15.6 FHD\nProcessor: Ryzen 7 5th Gen\nRAM: 16GB\nStorage: 1TB + 256 SSD\nOS : Windows 11 home\nGRAPHIC DETAILS: GTX 1650 4GB",
        image: "assets/images/laptop3.png",
        category: "laptops"),
    Products(
        name: "Huawei MateBook D 16",
        price: 350,
        description:
            "Processor: 12th Gen Intel Core i7-12700H\nRAM 16GB\nStorage: 512GB SSD\nOS: Windows 11",
        image: "assets/images/laptop4.png",
        category: "laptops"),
  ];

  List<Products> displayList = List.from(searchList);

  void updateList(String value) {
    setState(() {
      displayList = searchList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF1f545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a product",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.00,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  hintText: "eg: anything",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.black),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: displayList.length == 0
                  ? Center(
                      child: Text(
                        "No results found",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayList.length,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          products: searchList[index])));
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.all(8.0),
                              title: Text(
                                displayList[index].name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                "${displayList[index].price} KD",
                                style: TextStyle(color: Colors.black),
                              ),
                              leading: Image.asset(displayList[index].image),
                            ),
                          )),
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
                  color: Colors.blue,
                ),
                onPressed: () {},
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
