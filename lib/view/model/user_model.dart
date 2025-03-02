// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String id;
  final String? studentId;
  final String name;
  final String email;
  final bool isAdmin;
  final String? session;
  final String? year;
  final String? semester;
  // final String mobile;
  // final String bloodGroup;
  // final double latitude;
  // final double longitude;
  // final String address;
  // final String lastDonation;
  final String password;
  final String? profileImageUrl;

  UserModel({
    required this.id,
     this.studentId,
    required this.name,
    required this.email,
      this.isAdmin = false,
     this.session,
     this.year,
     this.semester,
    // required this.mobile,
    // required this.bloodGroup,
    // required this.latitude,
    // required this.longitude,
    // required this.address,
    // required this.lastDonation,
    required this.password,
    required this.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    studentId: json["studentId"],
    name: json["name"],
    email: json["email"],
    isAdmin: json["isAdmin"],
    session: json["session"],
    year: json["year"],
    semester: json["semester"],
    // mobile: json["mobile"],
    // bloodGroup: json["bloodGroup"],
    // latitude: json["latitude"],
    // longitude: json["longitude"],
    // address: json["address"],
    // lastDonation: json["lastDonation"],
    password: json["password"],
    profileImageUrl: json["profileImageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "studentId": studentId,
    "name": name,
    "email": email,
    "session": session,
    "year": year,
    "isAdmin": isAdmin,
    "semester": semester,
    // "mobile": mobile,
    // "bloodGroup": bloodGroup,
    // "latitude": latitude,
    // "longitude": longitude,
    // "address": address,
    // "lastDonation": lastDonation,
    "password": password,
    "profileImageUrl": profileImageUrl,
  };
}
