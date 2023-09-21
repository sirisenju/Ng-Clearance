//import 'package:clearance_proj/screens/login_page.dart';
import 'package:clearance_proj/screens/welcome_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) {
          return const Welcome();
        }),
      );
    });
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/checklist3.jpg"),
                  radius: 140.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Welcome to Checker",
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic
                  ),),
              ),
              Text("Your one stop for clearance!",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              )
            ],
          )
      ),
    );
  }
}



