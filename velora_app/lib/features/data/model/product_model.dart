class ProductModel {
  final String id;
  final num price, rating, reviewsCount;
  final int? stock;
  final String name;
  final String color;
  final String description;
  final String coverPictureUrl;

  ProductModel({
    required this.price,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
    required this.id,
    this.stock,
    required this.color,
    required this.rating,
    required this.reviewsCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      price: json["price"],
      name: json["name"],
      description: json["description"],
      coverPictureUrl: json["coverPictureUrl"] ?? "no picture found",
      id: json["id"],
      stock: json["stock"] ?? 0,
      color: json["color"],
      rating: json["rating"],
      reviewsCount: json["reviewsCount"],
    );
  }
}
