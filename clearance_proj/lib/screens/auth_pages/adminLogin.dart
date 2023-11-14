import 'package:clearance_proj/screens/auth_pages/register_admin.dart';
import 'package:clearance_proj/screens/customWidgets/custom_formFields.dart';
import 'package:clearance_proj/screens/nav_screens/adminPanel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../customWidgets/alertWidget.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  //email controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future loginAdmin() async{
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ));

    try{
      //checking credential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
      //pop the loading circle
      if(context.mounted){
        Navigator.pop(context);
      }

      //Check if the logged-in user is an admin.
      if (await isAdmin(userCredential.user!.uid)) {
        //navigate to new screen upon success
        Navigator.pushReplacement(
            context, MaterialPageRoute(
            builder: (context) => const AdminPage()));
      } else {
        // The user is not authorized as an admin.
        displayMessageToUser("You are not permitted to go further", context);
      }
    } on FirebaseAuthException catch (e){
      //pop loading circle
      Navigator.pop(context);
      //display error to user
      displayMessageToUser(e.code, context);
    }
  }

  // Function to check if a user is an admin.
  Future<bool> isAdmin(String uid) async {
    // Reference to the Firestore collection where admin data is stored.
    CollectionReference adminCollection = FirebaseFirestore.instance.collection('admin');

    try {
      // Query Firestore to check if a document with the user's UID exists in the 'admins' collection.
      DocumentSnapshot adminDocument = await adminCollection.doc(uid).get();

      // Check if the document exists. If it does, the user is an admin.
      return adminDocument.exists;
    } catch (e) {
      // Handle any errors that occur during the query.
      print('Error checking admin status: $e');
      return false; // Consider treating this as a non-admin to be safe.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Welcome back. Enter your details to continue."),
          MyFormField(
              controller: _emailController,
              labelText: "Email",
              hideText: false
          ),
          MyFormField(
              controller: _passwordController,
              labelText: "Password",
              hideText: false
          ),
          SizedBox(
            width: 280,
            child: MaterialButton(
              color: Colors.greenAccent,
              onPressed: () {
                // print("zero progress");
                loginAdmin();
              },
              child: const Text("Login"),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(
                  builder: (context) => const AdminRegistration()));
            },
              child: const Text("Create admin account?", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20
              ),)
          )],
      ),
    );
  }
}
