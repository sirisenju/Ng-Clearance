import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatusUpdatePage extends StatelessWidget {
  final String? userId;
  final String? documentId;

  const StatusUpdatePage({super.key, required this.userId, required this.documentId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("user_documents")
          .doc(userId)
          .collection("documents")
          .doc(documentId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        var documentData = snapshot.data!;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CheckboxListTile(
                checkColor: Colors.white,
                activeColor: Colors.green[600],
                title: const Text('Approved'),
                value: documentData['status'] == 'approved',
                onChanged: (bool? value) {
                  updateStatus(value);
                },
              ),
            ),
            Expanded(
              child: CheckboxListTile(
                checkColor: Colors.white,
                activeColor: Colors.red[800],
                title: const Text('Rejected'),
                value: documentData['status'] == 'rejected',
                onChanged: (bool? value) {
                  updateStatus(value);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void updateStatus(bool? value) {
    String newStatus = value == true ? 'approved' : 'rejected';
    FirebaseFirestore.instance
        .collection("user_documents")
        .doc(userId)
        .collection("documents")
        .doc(documentId)
        .update({'status': newStatus})
        .then((_) {
      print('Status updated to: $newStatus');
    }).catchError((error) {
      print('Error updating status: $error');
    });
  }
}


