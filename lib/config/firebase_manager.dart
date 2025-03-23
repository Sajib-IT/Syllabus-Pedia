import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:syllabus_pedia/utils/user_or_admin.dart';
import 'package:syllabus_pedia/view/model/content_model.dart';
import 'package:syllabus_pedia/view/model/course_model.dart';

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
          .doc(courseModel.courseName)
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
          .doc(contentModel.courseName)
          .collection("courseContents")
          .doc(contentModel.contentId)
          .set(contentModelJson);
    } on FirebaseException catch (e) {
      log(e.code);
      EasyLoading.dismiss();
    }
  }
}
