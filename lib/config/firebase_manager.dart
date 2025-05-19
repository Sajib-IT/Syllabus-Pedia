import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:syllabus_pedia/utils/user_or_admin.dart';
import 'package:syllabus_pedia/view/model/activity_model.dart';
import 'package:syllabus_pedia/view/model/content_model.dart';
import 'package:syllabus_pedia/view/model/course_model.dart';
import 'package:syllabus_pedia/view/model/user_model.dart';

class FirebaseManager {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> deleteSubDocument({
    required String studentId,
    required String subCollectionName,
    required String searchHistoryDocId,
  }) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the specific document in the subcollection
    DocumentReference docRef = firestore
        .collection('info')
        .doc(studentId)
        .collection(subCollectionName)
        .doc(searchHistoryDocId);

    // Delete the document
    await docRef.delete().then((_) {
      print('Document with ID $searchHistoryDocId deleted successfully');
    }).catchError((error) {
      print('Failed to delete document with ID $searchHistoryDocId: $error');
    });
  }

  Future<void> deleteDocument({
    required String searchHistoryDocId,
  }) async {
    // Reference to the specific document in the subcollection
    DocumentReference docRef =
        firestore.collection('feedback').doc(searchHistoryDocId);

    // Delete the document
    await docRef.delete().then((_) {
      print('Document with ID $searchHistoryDocId deleted successfully');
    }).catchError((error) {
      print('Failed to delete document with ID $searchHistoryDocId: $error');
    });
  }

  Future<void> addCourse({required CourseModel courseModel}) async {
    Map<String, dynamic> courseModelJson = courseModel.toJson();
    log(courseModel.courseName);
    log(courseModel.semesterName.toString());
    try {
      await firestore
          .collection(courseModel.semesterName)
          .doc(courseModel.courseId)
          .set(courseModelJson);
    } on FirebaseException catch (e) {
      log(e.code);
      EasyLoading.dismiss();
    }
  }

  void addCourseWithContents({required ContentModel contentModel}) async {
    Map<String, dynamic> contentModelJson = contentModel.toJson();
    log(contentModel.title);
    log(contentModel.contentId.toString());
    try {
      await firestore
          .collection(contentModel.semesterName)
          .doc(contentModel.courseId)
          .collection("courseContents")
          .doc(contentModel.contentId)
          .set(contentModelJson);
    } on FirebaseException catch (e) {
      log(e.code);
      EasyLoading.dismiss();
    }
  }

  void updateCourse(CourseModel courseModel, String updatedCourse) async {
    await firestore
        .collection(courseModel.semesterName) // Collection name
        .doc(courseModel.courseId) // Document ID
        .update({
          'courseName': updatedCourse,
        })
        .then((_) => print("Course Updated"))
        .catchError((error) => print("Error updating document: $error"));
    addAdminActivity(
        activityName: "Update course",
        semesterName: courseModel.semesterName,
        topic: "from '${courseModel.courseName}' to '$updatedCourse'");
  }

  void updateContent(
      ContentModel contentModel, String title, String subtitle) async {
    await firestore
        .collection(contentModel.semesterName) // Collection name
        .doc(contentModel.courseId)
        .collection("courseContents")
        .doc(contentModel.contentId) // Document ID
        .update({
          'title': title,
          'subtitle': subtitle,
        })
        .then((_) => print("Course Updated"))
        .catchError((error) => print("Error updating document: $error"));
    addAdminActivity(
        activityName: "Update content",
        semesterName: contentModel.semesterName,
        courseName: contentModel.courseName,
        topic: "changed course content");
  }

  void deleteContent(ContentModel contentModel) async {
    await firestore
        .collection(contentModel.semesterName) // Collection name
        .doc(contentModel.courseId)
        .collection("courseContents")
        .doc(contentModel.contentId) // Document ID
        .delete()
        .then((_) => print("Course Deleted"))
        .catchError((error) => print("Error deleting document: $error"));
    addAdminActivity(
        activityName: "Delete Content",
        semesterName: contentModel.semesterName,
        courseName: contentModel.courseName,
        topic: "Deleted content");
  }

  void deleteCourse(CourseModel courseModel) async {
    DocumentReference docRef = firestore
        .collection(courseModel.semesterName)
        .doc(courseModel.courseId);

    // Delete the document
    await docRef.delete().then((_) {
      print('Document with ID ${courseModel.courseName} deleted successfully');
    }).catchError((error) {
      print(
          'Failed to delete document with ID ${courseModel.courseName}: $error');
    });
    addAdminActivity(
        activityName: "Delete course",
        semesterName: courseModel.semesterName,
        topic: courseModel.courseName);
  }

  Future<void> addAdminActivity(
      {required String activityName,
      String? courseName,
      String? semesterName,
      required String topic}) async {
    String activityId = DateTime.now().millisecondsSinceEpoch.toString();
    String adminName = await getData();
    ActivityModel activityModel = ActivityModel(
      activityId: activityId,
      adminId: FirebaseAuth.instance.currentUser!.uid,
      activityName: activityName,
      adminName: adminName,
      adminEmail: FirebaseAuth.instance.currentUser!.email!,
      semesterName: semesterName ?? '',
      courseName: courseName ?? '',
      topic: topic,
      timestamp: Timestamp.now(),
    );

    Map<String, dynamic> activityModelJson = activityModel.toJson();
    log(activityModel.adminName);
    log(activityModel.semesterName.toString());
    try {
      await firestore
          .collection("activity")
          .doc(activityModel.activityId)
          .set(activityModelJson);
    } on FirebaseException catch (e) {
      log(e.code);
      EasyLoading.dismiss();
    }
  }

  Future<String> getData() async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        UserModel userModel =
            UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
        return userModel.name;
        print('User Data: ${userModel.name}');
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
    return '';
  }
}
