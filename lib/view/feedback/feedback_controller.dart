import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/model/feedback_model.dart';
import 'package:syllabus_pedia/view/model/user_model.dart';
import 'package:syllabus_pedia/widgets/dialog/alert_custom_dialog.dart';

class FeedbackController extends GetxController {
  final TextEditingController feedbackController = TextEditingController();
  late FeedbackModel feedbackModel;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Rxn<UserModel> user = Rxn();

  void saveFeedback() async {
    await getData();
    feedbackModel = FeedbackModel(
      userId: auth.currentUser!.uid,
      studentId: user.value!.studentId!,
      feedbackText: feedbackController.text,
      timestamp: Timestamp.now(),
    );
    Map<String, dynamic> feedbackModelJson = feedbackModel.toJson();
    log(feedbackModel.userId);
    try {
      await firestore.collection('feedback').doc(feedbackModel.userId).set(feedbackModelJson);
      AlertCustomDialogs().showSuccess(msg: "Feedback Sent Successfully");
      feedbackController.clear();
    } on FirebaseException catch (e) {
      log(e.code);
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
  }

  Future<void> getData() async {
    EasyLoading.show(status: "Loading..");
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        user.value =
            UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
        print('User Data: ${user.value!.name}');
      } else {
        EasyLoading.dismiss();
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching user data: $e');
      EasyLoading.dismiss();
    }
  }
}
