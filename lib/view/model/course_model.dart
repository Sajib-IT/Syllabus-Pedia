import 'dart:convert';

CourseModel courseModelFromJson(String str) => CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  final String semesterName;
  final String courseId;
  final String courseName;

  CourseModel({
    required this.semesterName,
    required this.courseId,
    required this.courseName,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    semesterName: json["semesterName"],
    courseId: json["courseId"],
    courseName: json["courseName"],
  );

  Map<String, dynamic> toJson() => {
    "semesterName": semesterName,
    "courseId": courseId,
    "courseName": courseName,
  };
}
