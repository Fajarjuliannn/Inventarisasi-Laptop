// To parse this JSON data, do
//
//     final responAdminModel = responAdminModelFromJson(jsonString);

import 'dart:convert';

ResponAdminModel responAdminModelFromJson(String str) => ResponAdminModel.fromJson(json.decode(str));

String responAdminModelToJson(ResponAdminModel data) => json.encode(data.toJson());

class ResponAdminModel {
    final bool success;
    final String message;
    final Data data;

    ResponAdminModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ResponAdminModel.fromJson(Map<String, dynamic> json) => ResponAdminModel(
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
    final User user;
    final Laptop laptop;

    Data({
        required this.user,
        required this.laptop,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        laptop: Laptop.fromJson(json["laptop"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
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

class User {
    final int id;
    final String noPegawai;
    final String name;
    final String email;
    final dynamic emailVerifiedAt;
    final String role;
    final DateTime createdAt;
    final DateTime updatedAt;

    User({
        required this.id,
        required this.noPegawai,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.role,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
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
