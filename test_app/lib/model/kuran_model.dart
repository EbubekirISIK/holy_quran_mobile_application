// To parse this JSON data, do
//
//     final kuranModel = kuranModelFromJson(jsonString);

import 'dart:convert';

KuranModel kuranModelFromJson(String str) => KuranModel.fromJson(json.decode(str));

String kuranModelToJson(KuranModel data) => json.encode(data.toJson());

class KuranModel {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;

  KuranModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
  });
@override
  String toString() {
    // TODO: implement toString
    return englishName!;
  }
  factory KuranModel.fromJson(Map<String, dynamic> json) => KuranModel(
    number: json["number"],
    name: json["name"],
    englishName: json["englishName"],
    englishNameTranslation: json["englishNameTranslation"],
    numberOfAyahs: json["numberOfAyahs"],
    revelationType: json["revelationType"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
    "englishName": englishName,
    "englishNameTranslation": englishNameTranslation,
    "numberOfAyahs": numberOfAyahs,
    "revelationType": revelationType,
  };
}
