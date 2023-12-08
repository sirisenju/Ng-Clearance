import 'dart:io';
import 'package:clearance_proj/screens/customWidgets/custom_formFields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class HealthCenterClearance extends StatefulWidget {
  const HealthCenterClearance({super.key});

  @override
  State<HealthCenterClearance> createState() => _HealthCenterClearanceState();
}

class _HealthCenterClearanceState extends State<HealthCenterClearance> {

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
        .collection('documents').doc("health_clearance").set({
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

  //creating list
  List<String> clearanceItems = [
    "A valid medical card"
  ];


  @override
  Widget build(BuildContext context) {

    //height and width
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                child: const Text("Welcome to your Health Center Clearance Guide.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                child: const Text(
                    "Pls make sure to submit the following documents listed below in a single pdf",
                    style: TextStyle(fontSize: 18)
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: clearanceItems.length,
                  itemBuilder: (context, index){
                    String item = clearanceItems[index];
                    return ListTile(
                      leading: const Icon(Icons.circle, size: 8,),
                      title: Text(item, style: const TextStyle(fontStyle: FontStyle.italic),),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: screenWidth,
                      child: MaterialButton(
                        height: 60,
                        color: Colors.indigoAccent[200],
                        onPressed: () {
                          openFilePicker();
                        },
                        child: const Text("click to select the file", style: TextStyle(fontSize: 18, color: Colors.white),),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      child: Text(
                          "Select a proper name for the file.", style: TextStyle(fontSize: 18)
                      ),
                    ),
                    MyFormField(
                        controller: fileNameController,
                        labelText: "Rename file",
                        hideText: false
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: screenWidth,
                      child: MaterialButton(
                        height: 60,
                        color: Colors.indigoAccent[200],
                        onPressed: () {
                          uploadFiles(user!.uid, documentFile!, fileNameController.text);
                        },
                        child: const Text('upload', style: TextStyle(fontSize: 18, color: Colors.white),),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(_fileName, style: const TextStyle(fontSize: 18),),
                    StatusWidget(userID: user!.uid)
                  ],
                ),
              ),
            ],
          ),
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
        'health_clearance').get();

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
      return 'Upload a document.';
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
          return Text('Error: ${snapshot.error}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),);
        } else {
          return Text('Status: ${snapshot.data}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),);
        }
      },
    );
  }
}
