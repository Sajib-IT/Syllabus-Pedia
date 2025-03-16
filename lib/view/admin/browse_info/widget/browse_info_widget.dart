import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:syllabus_pedia/config/firebase_manager.dart';
import 'package:syllabus_pedia/view/admin/browse_info/widget/format.dart';
import 'package:syllabus_pedia/view/model/browse_time_model.dart';
import 'package:syllabus_pedia/widgets/dialog/confirmation_dialog.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart'; // For date formatting

class BrowseInfoWidget extends StatelessWidget {
  final String studentId;
  const BrowseInfoWidget({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UIHelper().drawAppbarTitle(title: "Browse Info - $studentId"),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('info')
              .doc(studentId)
              .collection('browseTime')
              .orderBy("timeStamp", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("No Browse History found"));
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                children: snapshot.data!.docs.map((doc) {
                  BrowseTimeModel browseTime = BrowseTimeModel.fromJson(doc.data() as Map<String, dynamic>);
                  return browseInfoContainer(browseTime: browseTime);
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget browseInfoContainer({required BrowseTimeModel browseTime}) {
    String formattedDate =
    DateFormat('dd-MMM-yyyy').format(browseTime.timeStamp.toDate());

    return Stack(children: [
      Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 1.5),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Student ID: ${browseTime.studentId}",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text(formattedDate, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 8),
            Text("Total Browse Time:",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
            Text(Format().formatTimeHumanReadable(browseTime.totalTime),
                style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
          ],
        ),
      ),
      Positioned(
          bottom: 0,
          right: 8,
          child: IconButton(
              onPressed: () {
                ConfirmationDialog().showDelete(function: () {
                  FirebaseManager().deleteSubDocument(
                      subCollectionName: "browseTime",
                      studentId: browseTime.studentId,
                      searchHistoryDocId: browseTime.id);
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
