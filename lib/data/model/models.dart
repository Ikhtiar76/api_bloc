class ProductModel {
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  ProductModel(
      {this.title, this.price, this.description, this.category, this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json["title"] ?? "",
      price: json["price"] == null ? 0.0 : json["price"].toDouble(),
      description: json["description"] ?? "",
      category: json["category"] ?? "",
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
    };
  }

//
}
