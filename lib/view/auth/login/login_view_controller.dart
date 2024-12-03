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
      print(e);
      AlertCustomDialogs().showAlert(msg: e.toString());
    }
    EasyLoading.dismiss();
  }

  bool checkForm() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    }
    return false;
  }
}
