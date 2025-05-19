// To parse this JSON data, do
//
//     final requestModel = requestModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syllabus_pedia/view/model/user_model.dart';

ActivityModel feedbackModelFromJson(String str) =>
    ActivityModel.fromJson(json.decode(str));

String feedbackModelToJson(ActivityModel data) => json.encode(data.toJson());

class ActivityModel {
  final String adminId;
  final String adminName;
  final String adminEmail;
  final String activityName;
  final String activityId;
  final String semesterName;
  final String courseName;
  final String topic;
  final Timestamp timestamp;

  ActivityModel(
      {required this.adminId,
      required this.activityId,
      required this.activityName,
      required this.adminName,
      required this.adminEmail,
      required this.semesterName,
      required this.courseName,
      required this.topic,
      required this.timestamp});

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        adminId: json["adminId"],
        activityId: json["activityId"],
        activityName: json["activityName"],
        adminName: json["adminName"],
        adminEmail: json["adminEmail"],
        semesterName: json["semesterName"],
        courseName: json["courseName"],
        topic: json["topic"],
        timestamp: json["timeStamp"],
      );

  Map<String, dynamic> toJson() => {
        "adminId": adminId,
        "activityId": activityId,
        "activityName": activityName,
        "adminName": adminName,
        "adminEmail": adminEmail,
        "semesterName": semesterName,
        "courseName": courseName,
        "topic": topic,
        "timeStamp": timestamp,
      };
}
