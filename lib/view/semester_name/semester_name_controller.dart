import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syllabus_pedia/utils/user_or_admin.dart';
import 'package:syllabus_pedia/view/model/user_model.dart';

class SemesterNameController extends GetxController
    with WidgetsBindingObserver {
  List<String> semesterNameList = [
    "First Year First Semester",
    "First Year Second Semester",
    "Second Year First Semester",
    "Second Year Second Semester",
    "Third Year First Semester",
    "Third Year Second Semester",
    "Fourth Year First Semester",
    "Fourth Year Second Semester",
  ];
  Rxn<UserModel> user = Rxn();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DateTime? _startTime;
  int _totalBrowseTime = 0;
  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    _startTimer();
    // UserOrAdmin().init();
    // getData();
    appInit();
    super.onInit();
  }

  Future<void> appInit() async {
    await UserOrAdmin().init();
    getData();
  }

  @override
  void onClose() {
    _stopTimer();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  Future<void> getData() async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        user.value =
            UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
        print('User Data: ${user.value?.name}');
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  void _startTimer() {
    _startTime = DateTime.now();
  }

  void _stopTimer() async {
    if (_startTime != null) {
      final DateTime endTime = DateTime.now();
      final int browseTimeInSeconds = endTime.difference(_startTime!).inSeconds;
      _totalBrowseTime += browseTimeInSeconds;

      // Save browse time to Firestore
      if(!UserOrAdmin().isAdmin){
        await saveBrowseTime(browseTimeInSeconds);
      }
    }
  }

  // Save or update browse time for the current date
  Future<void> saveBrowseTime(int timeInSeconds) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // Reference to the browseTime document for the current date
    final DocumentReference browseTimeDoc = firestore
        .collection('info')
        .doc(UserOrAdmin().studentId)
        .collection('browseTime')
        .doc(currentDate);

    // Check if the document exists
    final DocumentSnapshot docSnapshot = await browseTimeDoc.get();

    if (docSnapshot.exists) {
      // Update existing document
      final int currentTotalTime = docSnapshot['totalTime'];
      await browseTimeDoc.update({
        'totalTime': currentTotalTime + timeInSeconds,
        'timeStamp': Timestamp.fromDate(DateTime.now()),
        'studentId':
            UserOrAdmin().studentId, // Ensure studentId is always updated
      });
    } else {
      // Create new document
      await browseTimeDoc.set({
        'totalTime': timeInSeconds,
        'timeStamp': Timestamp.fromDate(DateTime.now()),
        'studentId': UserOrAdmin().studentId,
      });
    }
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    log('state >>>>>>>>>>>>>>>>>>>>>> : $state');
    switch (state) {
      case AppLifecycleState.resumed:
        log("on resume");
        _startTimer();
        // postUserAvailability(true);
        break;
      case AppLifecycleState.inactive:
        log("on inactive");
        break;
      case AppLifecycleState.paused:
        log("on pause");
        _stopTimer();
        // postUserAvailability(false);
        break;
      case AppLifecycleState.detached:
        log("on detached");
        break;
      case AppLifecycleState.hidden:
        log("on hidden");
        break;
    }
  }
}
