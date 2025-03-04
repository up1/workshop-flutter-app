class Products {
  final String name;
  final String image;

  Products({required this.name, required this.image});

  Map<String, dynamic> toJson() => {"name": name, "image": image};
}
