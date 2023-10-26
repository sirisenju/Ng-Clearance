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
        bottomSheet: Container(
          height: 230,
          width:  screenWidth,
          decoration: const BoxDecoration(
              color: Colors.teal,
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
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink,
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
                      child: const Text("Log in",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      GestureDetector(
                        child: const Text("Login as Admin", style: TextStyle(
                          fontSize: 20
                        ),),
                        onTap: (){
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
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ),
    );
  }
}
