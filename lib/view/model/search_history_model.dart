// To parse this JSON data, do
//
//     final requestModel = requestModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

SearchHistoryModel searchHistoryModelFromJson(String str) => SearchHistoryModel.fromJson(json.decode(str));

String searchHistoryModelToJson(SearchHistoryModel data) => json.encode(data.toJson());

class SearchHistoryModel {
  // final String userId;
  final String studentId;
  final String historyText;
  final Timestamp timestamp;
  // final UserModel userInfo;

  SearchHistoryModel({
    // required this.userId,
    required this.studentId,
    required this.historyText,
    required this.timestamp,
    // required this.userInfo,
  });

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) => SearchHistoryModel(
    // userId: json["userId"],
    studentId: json["studentId"],
    historyText: json["historyText"],
    timestamp: json["timeStamp"],
    // userInfo: UserModel.fromJson(json["userInfo"]),
  );

  Map<String, dynamic> toJson() => {
    // "userId": userId,
    "studentId": studentId,
    "historyText": historyText,
    "timeStamp": timestamp,
    // "userInfo": userInfo.toJson(),
  };
}

