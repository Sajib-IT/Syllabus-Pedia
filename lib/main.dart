import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/welcome/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 3)
    ..loadingStyle = EasyLoadingStyle.custom
    ..textColor = Colors.black
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.blue.shade300
    ..maskColor = Colors.grey
    ..indicatorType = EasyLoadingIndicatorType.wave
    ..indicatorSize = 40.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black
    ..userInteractions = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(),
          surfaceTintColor: Colors.black,
          backgroundColor: Colors.transparent,
          // centerTitle: true,
          elevation: 0,
        ),
      ),
      home:  WelcomeView(),
      builder: EasyLoading.init(),
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}

