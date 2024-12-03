import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syllabus_pedia/view/auth/login/login_view.dart';
import 'package:syllabus_pedia/view/auth/widgets/verify_email_view.dart';
import 'package:syllabus_pedia/view/semester_name/semester_name_view.dart';

class AuthView extends StatelessWidget {
  // final _controller = Get.put(AuthController());
   AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              if(snapshot.data!.emailVerified){
                return SemesterNameView();
              }else{
                return VerifyEmailView();
              }
            }else{
              return LoginView();
            }
          }),
    );
  }
}
