// To parse this JSON data, do
//
//     final pesanUserModel = pesanUserModelFromJson(jsonString);

import 'dart:convert';

PesanUserModel pesanUserModelFromJson(String str) => PesanUserModel.fromJson(json.decode(str));

String pesanUserModelToJson(PesanUserModel data) => json.encode(data.toJson());

class PesanUserModel {
    final bool success;
    final String message;
    final List<PesanUserDatum> data;

    PesanUserModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory PesanUserModel.fromJson(Map<String, dynamic> json) => PesanUserModel(
        success: json["success"],
        message: json["message"],
        data: List<PesanUserDatum>.from(json["data"].map((x) => PesanUserDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PesanUserDatum {
    final int id;
    final int receiverId;
    final String content;
    final String status;
    final DateTime createdAt;

    PesanUserDatum({
        required this.id,
        required this.receiverId,
        required this.content,
        required this.status,
        required this.createdAt,
    });

    factory PesanUserDatum.fromJson(Map<String, dynamic> json) => PesanUserDatum(
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
