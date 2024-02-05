// To parse this JSON data, do
//
//     final kirimPesanModel = kirimPesanModelFromJson(jsonString);

import 'dart:convert';

KirimPesanModel kirimPesanModelFromJson(String str) => KirimPesanModel.fromJson(json.decode(str));

String kirimPesanModelToJson(KirimPesanModel data) => json.encode(data.toJson());

class KirimPesanModel {
    final bool success;
    final String message;
    final Data data;

    KirimPesanModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory KirimPesanModel.fromJson(Map<String, dynamic> json) => KirimPesanModel(
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
    final int receiverId;
    final String content;
    final String status;
    final DateTime createdAt;

    Data({
        required this.id,
        required this.receiverId,
        required this.content,
        required this.status,
        required this.createdAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        receiverId: json["receiver_id"],
        content: json["content"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "receiver_id": receiverId,
        "content": content,
        "status": status,
        "created_at": createdAt.toIso8601String(),
    };
}
