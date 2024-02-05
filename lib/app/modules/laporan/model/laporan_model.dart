// To parse this JSON data, do
//
//     final laporanModel = laporanModelFromJson(jsonString);

import 'dart:convert';

LaporanModel laporanModelFromJson(String str) => LaporanModel.fromJson(json.decode(str));

String laporanModelToJson(LaporanModel data) => json.encode(data.toJson());

class LaporanModel {
    final bool success;
    final String message;
    final Data data;

    LaporanModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory LaporanModel.fromJson(Map<String, dynamic> json) => LaporanModel(
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
    final int id;
    final String status;
    final String isi;
    final User user;

    Data({
        required this.id,
        required this.status,
        required this.isi,
        required this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        status: json["status"],
        isi: json["isi"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "isi": isi,
        "user": user.toJson(),
    };
}

class User {
    final int id;
    final String name;
    final String email;

    User({
        required this.id,
        required this.name,
        required this.email,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
    };
}
