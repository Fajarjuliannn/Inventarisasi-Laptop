// To parse this JSON data, do
//
//     final kembalikanModel = kembalikanModelFromJson(jsonString);

import 'dart:convert';

KembalikanModel kembalikanModelFromJson(String str) => KembalikanModel.fromJson(json.decode(str));

String kembalikanModelToJson(KembalikanModel data) => json.encode(data.toJson());

class KembalikanModel {
    final bool success;
    final String message;
    final Data data;

    KembalikanModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory KembalikanModel.fromJson(Map<String, dynamic> json) => KembalikanModel(
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
    final Penggunaan penggunaan;
    final Laptop laptop;

    Data({
        required this.penggunaan,
        required this.laptop,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        penggunaan: Penggunaan.fromJson(json["penggunaan"]),
        laptop: Laptop.fromJson(json["laptop"]),
    );

    Map<String, dynamic> toJson() => {
        "penggunaan": penggunaan.toJson(),
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
    final DateTime createdAt;
    final DateTime updatedAt;

    Laptop({
        required this.id,
        required this.merk,
        required this.ram,
        required this.prosesor,
        required this.harddisk,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Laptop.fromJson(Map<String, dynamic> json) => Laptop(
        id: json["id"],
        merk: json["merk"],
        ram: json["ram"],
        prosesor: json["prosesor"],
        harddisk: json["harddisk"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "merk": merk,
        "ram": ram,
        "prosesor": prosesor,
        "harddisk": harddisk,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Penggunaan {
    final int id;
    final int idUser;
    final int idLaptop;
    final String status;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Laptop laptop;

    Penggunaan({
        required this.id,
        required this.idUser,
        required this.idLaptop,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.laptop,
    });

    factory Penggunaan.fromJson(Map<String, dynamic> json) => Penggunaan(
        id: json["id"],
        idUser: json["id_user"],
        idLaptop: json["id_laptop"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        laptop: Laptop.fromJson(json["laptop"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "id_laptop": idLaptop,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "laptop": laptop.toJson(),
    };
}
