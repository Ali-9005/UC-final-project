import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techy/category/laptops_category.dart';
import 'package:techy/category/others_category.dart';
import 'package:techy/category/phones_category.dart';
import 'package:techy/constants.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 5,
          ),
          CategoryProduct(
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LaptopsScreen()));
            },
            image: "assets/images/logo.svg",
            text: "Laptops",
          ),
          SizedBox(
            width: 20,
          ),
          CategoryProduct(
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PhonesScreen()));
            },
            image: "assets/images/phone.svg",
            text: "Phones",
          ),
          SizedBox(
            width: 20,
          ),
          CategoryProduct(
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OthersScreen()));
            },
            image: "https://blockshost.com/logo.png",
            text: "Others",
          ),
        ],
      ),
    );
  }
}

class CategoryProduct extends StatelessWidget {
  const CategoryProduct(
      {Key? key, required this.image, required this.text, required this.press})
      : super(key: key);

  final String image, text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: press,
        child: Container(
          child: Chip(
            backgroundColor: kButtonColor,
            label: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(color: kTextColor),
                ),
                SizedBox(
                  width: 20,
                ),
                SvgPicture.asset(
                  image,
                  color: Colors.black,
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
