// To parse this JSON data, do
//
//     final addingModel = addingModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddingModel addingModelFromJson(String str) =>
    AddingModel.fromJson(json.decode(str));

String addingModelToJson(AddingModel data) => json.encode(data.toJson());

class AddingModel {
  AddingModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  String name;
  String email;
  String phone;
  String address;

  factory AddingModel.fromJson(Map<String, dynamic> json) => AddingModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
      };
}
