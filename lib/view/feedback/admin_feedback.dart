import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syllabus_pedia/config/firebase_manager.dart';
import 'package:syllabus_pedia/view/model/feedback_model.dart';
import 'package:syllabus_pedia/widgets/dialog/confirmation_dialog.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class AdminFeedback extends StatelessWidget {
  const AdminFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: UIHelper().drawAppbarTitle(title: "Feedback"),
        ),
        body: SingleChildScrollView(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('feedback')
                  .orderBy("timeStamp", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                }

                if (!snapshot.hasData) {
                  return const Center(child: Text("No Feedback found"));
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: Column(
                      children: snapshot.data!.docs.map((doc) {
                    FeedbackModel feedbackModel =
                        FeedbackModel.fromJson(doc.data());
                    return feedbackContainer(feedback: feedbackModel);
                  }).toList()),
                );
              }),
        ));
  }

  Widget feedbackContainer({required FeedbackModel feedback}) {
    String formatedDate =
        DateFormat('dd-MMM-yyy\nh:mm a').format(feedback.timestamp.toDate());
    return Stack(children: [
      Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 1.5),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("ID: ${feedback.studentId}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text(formatedDate, style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8),
            Text("Feedback:\n ${feedback.feedbackText}",
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      Positioned(
          bottom: 0,
          right: 8,
          child: IconButton(
              onPressed: () {
                ConfirmationDialog().showDelete(function: () {
                  FirebaseManager()
                      .deleteDocument(searchHistoryDocId: feedback.userId);
                });
              },
              splashRadius: 16,
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              ))),
    ]);
  }
}
