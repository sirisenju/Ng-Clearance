import 'package:clearance_proj/screens/customWidgets/custom_formFields.dart';
import 'package:clearance_proj/screens/data_models/admin_model.dart';
import 'package:clearance_proj/screens/nav_screens/adminPanel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../customWidgets/alertWidget.dart';

class AdminRegistration extends StatefulWidget {
  const AdminRegistration({super.key});

  @override
  State<AdminRegistration> createState() => _AdminRegistrationState();
}

class _AdminRegistrationState extends State<AdminRegistration> {

  //text controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController  _adminEmailController = TextEditingController();
  final TextEditingController _tokenController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future registerAdmin() async{
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ));

    if(_passwordController.text.trim() != _confirmPasswordController.text.trim()){
      //pop loading circle
      Navigator.pop(context);
      //display message
      displayMessageToUser("password don't match", context);
    }

    else{
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _adminEmailController.text,
            password: _passwordController.text
        );

        //create new admin
        final Admin admin = Admin(
            uid: userCredential.user?.uid,
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            email: _adminEmailController.text,
            token: _tokenController.text,
            password: _passwordController.text,
            confirmPassword: _confirmPasswordController.text
        );

        //store the admin data
        await FirebaseFirestore.instance.collection('admin').doc(admin.uid).set(admin.toMap());

        Navigator.pop(context);

        //navigate to new screen upon success
        Navigator.pushReplacement(
            context, MaterialPageRoute(
            builder: (context) => const AdminPage()));
      } on FirebaseAuthException catch (e){
        //pop loading circle
        Navigator.pop(context);

        //display error to user
        displayMessageToUser(e.code, context);
      }
    }
  }

  @override
  void dispose(){
    _firstNameController.dispose();
    _lastNameController.dispose();
    _adminEmailController.dispose();
    _tokenController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
          child: Column(
            children: [
              const Text("Register as admin."),
              const SizedBox(
                height: 20,
              ),
              MyFormField(
                  controller: _firstNameController,
                  labelText: "firstName",
                  hideText: false
              ),
              MyFormField(
                  controller: _lastNameController,
                  labelText: "lastName",
                  hideText: false
              ),
              MyFormField(
                  controller: _adminEmailController,
                  labelText: "email address",
                  hideText: false
              ),
              MyFormField(
                  controller: _tokenController,
                  labelText: "enter admin token",
                  hideText: false
              ),
              MyFormField(
                  controller: _passwordController,
                  labelText: "password",
                  hideText: false
              ),
              MyFormField(
                  controller: _confirmPasswordController,
                  labelText: "confirm password",
                  hideText: false
              ),
              SizedBox(
                width: 280,
                child: MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: () {
                    registerAdmin();
                  },
                  child: const Text("Register"),
                ),
              ),
            ],
          )
      ),
    );
  }
}
