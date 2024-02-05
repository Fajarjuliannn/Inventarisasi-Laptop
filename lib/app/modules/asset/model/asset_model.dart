// To parse this JSON data, do
//
//     final laptopModel = laptopModelFromJson(jsonString);

import 'dart:convert';

LaptopModel laptopModelFromJson(String str) => LaptopModel.fromJson(json.decode(str));

String laptopModelToJson(LaptopModel data) => json.encode(data.toJson());


class LaptopModel {
  final bool success;
  final String message;
  final List<Datum> data;

  LaptopModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LaptopModel.fromJson(Map<String, dynamic> json) {
    return LaptopModel(
      success: json["success"],
      message: json["message"],
      data: (json["data"] as List).map((item) => Datum.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "message": message,
      "data": data.map((item) => item.toJson()).toList(),
    };
  }
}


class Datum {
    final int id;
    final String merk;
    final String ram;
    final String prosesor;
    final String harddisk;
    final String status;

    Datum({
        required this.id,
        required this.merk,
        required this.ram,
        required this.prosesor,
        required this.harddisk,
        required this.status,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        merk: json["merk"],
        ram: json["ram"],
        prosesor: json["prosesor"],
        harddisk: json["harddisk"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "merk": merk,
        "ram": ram,
        "prosesor": prosesor,
        "harddisk": harddisk,
        "status": status,
    };
}