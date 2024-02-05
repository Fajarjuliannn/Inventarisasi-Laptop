// To parse this JSON data, do
//
//     final terimaPesanModel = terimaPesanModelFromJson(jsonString);

import 'dart:convert';

TerimaPesanModel terimaPesanModelFromJson(String str) => TerimaPesanModel.fromJson(json.decode(str));

String terimaPesanModelToJson(TerimaPesanModel data) => json.encode(data.toJson());

class TerimaPesanModel {
    final bool success;
    final String message;
    final Data data;

    TerimaPesanModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory TerimaPesanModel.fromJson(Map<String, dynamic> json) => TerimaPesanModel(
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
