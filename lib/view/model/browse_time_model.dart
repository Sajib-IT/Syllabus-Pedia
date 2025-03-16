import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

BrowseTimeModel browseTimeModelFromJson(String str) => BrowseTimeModel.fromJson(json.decode(str));

String browseTimeModelToJson(BrowseTimeModel data) => json.encode(data.toJson());

class BrowseTimeModel {
  final String studentId;
  final String id;
  final Timestamp timeStamp;
  final int totalTime;

  BrowseTimeModel({
    required this.studentId,
    required this.id,
    required this.timeStamp,
    required this.totalTime,
  });

  factory BrowseTimeModel.fromJson(Map<String, dynamic> json) => BrowseTimeModel(
    studentId: json["studentId"],
    id: json["id"],
    timeStamp: json["timeStamp"],
    totalTime: json["totalTime"],
  );

  Map<String, dynamic> toJson() => {
    "studentId": studentId,
    "id": id,
    "timeStamp": timeStamp,
    "totalTime": totalTime,
  };
}
