// To parse this JSON data, do
//
//     final requestModel = requestModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syllabus_pedia/view/model/user_model.dart';

FeedbackModel feedbackModelFromJson(String str) => FeedbackModel.fromJson(json.decode(str));

String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

class FeedbackModel {
  final String userId;
  final String studentId;
  final String feedbackText;
  final Timestamp timestamp;
  // final UserModel userInfo;

  FeedbackModel({
    required this.userId,
    required this.studentId,
    required this.feedbackText,
    required this.timestamp,
    // required this.userInfo,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
    userId: json["userId"],
    studentId: json["studentId"],
    feedbackText: json["feedbackText"],
    timestamp: json["timeStamp"],
    // userInfo: UserModel.fromJson(json["userInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "studentId": studentId,
    "feedbackText": feedbackText,
    "timeStamp": timestamp,
    // "userInfo": userInfo.toJson(),
  };
}

// class UserInfo {
//   final String id;
//   final String name;
//   final String email;
//   final String mobile;
//   final String bloodGroup;
//   final String latitude;
//   final String longitude;
//   final String address;
//   final String lastDonation;
//   final String password;
//   final String profileImageUrl;
//
//   UserInfo({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.mobile,
//     required this.bloodGroup,
//     required this.latitude,
//     required this.longitude,
//     required this.address,
//     required this.lastDonation,
//     required this.password,
//     required this.profileImageUrl,
//   });
//
//   factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
//     id: json["id"],
//     name: json["name"],
//     email: json["email"],
//     mobile: json["mobile"],
//     bloodGroup: json["bloodGroup"],
//     latitude: json["latitude"],
//     longitude: json["longitude"],
//     address: json["address"],
//     lastDonation: json["lastDonation"],
//     password: json["password"],
//     profileImageUrl: json["profileImageUrl"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "email": email,
//     "mobile": mobile,
//     "bloodGroup": bloodGroup,
//     "latitude": latitude,
//     "longitude": longitude,
//     "address": address,
//     "lastDonation": lastDonation,
//     "password": password,
//     "profileImageUrl": profileImageUrl,
//   };
// }
