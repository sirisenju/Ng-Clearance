import 'package:clearance_proj/screens/sub_screens/assessments.dart';
import 'package:clearance_proj/screens/sub_screens/events.dart';
import 'package:clearance_proj/screens/sub_screens/exams.dart';
import 'package:clearance_proj/screens/sub_screens/sch_classes.dart';
import 'package:clearance_proj/screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          toolbarHeight: 60,
          backgroundColor: Colors.indigoAccent[200],
          automaticallyImplyLeading: false,
          leading: const Padding(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/checklist3.jpg"),
              radius: 140.0,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                alignment: Alignment.center,
                icon: const Icon(
                  Icons.logout,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  //icon on pressed
                  logoutUser();
                },
              ),
            )
          ],
          title: FutureBuilder(
              future: getUserName(user!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting){
                  // Display a loading indicator while fetching data
                  return const CircularProgressIndicator();
                }
                else if (snapshot.hasError) {
                  // Display an error message if an error occurs or the user is not found
                  return const Text('Error');
                }
                else if(snapshot.hasData){
                  //access the name and mat-number field
                  String firstname = snapshot.data!['firstName'];
                  String matNumber = snapshot.data!['matNumber'];

                  //display them for view
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(firstname, style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        color: Colors.white
                      ),),
                      Text(matNumber, style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                          color: Colors.white
                      ),),
                    ],
                  );
                }
                else {
                  // display user not found
                  return const Text("User not found.");
                }
              }
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

  Future<Map<String, dynamic>?> getUserName(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(documentId).get();

      if (documentSnapshot.exists) {
        String? userName = documentSnapshot.get('firstName');
        String? matNo = documentSnapshot.get('matNumber');
        return {'firstName': userName, 'matNumber': matNo};
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Widget buildContext() {
    switch(selectedPageIndex){
      case 0:
        return const SchClasses();
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
