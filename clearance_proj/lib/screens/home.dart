import 'package:clearance_proj/screens/sub_screens/assessments.dart';
import 'package:clearance_proj/screens/sub_screens/events.dart';
import 'package:clearance_proj/screens/sub_screens/exams.dart';
import 'package:clearance_proj/screens/sub_screens/sch_classes.dart';
import 'package:clearance_proj/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //instance of the signed in user
  final user = FirebaseAuth.instance.currentUser;


  _HomePageState createState() => _HomePageState();
  int selectedPageIndex = 0; // Initialize with the default page index

  void handleButtonTap(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  //handle logout
  void logoutUser(){
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(
        builder: (context) => const Welcome()));
  }

  @override
  Widget build(BuildContext context) {
    //size of the device
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              alignment: Alignment.center,
              icon: const Icon(
                Icons.logout,
                size: 30,
              ),
              onPressed: () {
                //icon on pressed
                logoutUser();
              },
            )
          ],
          title: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/checklist3.jpg"),
                  radius: 30,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hi,",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "John Travolta",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 230,
                  child: Text(
                    "Check all your courses information here.",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Today, 8th September 2023",
                          style: TextStyle(fontSize: 17),
                        ),
                        Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.blue[300],
                                borderRadius: BorderRadius.circular(10.0)),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Center(
                                  child: Text(
                                "Calender",
                                style: TextStyle(fontSize: 15),
                              )),
                            )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Upcoming.....",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                return handleButtonTap(0);
                                //event
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: selectedPageIndex == 0 ? Colors.blue : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                  child: Text(
                                    "Classes",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                return handleButtonTap(1);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: selectedPageIndex == 1 ? Colors.orangeAccent : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Text(
                                    "Assessments",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                return handleButtonTap(2);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: selectedPageIndex == 2 ? Colors.green : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                  child: Text(
                                    "Exams",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                return handleButtonTap(3);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: selectedPageIndex == 3 ? Colors.cyanAccent : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                  child: Text(
                                    "Events",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                // Content Section (Changes based on button click)
                SizedBox(
                  height: screenHeight,
                  child: SingleChildScrollView(
                      child: buildContext()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContext() {
    switch(selectedPageIndex){
      case 0:
        return const Sch_Classes();
      case 1:
        return const Assessments();
      case 2:
        return const Exams();
      case 3:
        return const Events();
      default:
        return const DefaultPageContent();
    }
  }
}

//default screen
class DefaultPageContent extends StatelessWidget {
  const DefaultPageContent({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Select a page to view content.'),
    );
  }
}
