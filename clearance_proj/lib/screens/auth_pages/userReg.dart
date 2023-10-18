import 'package:clearance_proj/screens/auth_pages/login_page.dart';
import 'package:flutter/material.dart';

import '../navigation.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController matNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // size of the device
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 40, 15, 10),
                      child: Text("Join us today. Register.",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(), labelText: "Email",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              //color: Colors.red,
                              width: 1.4,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: matNumber,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(), labelText: "Mat number",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              //color: Colors.red,
                              width: 1.4,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mat number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(), labelText: "Password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              //color: Colors.red,
                              width: 1.5,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: SizedBox(
                        height: 48,
                        width: screenWidth * 0.90,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            //backgroundColor: Colors.red,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              )
                          ),
                          onPressed: (){
                            //on pressed function
                            if (_formKey.currentState!.validate()) {
                              // Navigate the user to the Home page
                              //the password and email controller
                              if (emailController.text == "siri@gmail.com" && passwordController.text == "siri") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Navigation(
                                      )),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Invalid Credentials')),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please fill input')),
                              );
                            }
                          }, child: const Text("continue"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 14, 15, 10),
                      child: SizedBox(
                          width: screenWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                               const Text("Already have an account?",
                                 style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w400,
                                 ),
                               ),
                                InkWell(
                                  child: const Text(" Login!",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  ),),
                                  onTap: (){
                                    Navigator.pushReplacement(
                                        context, MaterialPageRoute(
                                        builder: (context) => const LoginPage())
                                    );
                                  },
                                )
                            ],
                          ),
                    )
                    )],
                ),
              )
            ],
          ),
        ),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
