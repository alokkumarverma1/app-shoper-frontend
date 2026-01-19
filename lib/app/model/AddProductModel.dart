class AddProductModel {
  final int id;
  final String name;
  final String details;
  final String productImage;
  final int price;
  final int discount;
  final int productCount;
  final String category;
  final String brand;
  final String? createdAt;

  AddProductModel({
    required this.id,
    required this.name,
    required this.details,
    required this.productImage,
    required this.price,
    required this.discount,
    required this.productCount,
    required this.category,
    required this.brand,
     this.createdAt,
  });

  // 🔹 JSON → Model
  factory AddProductModel.fromJson(Map<String, dynamic> json) {
    return AddProductModel(
      id: json["id"],
      name: json["name"] ?? "",
      details: json["details"] ?? "",
      productImage: json["productImage"] ?? "",
      price: int.parse(json["price"].toString()),
      discount: int.parse(json["discount"].toString()),
      productCount: int.parse(json["productCount"].toString()),
      category: json["category"] ?? "",
      brand: json["brand"] ?? "",
      createdAt: (json["createdAt"]),
    );
  }

  // 🔹 Model → JSON
  Map<String, dynamic> getJson() {
    return {
      "id" : id,
      "name": name,
      "details": details,
      "productImage": productImage,
      "price": price,
      "discount": discount,
      "productCount": productCount,
      "category": category,
      "brand": brand,
    };
  }
}
