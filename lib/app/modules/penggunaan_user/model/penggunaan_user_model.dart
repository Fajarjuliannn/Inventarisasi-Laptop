// To parse this JSON data, do
//
//     final penggunaanUserModel = penggunaanUserModelFromJson(jsonString);

import 'dart:convert';

PenggunaanUserModel penggunaanUserModelFromJson(String str) => PenggunaanUserModel.fromJson(json.decode(str));

String penggunaanUserModelToJson(PenggunaanUserModel data) => json.encode(data.toJson());

class PenggunaanUserModel {
    final bool success;
    final String message;
    final List<PenggunaanUserDatum> data;

    PenggunaanUserModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory PenggunaanUserModel.fromJson(Map<String, dynamic> json) => PenggunaanUserModel(
        success: json["success"],
        message: json["message"],
        data: List<PenggunaanUserDatum>.from(json["data"].map((x) => PenggunaanUserDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PenggunaanUserDatum {
    final int id;
    final String status;
    final DateTime createdAt;
    final User user;
    final Laptop laptop;

    PenggunaanUserDatum({
        required this.id,
        required this.status,
        required this.createdAt,
        required this.user,
        required this.laptop,
    });

    factory PenggunaanUserDatum.fromJson(Map<String, dynamic> json) => PenggunaanUserDatum(
        id: json["id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        user: User.fromJson(json["user"]),
        laptop: Laptop.fromJson(json["laptop"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "user": user.toJson(),
        "laptop": laptop.toJson(),
    };
}

class Laptop {
    final int id;
    final String merk;
    final String ram;
    final String prosesor;
    final String harddisk;
    final String status;

    Laptop({
        required this.id,
        required this.merk,
        required this.ram,
        required this.prosesor,
        required this.harddisk,
        required this.status,
    });

    factory Laptop.fromJson(Map<String, dynamic> json) => Laptop(
        id: json["id"],
        merk: json["merk"],
        ram: json["ram"],
        prosesor: json["prosesor"],
        harddisk: json["harddisk"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "merk": merk,
        "ram": ram,
        "prosesor": prosesor,
        "harddisk": harddisk,
        "status": status,
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
