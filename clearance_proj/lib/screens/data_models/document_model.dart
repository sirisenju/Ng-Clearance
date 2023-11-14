import 'package:cloud_firestore/cloud_firestore.dart';

class Document {
  final String filename;
  final String url;
  final Timestamp timestamp;
  final String status;

  Document({
    required this.filename,
    required this.url,
    required this.timestamp,
    this.status = 'pending',
  });

  factory Document.fromMap(Map<String, dynamic> data) {
    return Document(
      filename: data['filename'],
      url: data['url'],
      timestamp: data['timestamp'],
      status: 'pending'
    );
  }
}
