import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/widgets/dialog/alert_custom_dialog.dart';

class LoginViewController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isPasswordHidden = RxBool(true);

  void signIn() async {
    EasyLoading.show(status: "Loading...");
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      log(e.code);
      if (e.code == "invalid-credential") {
        AlertCustomDialogs().showAlert(msg: "Incorrect Email or Password");
      }
    }
    EasyLoading.dismiss();
  }

  void sendForgetPasswordLink(String email) async {
    EasyLoading.show(status: "Loading...");
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.trim(),
      );
      AlertCustomDialogs().showSuccess(
          msg:
              "If an account with this email exists, a password reset email has been sent.");
      Get.back();
    } on FirebaseAuthException catch (e) {
      log(e.code);
      AlertCustomDialogs().showAlert(msg: e.message!);
      // if (e.code == "user-not-found") {
      //   AlertCustomDialogs().showAlert(msg: "User Not Found");
      // }else if(e.code == "invalid-email"){
      //   AlertCustomDialogs().showAlert(msg: e.message!);
      // }
    }
    EasyLoading.dismiss();
  }

  bool isValidEduEmail(String email) {
    final regex = RegExp(r'^it\d{5}@mbstu\.ac\.bd$');
    return regex.hasMatch(email);
  }

  bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  bool checkForm() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      AlertCustomDialogs().showAlert(msg: "Please Fill Up All Fields");
      return false;
    } else {
      if (!isValidEmail(emailController.text)) {
        AlertCustomDialogs().showAlert(msg: "Invalid Email..");
        return false;
      }
    }
    return true;
  }
}
