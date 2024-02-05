// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    final bool success;
    final String message;
    final List<UserDatum> data;

    UserModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        message: json["message"],
        data: List<UserDatum>.from(json["data"].map((x) => UserDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class UserDatum {
    final int id;
    final String noPegawai;
    final String name;
    final String email;
    final dynamic emailVerifiedAt;
    final String role;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    UserDatum({
        required this.id,
        required this.noPegawai,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.role,
        required this.createdAt,
        required this.updatedAt,
    });

    factory UserDatum.fromJson(Map<String, dynamic> json) => UserDatum(
        id: json["id"],
        noPegawai: json["no_pegawai"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        role: json["role"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "no_pegawai": noPegawai,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
