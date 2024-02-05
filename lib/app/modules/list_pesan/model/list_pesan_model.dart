// To parse this JSON data, do
//
//     final listPesanModel = listPesanModelFromJson(jsonString);

import 'dart:convert';

ListPesanModel listPesanModelFromJson(String str) => ListPesanModel.fromJson(json.decode(str));

String listPesanModelToJson(ListPesanModel data) => json.encode(data.toJson());

class ListPesanModel {
    final bool success;
    final String message;
    final List<ListPesanDatum> data;

    ListPesanModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ListPesanModel.fromJson(Map<String, dynamic> json) => ListPesanModel(
        success: json["success"],
        message: json["message"],
        data: List<ListPesanDatum>.from(json["data"].map((x) => ListPesanDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ListPesanDatum {
    final int id;
    final ReceiverId receiverId;
    final String content;
    final String status;
    final DateTime createdAt;

    ListPesanDatum({
        required this.id,
        required this.receiverId,
        required this.content,
        required this.status,
        required this.createdAt,
    });

    factory ListPesanDatum.fromJson(Map<String, dynamic> json) => ListPesanDatum(
        id: json["id"],
        receiverId: ReceiverId.fromJson(json["receiver_id"]),
        content: json["content"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "receiver_id": receiverId.toJson(),
        "content": content,
        "status": status,
        "created_at": createdAt.toIso8601String(),
    };
}

class ReceiverId {
    final int id;
    final String name;
    final String email;

    ReceiverId({
        required this.id,
        required this.name,
        required this.email,
    });

    factory ReceiverId.fromJson(Map<String, dynamic> json) => ReceiverId(
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
