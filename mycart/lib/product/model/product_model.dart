class Product {
  final String name;
  final String image;

  Product({required this.name, required this.image});

  Map<String, dynamic> toJson() => {"name": name, "image": image};

  static Product fromJson(Map<String, dynamic> json) {
    return Product(name: json['name'], image: json['image']);
  }
}
