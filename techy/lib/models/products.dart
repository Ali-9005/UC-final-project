class Products {
  final String name;
  final int price;
  final String description;
  final String image;
  final String category;

  Products(
      {required this.name,
      required this.price,
      required this.description,
      required this.image, required this.category});

  // factory Products.fromJson(Map<String, dynamic> json) {
  //   return Products(
  //     name: json['name'] as String,
  //     price: json['price'] as int,
  //     description: json['description'] as String,
  //     image: json['image'] as String,
  //   );
  // }

}
