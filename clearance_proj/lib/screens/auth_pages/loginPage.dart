import 'package:clearance_proj/screens/auth_pages/registerPage.dart';
import 'package:clearance_proj/screens/customWidgets/custom_formFields.dart';
import 'package:clearance_proj/screens/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../customWidgets/alertWidget.dart';

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
      //firebase authentication
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
          builder: (context) => const Navigation()));
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 10, right: 8, bottom: 10),
              child: Text("Enter your login details: ",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      width: screenWidth,
                      child: MaterialButton(
                        height: 60,
                        color: Colors.indigoAccent[200],
                        onPressed: () {
                          loginUser();
                        },
                        child: const Text("Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                          color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("Don't have an account?", style: TextStyle(
                          fontSize: 18,
                        ),),
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
                                  fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.indigoAccent
                              ),
                            )
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
