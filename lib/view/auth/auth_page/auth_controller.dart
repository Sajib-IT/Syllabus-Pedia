import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'auth_view.dart';

class AuthController extends GetxController {
  RxBool isEmailVerified = RxBool(false);
  Timer? timer;
  @override
  void onInit() {
    sendEmailVerifyLink();
    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      reload();
    });
    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void sendEmailVerifyLink() async {
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  void reload() async {
    await FirebaseAuth.instance.currentUser!.reload().then((value) {
      log("from reload data");
      isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
      print(isEmailVerified.value);
      if (isEmailVerified.value) {
        Get.offAll(() => AuthView());
      }
      // else {
      //   AlertCustomDialogs()
      //       .showAlert(msg: "At first complete verification Please");
      // }
    });
  }
}
