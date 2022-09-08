import 'dart:convert';

RefreshTokenModel refreshTokenModelFromJson(String str) =>
    RefreshTokenModel.fromJson(json.decode(str));
String refreshTokenModelToJson(RefreshTokenModel data) =>
    json.encode(data.toJson());

class RefreshTokenModel {
  RefreshTokenModel({
    this.success,
    this.token,
    this.tokenType,
    this.expiresIn,
  });

  RefreshTokenModel.fromJson(dynamic json) {
    success = json['success'];
    token = json['token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }
  bool? success;
  String? token;
  String? tokenType;
  double? expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['token'] = token;
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    return map;
  }
}
