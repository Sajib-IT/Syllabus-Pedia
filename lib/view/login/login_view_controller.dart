import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginViewController extends GetxController{
  final email = TextEditingController();
  final password = TextEditingController();
  RxBool isPasswordHidden = RxBool(true);

  bool checkForm(){
    if(email.text.isNotEmpty && password.text.isNotEmpty){
      return true;
    }
    return false;
  }

}