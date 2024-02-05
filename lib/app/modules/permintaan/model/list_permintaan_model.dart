// To parse this JSON data, do
//
//     final permintaanListModel = permintaanListModelFromJson(jsonString);

import 'dart:convert';

PermintaanListModel permintaanListModelFromJson(String str) => PermintaanListModel.fromJson(json.decode(str));

String permintaanListModelToJson(PermintaanListModel data) => json.encode(data.toJson());

class PermintaanListModel {
    final bool success;
    final String message;
    final List<PermintaanListDatum> data;

    PermintaanListModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory PermintaanListModel.fromJson(Map<String, dynamic> json) => PermintaanListModel(
        success: json["success"],
        message: json["message"],
        data: List<PermintaanListDatum>.from(json["data"].map((x) => PermintaanListDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PermintaanListDatum {
    final int id;
    String status;
    final User user;
    final Laptop laptop;

    PermintaanListDatum({
        required this.id,
        required this.status,
        required this.user,
        required this.laptop,
    });

    factory PermintaanListDatum.fromJson(Map<String, dynamic> json) => PermintaanListDatum(
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
