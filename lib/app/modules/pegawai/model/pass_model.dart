// To parse this JSON data, do
//
//     final passwordModel = passwordModelFromJson(jsonString);

import 'dart:convert';

PasswordModel passwordModelFromJson(String str) => PasswordModel.fromJson(json.decode(str));

String passwordModelToJson(PasswordModel data) => json.encode(data.toJson());

class PasswordModel {
    final bool success;
    final String message;
    final Data data;

    PasswordModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory PasswordModel.fromJson(Map<String, dynamic> json) => PasswordModel(
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
    final String noPegawai;
    final String name;
    final String email;
    final dynamic emailVerifiedAt;
    final String role;
    final DateTime createdAt;
    final DateTime updatedAt;

    Data({
        required this.id,
        required this.noPegawai,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.role,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        noPegawai: json["no_pegawai"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "no_pegawai": noPegawai,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
