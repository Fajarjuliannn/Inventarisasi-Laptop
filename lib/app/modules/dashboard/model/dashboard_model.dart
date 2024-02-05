// To parse this JSON data, do
//
//     final countModel = countModelFromJson(jsonString);

import 'dart:convert';

CountModel countModelFromJson(String str) => CountModel.fromJson(json.decode(str));

String countModelToJson(CountModel data) => json.encode(data.toJson());

class CountModel {
    final bool success;
    final String message;
    final Data data;

    CountModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory CountModel.fromJson(Map<String, dynamic> json) => CountModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    final int usersCount;
    final int assetsCount;
    final int permintaansCount;
    final int penggunaansCount;

    Data({
        required this.usersCount,
        required this.assetsCount,
        required this.permintaansCount,
        required this.penggunaansCount,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        usersCount: json["users_count"],
        assetsCount: json["assets_count"],
        permintaansCount: json["permintaans_count"],
        penggunaansCount: json["penggunaans_count"],
    );

    Map<String, dynamic> toJson() => {
        "users_count": usersCount,
        "assets_count": assetsCount,
        "permintaans_count": permintaansCount,
        "penggunaans_count": penggunaansCount,
    };
}
