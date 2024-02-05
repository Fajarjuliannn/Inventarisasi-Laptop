// To parse this JSON data, do
//
//     final penggunaanModel = penggunaanModelFromJson(jsonString);

import 'dart:convert';

PenggunaanModel penggunaanModelFromJson(String str) => PenggunaanModel.fromJson(json.decode(str));

String penggunaanModelToJson(PenggunaanModel data) => json.encode(data.toJson());

class PenggunaanModel {
    final bool success;
    final String message;
    final List<PenggunaanDatum> data;

    PenggunaanModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory PenggunaanModel.fromJson(Map<String, dynamic> json) => PenggunaanModel(
        success: json["success"],
        message: json["message"],
        data: List<PenggunaanDatum>.from(json["data"].map((x) => PenggunaanDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PenggunaanDatum {
    final int id;
    final String status;
    final User user;
    final Laptop laptop;

    PenggunaanDatum({
        required this.id,
        required this.status,
        required this.user,
        required this.laptop,
    });

    factory PenggunaanDatum.fromJson(Map<String, dynamic> json) => PenggunaanDatum(
        id: json["id"],
        status: json["status"],
        user: User.fromJson(json["user"]),
        laptop: Laptop.fromJson(json["laptop"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
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
