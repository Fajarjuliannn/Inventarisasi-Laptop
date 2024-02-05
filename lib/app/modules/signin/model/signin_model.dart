// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    final bool success;
    final String message;
    final Data? data;

    LoginModel({
        required this.success,
        required this.message,
        this.data,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    final int id;
    final String noPegawai;
    final String name;
    final String email;
    final dynamic emailVerifiedAt;
    final String role;
    final dynamic createdAt;
    final dynamic updatedAt;
    late final String token;

    Data({
        required this.id,
        required this.noPegawai,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.role,
        required this.createdAt,
        required this.updatedAt,
        required this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        noPegawai: json["no_pegawai"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        role: json["role"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "no_pegawai": noPegawai,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "token": token,
    };
}
