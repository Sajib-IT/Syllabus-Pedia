
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/auth/widgets/verify_email_view.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxBool isPasswordHidden = RxBool(true);

  @override
  void onClose() {
    super.onClose();
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
      Get.offAll(()=> VerifyEmailView());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    EasyLoading.dismiss();
  }



  bool checkForm() {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      return true;
    }
    return false;
  }
}
