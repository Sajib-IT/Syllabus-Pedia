import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:syllabus_pedia/view/model/search_history_model.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart'; // For date formatting

class SearchHistoryWidget extends StatelessWidget {
   final String studentId;
  const SearchHistoryWidget({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UIHelper().drawAppbarTitle(title: "Search History"),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('info')
              .doc(studentId) // Replace with actual studentId or dynamic value
              .collection('searchHistory')
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
              return const Center(child: Text("No Search History found"));
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                children: snapshot.data!.docs.map((doc) {
                  SearchHistoryModel searchHistory = SearchHistoryModel.fromJson(doc.data() as Map<String, dynamic>);
                  return searchHistoryContainer(searchHistory: searchHistory);
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget searchHistoryContainer({required SearchHistoryModel searchHistory}) {
    String formattedDate = DateFormat('dd-MMM-yyyy\nh:mm a')
        .format(searchHistory.timestamp.toDate());

    return Container(
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
              Text("Student ID: ${searchHistory.studentId}",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(formattedDate, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          Text("Search Query:\n${searchHistory.historyText}",
              style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

// Model for SearchHistory
// class SearchHistoryModel {
//   final String studentId;
//   final String searchQuery;
//   final Timestamp timestamp;
//
//   SearchHistoryModel({
//     required this.studentId,
//     required this.searchQuery,
//     required this.timestamp,
//   });
//
//   factory SearchHistoryModel.fromJson(Map<String, dynamic> json) {
//     return SearchHistoryModel(
//       studentId: json['studentId'] ?? 'No Student ID',
//       searchQuery: json['searchQuery'] ?? 'No Search Query',
//       timestamp: json['timeStamp'] ?? Timestamp.now(),
//     );
//   }
// }