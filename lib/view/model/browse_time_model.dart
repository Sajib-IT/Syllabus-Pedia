import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

BrowseTimeModel browseTimeModelFromJson(String str) => BrowseTimeModel.fromJson(json.decode(str));

String browseTimeModelToJson(BrowseTimeModel data) => json.encode(data.toJson());

class BrowseTimeModel {
  final String studentId;
  final Timestamp timeStamp;
  final int totalTime;

  BrowseTimeModel({
    required this.studentId,
    required this.timeStamp,
    required this.totalTime,
  });

  factory BrowseTimeModel.fromJson(Map<String, dynamic> json) => BrowseTimeModel(
    studentId: json["studentId"],
    timeStamp: json["timeStamp"],
    totalTime: json["totalTime"],
  );

  Map<String, dynamic> toJson() => {
    "studentId": studentId,
    "timeStamp": timeStamp,
    "totalTime": totalTime,
  };
}
