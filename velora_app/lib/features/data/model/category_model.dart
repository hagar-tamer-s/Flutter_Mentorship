class CategoryModel {
  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;

  CategoryModel({
    required this.name,
    required this.description,
    required this.coverPictureUrl,
    required this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json["name"],
      description: json["description"],
      coverPictureUrl: json["coverPictureUrl"] ?? "no picture found",
      id: json["id"],
    );
  }
}
