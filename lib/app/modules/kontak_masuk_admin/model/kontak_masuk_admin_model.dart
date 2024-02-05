// To parse this JSON data, do
//
//     final allLaporanModel = allLaporanModelFromJson(jsonString);

import 'dart:convert';

AllLaporanModel allLaporanModelFromJson(String str) => AllLaporanModel.fromJson(json.decode(str));

String allLaporanModelToJson(AllLaporanModel data) => json.encode(data.toJson());

class AllLaporanModel {
    final bool success;
    final String message;
    final List<AllLaporanDatum> data;

    AllLaporanModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory AllLaporanModel.fromJson(Map<String, dynamic> json) => AllLaporanModel(
        success: json["success"],
        message: json["message"],
        data: List<AllLaporanDatum>.from(json["data"].map((x) => AllLaporanDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class AllLaporanDatum {
    final int id;
    final String status;
    final String isi;
    final String jenisLaporan;
    final DateTime createdAt;
    final User user;

    AllLaporanDatum({
        required this.id,
        required this.status,
        required this.isi,
        required this.jenisLaporan,
        required this.createdAt,
        required this.user,
    });

    factory AllLaporanDatum.fromJson(Map<String, dynamic> json) => AllLaporanDatum(
        id: json["id"],
        status: json["status"],
        isi: json["isi"],
        jenisLaporan: json["jenis_laporan"],
        createdAt: DateTime.parse(json["created_at"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "isi": isi,
        "jenis_laporan": jenisLaporan,
        "created_at": createdAt.toIso8601String(),
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
