import 'package:clearance_proj/screens/data_models/user_model.dart';
import 'package:clearance_proj/screens/nav_screens/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../customWidgets/custom_formFields.dart';

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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                    child: Text("List of students.",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(user.firstName, 
                                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400)
                            ),
                            Text(user.matNumber, 
                                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400)
                            )
                          ],
                        ),
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
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  final UserData user;

  UserDetailsPage({super.key, required this.user});

  //text controllers
  final TextEditingController _commentTextController = TextEditingController();

  Future<void> addComment(BuildContext context, String uid, String comment, TextEditingController controller) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference docRef = firestore.collection('user_documents').doc(user.uid);

    return docRef.set({
      'comments': FieldValue.arrayUnion([comment])
    }, SetOptions(merge: true))
        .then((_) {
      showSuccessDialog(context);
      controller.clear(); // Clear the input field after successful submission
    })
        .catchError((error) {
    });
  }


  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success"),
          content: const Text("Comment added successfully!"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //height and width
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('First name: ${user.firstName}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              Text('Last name: ${user.lastName}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              Text("MatNumber: ${user.matNumber}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
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
                    return const Text("nothing found");
                  },
                ),
              ),
              const Text("Comment Box", style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
              ),
              ),
              const SizedBox(height: 10,),
              MyFormField(
                controller: _commentTextController,
                labelText: "leave a comment",
                hideText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: screenWidth,
                child: MaterialButton(
                  height: 60,
                  color: Colors.deepPurple,
                  onPressed: () {
                    if(_commentTextController.text.isNotEmpty){
                      addComment(context, user.uid!, _commentTextController.text, _commentTextController);
                      _commentTextController.clear(); // Clear the input field after submission
                    }
                  },
                  child: const Text("Comment",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
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
