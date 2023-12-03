import 'package:clearance_proj/screens/customWidgets/alertWidget.dart';
import 'package:clearance_proj/screens/customWidgets/custom_formFields.dart';
import 'package:clearance_proj/screens/data_models/user_model.dart';
import 'package:clearance_proj/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {

  //text controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController  _userEmailController = TextEditingController();
  final TextEditingController _matNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future registerUser() async{
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ));
    //checking password confirmation

    if(_passwordController.text.trim() != _confirmPasswordController.text.trim()){
      //pop loading circle
      Navigator.pop(context);
      //display message
      displayMessageToUser("password don't match", context);
    }

    else{
      try{
        //create user
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _userEmailController.text,
          password: _passwordController.text,
        );

        //create new user instance
        final UserData user = UserData(
            uid: userCredential.user?.uid,
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            userEmail: _userEmailController.text,
            matNumber: _matNumberController.text,
            password: _passwordController.text,
            confirmPassword: _confirmPasswordController.text
        );

        //store the user data
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set(user.toMap());
        Navigator.pop(context);

        //navigate to new screen upon success
        Navigator.pushReplacement(
            context, MaterialPageRoute(
            builder: (context) => const HomePage()));
      }

      on FirebaseAuthException catch (e){
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
    _userEmailController.dispose();
    _matNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //height and width
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                const Text("Enter Your Details correctly to register!",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 MyFormField(
                  controller: _firstNameController,
                  labelText: "First name",
                  hideText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyFormField(
                  controller: _lastNameController,
                  labelText: "Last name",
                  hideText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyFormField(
                  controller: _userEmailController,
                  labelText: "Email address",
                  hideText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyFormField(
                  controller: _matNumberController,
                  labelText: "Mat number",
                  hideText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyFormField(
                  controller: _passwordController,
                  labelText: "Password",
                  hideText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyFormField(
                  controller: _confirmPasswordController,
                  labelText: "Confirm password",
                  hideText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenWidth,
                  child: MaterialButton(
                    height: 60,
                    color: Colors.indigoAccent[200],
                    onPressed: () {
                      registerUser();
                    },
                    child: const Text("Register",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600,
                        fontSize: 23,),),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
