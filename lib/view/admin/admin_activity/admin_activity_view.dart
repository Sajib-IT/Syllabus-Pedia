import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syllabus_pedia/view/model/activity_model.dart';
import 'package:syllabus_pedia/widgets/title_value_row_widget.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class AdminActivityView extends StatelessWidget {
  const AdminActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: UIHelper().drawAppbarTitle(title: "Admin Activity"),
        ),
        body: SingleChildScrollView(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('activity')
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
                    ActivityModel activityModel =
                        ActivityModel.fromJson(doc.data());
                    return activityContainer(activity: activityModel);
                  }).toList()),
                );
              }),
        ));
  }

  Widget activityContainer({required ActivityModel activity}) {
    String formatedDate =
        DateFormat('dd-MMM-yyy\nh:mm a').format(activity.timestamp.toDate());
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
              color: Colors.grey.withValues(alpha: 0.2),
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
                Text("Name: ${activity.adminName}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text(formatedDate, style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8),
            TitleValueRowWidget(
              title: "Activity:",
              value: activity.activityName,
            ),
            TitleValueRowWidget(
              title: "Semester Name:",
              value: activity.semesterName,
            ),
            if(activity.courseName.isNotEmpty)
            TitleValueRowWidget(
              title: "Course Name:",
              value: activity.courseName,
            ),
            if(activity.courseName.isEmpty)
              TitleValueRowWidget(
                title: "topic:",
                value: activity.topic,
              ),
          ],
        ),
      ),
    ]);
  }
}
