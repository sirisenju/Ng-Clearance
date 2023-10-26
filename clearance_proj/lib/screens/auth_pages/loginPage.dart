import 'package:clearance_proj/screens/auth_pages/registerPage.dart';
import 'package:clearance_proj/screens/customWidgets/custom_formFields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../customWidgets/alertWidget.dart';
import '../home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text controllers
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future loginUser() async{
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ));

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailAddressController.text.trim(),
          password: _passwordController.text.trim());

      //pop the loading circle
      if(context.mounted){
        Navigator.pop(context);
      }

      //navigate to new screen upon success
      Navigator.pushReplacement(
          context, MaterialPageRoute(
          builder: (context) => const HomePage()));
    }
    on FirebaseAuthException catch (e){
      //pop loading circle
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {

    //height and width
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Enter your login details: ",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyFormField(
            controller: _emailAddressController,
            labelText: "Email address",
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
          SizedBox(
            width: 280,
            child: MaterialButton(
              color: Colors.greenAccent,
              onPressed: () {
                loginUser();
              },
              child: const Text("Login"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("Dont have an account?"),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(
                      builder: (context) => const UserRegistration()
                  )
                  );
                },
                  child: const Text(" Register!",
                    style: TextStyle(
                      fontWeight: FontWeight.w600
                    ),
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}
