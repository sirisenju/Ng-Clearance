import 'package:clearance_proj/screens/data_models/user_model.dart';
import 'package:clearance_proj/screens/nav_screens/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final users = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return UserData(
              uid: doc.id,
              firstName: data['firstName'],
              lastName: data['lastName'],
              userEmail: data['userEmail'],
              matNumber: data['matNumber'],
              password: data['password'],
              confirmPassword: data['confirmPassword'],
            );
          }).toList();
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.firstName),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailsPage(user: user),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  final UserData user;

  const UserDetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Name: ${user.firstName}'),
          Text('Name: ${user.lastName}'),
          Text('Email: ${user.userEmail}'),
          Text("MatNumber: ${user.matNumber}"),
          // Add more user details as needed
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("user_documents").doc(user.uid).collection("documents").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if(snapshot.hasData){
                  List<DocumentSnapshot> documentItems = snapshot.data!.docs;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: documentItems.length,
                      itemBuilder: (context, index){
                        var data = documentItems[index].data() as Map<String, dynamic>;
                        return Column(
                          children: [
                            Card(
                              child: ListTile(
                                title: Text("${data["filename"]}"),
                                trailing: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => View(fileUrl: data["url"],)));
                                  },
                                    child: const Icon(Icons.remove_red_eye)
                                ),
                              ),
                            ),
                            StatusUpdatePage(userId: user.uid, documentId: snapshot.data!.docs[index].reference.id)
                          ],
                        );
                  }
                  );
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return Text("nothing found");
              },
            ),
          )
        ],
      ),
    );
  }
}

class View extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  final fileUrl;
  View({super.key,  this.fileUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: SafeArea(
        child: SfPdfViewer.network(
          fileUrl,
          controller: _pdfViewerController,
        ),
      ),
    );
  }
}
