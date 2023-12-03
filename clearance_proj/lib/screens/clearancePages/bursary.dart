import 'dart:io';
import 'package:clearance_proj/screens/customWidgets/custom_formFields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class BursaryClearance extends StatefulWidget {
  const BursaryClearance({super.key});

  @override
  State<BursaryClearance> createState() => _BursaryClearanceState();
}

class _BursaryClearanceState extends State<BursaryClearance> {

  //declerations
  TextEditingController fileNameController = TextEditingController();
  String selectedFileName = '';

  void clearTextfield() {
    fileNameController.clear();
    FocusScope.of(context).unfocus(); // Close the keyboard
  }

  //we work here
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName = 'No file selected';

  //instance of the signed in user
  final user = FirebaseAuth.instance.currentUser;


  //button to select file
  File? documentFile;
  bool showUploadSuccessMessage = false;

  void openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      // allowedExtensions: ["pdf", "jpg"]// Disallow selecting multiple files
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      String customFileName = fileNameController.text;
      setState(() {
        selectedFileName =
        customFileName.isNotEmpty ? customFileName : file.name;
        _fileName = result.files.first.name;
        documentFile =
            File(file.path!); // Create a File object from the file path
        fileNameController.clear();
      });
    } else {
      // User canceled the picker
      setState(() {
        selectedFileName = ''; // Reset the selected file name
        documentFile = null; // Clear the selected file
      });
    }
  }


  //button to upload files
  Future uploadFiles(String userUid, File documentFile, String filename) async {
    Reference storageRef = FirebaseStorage.instance.ref().child(
        'user_documents').child(userUid).child('documents').child(filename);
    UploadTask uploadTask = storageRef.putFile(documentFile);
    TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() {});
    String downloadURL = await storageTaskSnapshot.ref.getDownloadURL();

    // Create a new document entry in Firestore.
    await FirebaseFirestore.instance.collection('user_documents')
        .doc(userUid)
        .collection('documents').doc("bursary_clearance").set({
      'filename': filename,
      'url': downloadURL,
      'timestamp': FieldValue.serverTimestamp(),
      'status': 'pending',
    });

    // If the upload is successful, show the success SnackBar
    showSuccessSnackBar("Document uploaded successfully");
    clearTextfield(); //clear text field
    print("successful");
  }


  //show snackbar
  void showSuccessSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3), // Adjust the duration as needed
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white60,
      body: SafeArea(
        child: Column(
          children: [
            const Text("Welcome to your Bursary Clearance Guide."),
            const Text(
                "Pls make sure to submit the following documents listed below in a single pdf"),
            ElevatedButton(
              onPressed: () {
                openFilePicker();
              },
              child: const Text("click to select the file"),
            ),
            MyFormField(
                controller: fileNameController,
                labelText: "Rename file",
                hideText: false
            ),
            ElevatedButton(
              onPressed: () {
                uploadFiles(user!.uid, documentFile!, fileNameController.text);
              },
              child: const Text('upload'),
            ),
            Text(_fileName),
            StatusWidget(userID: user!.uid)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    fileNameController.dispose();
    super.dispose();
  }
}

// Assuming you have a reference to the user document
Future<String> getStatus(String userID) async {
  DocumentReference userRef = FirebaseFirestore.instance.collection(
      'user_documents').doc(userID);
  try {
    CollectionReference departmentalCollectionRef = userRef.collection(
        'documents');
    DocumentSnapshot departmentalDoc = await departmentalCollectionRef.doc(
        'bursary_clearance').get();

    if (departmentalDoc.exists) {
      Map<String, dynamic> data = departmentalDoc.data() as Map<
          String,
          dynamic>;

      if (data.containsKey('status')) {
        String status = data['status'];
        return status;
      } else {
        return 'Status field does not exist in the document.';
      }
    } else {
      return 'Bursary document does not exist.';
    }
  } catch (e) {
    return 'Error getting status: $e';
  }
}

class StatusWidget extends StatelessWidget {
  final String userID;

  StatusWidget({required this.userID});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getStatus(userID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Text('Status: ${snapshot.data}');
        }
      },
    );
  }
}
