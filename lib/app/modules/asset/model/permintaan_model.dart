// To parse this JSON data, do
//
//     final permintaanModel = permintaanModelFromJson(jsonString);

import 'dart:convert';

PermintaanModel permintaanModelFromJson(String str) => PermintaanModel.fromJson(json.decode(str));

String permintaanModelToJson(PermintaanModel data) => json.encode(data.toJson());

class PermintaanModel {
    final bool success;
    final String message;
    final PermintaanModelData data;

    PermintaanModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory PermintaanModel.fromJson(Map<String, dynamic> json) => PermintaanModel(
        success: json["success"],
        message: json["message"],
        data: PermintaanModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class PermintaanModelData {
    final DataData data;

    PermintaanModelData({
        required this.data,
    });

    factory PermintaanModelData.fromJson(Map<String, dynamic> json) => PermintaanModelData(
        data: DataData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class DataData {
    final int idUser;
    final String idLaptop;
    final String status;
    final DateTime updatedAt;
    final DateTime createdAt;
    final int id;

    DataData({
        required this.idUser,
        required this.idLaptop,
        required this.status,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        idUser: json["id_user"],
        idLaptop: json["id_laptop"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "id_laptop": idLaptop,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
