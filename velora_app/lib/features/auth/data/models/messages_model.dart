class MessagesModel {
  final String message;

  MessagesModel({required this.message});

  factory MessagesModel.fromJson(Map<String, dynamic> json) {
    return MessagesModel(message: json["message"]);
  }

  Map<String, dynamic> toJson() {
    return {"message": message};
  }
}
