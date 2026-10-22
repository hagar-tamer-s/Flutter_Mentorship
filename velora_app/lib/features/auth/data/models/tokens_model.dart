class TokensModel {
  final String accessToken;
  final String expiresAtUtc;
  final String refreshToken;

  TokensModel({
    required this.accessToken,
    required this.expiresAtUtc,
    required this.refreshToken,
  });

  factory TokensModel.fromJson(Map<String, dynamic> json) {
    return TokensModel(
      accessToken: json["accessToken"]!,
      expiresAtUtc: json["expiresAtUtc"]!,
      refreshToken: json["refreshToken"]!,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "accessToken": accessToken,
      "expiresAtUtc": expiresAtUtc,
      "refreshToken": refreshToken,
    };
  }
}
