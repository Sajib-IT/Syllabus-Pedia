import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/auth/widgets/verify_email_view.dart';
import 'package:syllabus_pedia/view/model/user_model.dart';
import 'package:syllabus_pedia/widgets/dialog/alert_custom_dialog.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final studentIdController = TextEditingController();
  final nameController = TextEditingController();
  final sessionController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxBool isPasswordHidden = RxBool(true);
  late UserModel userModel;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

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
  Future<void> createUser() async {
    userModel = UserModel(
        id: auth.currentUser!.uid,
        name: nameController.text,
        email: emailController.text,
        studentId: studentIdController.text,
        session: sessionController.text,
        year: selectedYear.value,
        semester: selectedSemester.value,
        password: passwordController.text,
        profileImageUrl: null);
    Map<String, dynamic> userModelJson = userModel.toJson();
    log(userModel.id);
    try {
      await firestore.collection('user').doc(userModel.id).set(userModelJson);
    } on FirebaseException catch (e) {
      log(e.code);
      EasyLoading.dismiss();
    }
  }

  void signUp() async {
    EasyLoading.show(status: "Loading...");
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // sendEmailVerifyLink();
      // Get.offAll(()=> AuthView());
      await createUser();
      Get.offAll(() => VerifyEmailView());
    } on FirebaseAuthException catch (e) {
      log(e.code);
      if (e.code == 'email-already-in-use') {
        AlertCustomDialogs()
            .showAlert(msg: "The account already exists .. Please LogIn");
      }
      if (e.code == 'weak-password') {
        AlertCustomDialogs()
            .showAlert(msg: "Please Enter Password At Least 6 length");
      }
    }
    EasyLoading.dismiss();
  }

  bool isValidEmail(String email) {
    final regex = RegExp(r'^it\d{5}@mbstu\.ac\.bd$');
    return regex.hasMatch(email);
  }

  bool checkForm() {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        nameController.text.isEmpty ||
        sessionController.text.isEmpty ||
        studentIdController.text.isEmpty ||
        selectedYear.value == null ||
        selectedSemester.value == null) {
      AlertCustomDialogs().showAlert(msg: "Please Fill Up All Fields");
      return false;
    } else {
      if (!isValidEmail(emailController.text)) {
        AlertCustomDialogs().showAlert(msg: "You Are Not ICT Student");
        return false;
      }
      if (passwordController.text != confirmPasswordController.text) {
        AlertCustomDialogs().showAlert(msg: "Confirm Password not match");
        return false;
      }
    }
    return true;
  }
}
