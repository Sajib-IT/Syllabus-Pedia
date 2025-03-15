import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:syllabus_pedia/config/api-key.dart';
import 'package:syllabus_pedia/utils/user_or_admin.dart';
import 'package:syllabus_pedia/view/model/search_history_model.dart';

class AiGeneratedTextController extends GetxController {
  String selectedText = '';
  RxString aiResponseText = RxString('');
  String apiKey = api_key;
  late SearchHistoryModel searchHistoryModel;
  @override
  void onInit() {
    if (Get.arguments != null) {
      selectedText = Get.arguments;
      print(selectedText);
    }
    aiGeneratedText();
    // getStudentIdData();
    super.onInit();
  }

  void aiGeneratedText() async {
    EasyLoading.show(status: "Loading...");
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      // model: 'gemini 2.0 Flash',
      apiKey: apiKey,
    );
    final prompt = selectedText;
    final response = await model.generateContent([Content.text(prompt)]);
    if (response.text != null) {
      aiResponseText.value = response.text!;
    }
    EasyLoading.dismiss();
    print(response.text);
  }

  // Future<void> getStudentIdData() async {
  //   try {
  //     final DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //         .collection('user')
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //
  //     if (snapshot.exists) {
  //       final data = snapshot.data() as Map<String, dynamic>;
  //       final studentId =
  //           data['studentId']; // Assuming 'studentId' is the field name
  //       print('Student ID: $studentId');
  //       saveSearchHistory(studentId, selectedText);
  //     } else {
  //       print('Document does not exist');
  //     }
  //   } catch (e) {
  //     print('Error fetching user data: $e');
  //   }
  // }

  Future<void> saveSearchHistory(String studentId, String historyText) async {
    try {
      // Reference to Firestore
      final firestore = FirebaseFirestore.instance;
      searchHistoryModel = SearchHistoryModel(
          studentId: studentId,
          historyText: historyText,
          timestamp: Timestamp.now());
      // Reference to the student's search history subcollection
      CollectionReference searchHistoryRef = firestore
          .collection('info')
          .doc(UserOrAdmin().studentId)
          .collection('searchHistory');
      Map<String, dynamic> searchHistoryModelJson = searchHistoryModel.toJson();
      // Create a new document with timestamp
      await searchHistoryRef.add(searchHistoryModelJson);

      print("Search history saved successfully");
    } catch (e) {
      print("Error saving search history: $e");
    }
  }
}
