import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syllabus_pedia/utils/user_or_admin.dart';
class FirebaseManager{

  Future<void> deleteSubDocument({
    required String studentId,
    required String subCollectionName,
    required String searchHistoryDocId,
  }) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the specific document in the subcollection
    DocumentReference docRef = firestore
        .collection('info')
        .doc(studentId)
        .collection(subCollectionName)
        .doc(searchHistoryDocId);

    // Delete the document
    await docRef.delete().then((_) {
      print('Document with ID $searchHistoryDocId deleted successfully');
    }).catchError((error) {
      print('Failed to delete document with ID $searchHistoryDocId: $error');
    });
  }

  Future<void> deleteDocument({
    required String searchHistoryDocId,
  }) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the specific document in the subcollection
    DocumentReference docRef = firestore
        .collection('feedback')
        .doc(searchHistoryDocId);

    // Delete the document
    await docRef.delete().then((_) {
      print('Document with ID $searchHistoryDocId deleted successfully');
    }).catchError((error) {
      print('Failed to delete document with ID $searchHistoryDocId: $error');
    });
  }
}