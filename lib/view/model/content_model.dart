import 'dart:convert';

ContentModel contentModelFromJson(String str) => ContentModel.fromJson(json.decode(str));

String contentModelToJson(ContentModel data) => json.encode(data.toJson());

class ContentModel {
  final String contentId;
  final String courseId;
  final String title;
  final String subtitle;
  final String courseName;
  final String semesterName;

  ContentModel({
    required this.contentId,
    required this.courseId,
    required this.title,
    required this.subtitle,
    required this.courseName,
    required this.semesterName,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
    contentId: json["contentId"],
    courseId: json["courseId"],
    title: json["title"],
    subtitle: json["subtitle"],
    courseName: json["courseName"],
    semesterName: json["semesterName"],
  );

  Map<String, dynamic> toJson() => {
    "contentId": contentId,
    "courseId": courseId,
    "title": title,
    "subtitle": subtitle,
    "courseName": courseName,
    "semesterName": semesterName,
  };
}
