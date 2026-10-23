class ProductModel {
  final String id;
  final num price;
  final String name;
  final String description;
  final String coverPictureUrl;

  ProductModel({
    required this.price,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
    required this.id,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      price: json["price"],
      name: json["name"],
      description: json["description"],
      coverPictureUrl: json["coverPictureUrl"] ?? "no picture found",
      id: json["id"],
    );
  }
}
