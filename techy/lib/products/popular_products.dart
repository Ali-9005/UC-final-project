import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:techy/constants.dart';
import 'package:techy/mysql.dart';

class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  void initState() {
    super.initState();
    getThings();
  }

  var products = [];

  var db = new Mysql();

  void getThings() async {
    var conn = await db.getConnection();
    String sql = "SELECT * FROM products WHERE status = 1";
    var results = await conn.query(sql);
    for (var row in results) {
      products.add(row);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.70),
        itemBuilder: (BuildContext context, int index) {
          Uint8List image = Base64Decoder().convert(products[index]["image"]
              .toString()
              .replaceAll(new RegExp(r'data:image/(.*);base64,'), ""));
          return Container(
            child: PopularSingleProducts(
              popular_single_prod_description: "Hello",
              popular_single_prod_name: products[index]["name"],
              popular_single_prod_image: image,
              popular_single_prod_price: products[index]["price"],
            ),
          );
        });
  }
}

class PopularSingleProducts extends StatefulWidget {
  final popular_single_prod_name;
  final popular_single_prod_price;
  final popular_single_prod_image;
  final popular_single_prod_description;

  PopularSingleProducts(
      {this.popular_single_prod_name,
      this.popular_single_prod_image,
      this.popular_single_prod_price,
      this.popular_single_prod_description});

  @override
  State<PopularSingleProducts> createState() => _PopularSingleProductsState();
}

class _PopularSingleProductsState extends State<PopularSingleProducts> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Column(
      children: [
        Container(
          height: 180,
          width: 160,
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(30)),
          child: InkWell(
            onTap: () {},
            child: Image.memory(
              widget.popular_single_prod_image,
            ),
          ),
        ),
        ListTile(
          title: Text(
            widget.popular_single_prod_name,
          ),
          subtitle: Text("\$${widget.popular_single_prod_price}"),
        ),
      ],
    );
  }
}
