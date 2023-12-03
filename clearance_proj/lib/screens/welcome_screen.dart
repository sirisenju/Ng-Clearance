import 'package:clearance_proj/screens/auth_pages/adminLogin.dart';
import 'package:clearance_proj/screens/auth_pages/loginPage.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {

    //height and width
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.indigoAccent[200],
        body: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: screenHeight,
                    child: const Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/checklist3.jpg"),
                        radius: 140.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text("Your one stop application for school clearance",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            )
        ),
        bottomSheet: Container(
          height: 300,
          width:  screenWidth,
          decoration: const BoxDecoration(
              color: Colors.white70,
            border: null,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 23
                  ),
                  const Text("Hi, welcome back!", style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),),
                  const Text("Please login to continue",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300
                    ),),
                  const SizedBox(
                      height: 10
                  ),
                  Container(
                    width: screenWidth / 1.1,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.indigoAccent[200],
                    ),
                    child: MaterialButton(
                      onPressed: (){
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (builder){
                                return SizedBox(
                                  height: screenHeight * 0.80,
                                    child: const LoginPage()
                                );
                        });
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Log in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.arrow_right_alt_sharp, size: 45,color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: screenWidth / 1.1,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.indigoAccent[200],
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (builder){
                              return SizedBox(
                                  height: screenHeight * 0.80,
                                  child: const AdminLogin()
                              );
                            });
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Login as Admin", style: TextStyle(
                            color: Colors.white,
                              fontSize: 20
                          ),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.app_registration_sharp, size: 30, color: Colors.white,)
                        ],
                      ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ),
    );
  }
}
