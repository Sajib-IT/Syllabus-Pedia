import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syllabus_pedia/view/model/user_model.dart';
import 'package:syllabus_pedia/view/profile/profile_controller.dart';
import 'package:syllabus_pedia/widgets/dialog/alert_custom_dialog.dart';

class EditProfileController extends GetxController {
  final _profileController = Get.put(ProfileController());
  final studentIdController = TextEditingController();
  final nameController = TextEditingController();
  final sessionController = TextEditingController();
  RxBool isLoading = RxBool(false);
  RxnString selectedYear = RxnString();
  List<String> yearList = [
    'First Year',
    'Second Year',
    'Third Year',
    'Fourth Year',
  ];
  RxnString selectedSemester = RxnString();
  List<String> semesterList = [
    'First Semester',
    'Second Semester',
  ];
  late UserModel user;
  @override
  void onInit() {
    if (Get.arguments != null) {
      user = Get.arguments;
      log(user.name);
    }
    initialField();
    super.onInit();
  }

  void initialField() {
    isLoading.value = true;
    nameController.text = user.name;
    sessionController.text = user.session!;
    studentIdController.text = user.studentId!;
    selectedYear.value = user.year;
    selectedSemester.value = user.semester;
    isLoading.value = false;
  }


  Future<void> updateUserData() async {
    EasyLoading.show(status: "Loading...");
    final String userId = FirebaseAuth.instance.currentUser!.uid;
    log("userId $userId");
    try {
      await FirebaseFirestore.instance.collection('user').doc(userId).update({
        'name': nameController.text.trim(),
        "studentId": studentIdController.text,
        "session": sessionController.text,
        "year": selectedYear.value,
        "semester": selectedSemester.value,
      });
      AlertCustomDialogs().showSuccess(msg: "User data updated successfully");
      _profileController.getData();
      Get.back();
    } catch (e) {
      AlertCustomDialogs().showAlert(msg: e.toString());
      log(e.toString());
    }
    EasyLoading.dismiss();
  }
}
