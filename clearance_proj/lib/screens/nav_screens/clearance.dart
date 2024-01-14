import 'package:clearance_proj/screens/clearancePages/acedemic-division.dart';
import 'package:clearance_proj/screens/clearancePages/bursary.dart';
import 'package:clearance_proj/screens/clearancePages/collage.dart';
import 'package:clearance_proj/screens/clearancePages/departmental.dart';
import 'package:clearance_proj/screens/clearancePages/health-center.dart';
import 'package:clearance_proj/screens/clearancePages/library.dart';
import 'package:clearance_proj/screens/clearancePages/security.dart';
import 'package:clearance_proj/screens/clearancePages/sport.dart';
import 'package:clearance_proj/screens/clearancePages/student-affairs.dart';
import 'package:flutter/material.dart';

class ClearancePage extends StatefulWidget {
  const ClearancePage({super.key});

  @override
  State<ClearancePage> createState() => _ClearancePageState();
}

class _ClearancePageState extends State<ClearancePage> {
  //creating list
  List<String> clearanceTypes = [
    "Departmental Clearance",
    "College Clearance",
    "Bursary Clearance",
    "Library Clearance",
    "Health Center Clearance",
    "Sport Division Clearance",
    "Security Clearance",
    "Academic Division Clearance",
    "Student Affairs Clearance",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                  child: Text("Clearance page",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: clearanceTypes.length,
                    itemBuilder: (context, index){
                  String item = clearanceTypes[index];
                  //switch case
                  switch(item){
                    case "Departmental Clearance":
                      return ListTile(
                        title: Text(item,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DepartmentClearance()),
                          );
                        },
                      );
                    case "College Clearance":
                      return ListTile(
                        title: Text(item,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CollageClearance()),
                          );
                        },
                      );
                    case "Bursary Clearance":
                      return ListTile(
                        title: Text(item,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BursaryClearance()),
                          );
                        },
                      );
                    case "Library Clearance":
                      return ListTile(
                        title: Text(item,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LibraryClearance()),
                          );
                        },
                      );
                    case "Health Center Clearance":
                      return ListTile(
                        title: Text(item,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HealthCenterClearance()),
                          );
                        },
                      );
                    case "Sport Division Clearance":
                      return ListTile(
                        title: Text(item,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SportClearance()),
                          );
                        },
                      );
                    case "Security Clearance":
                      return ListTile(
                        title: Text(item,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SecurityClearance()),
                          );
                        },
                      );
                    case "Academic Division Clearance":
                      return ListTile(
                        title: Text(item,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AcademicClearance()),
                          );
                        },
                      );
                    case "Student Affairs Clearance":
                      return ListTile(
                        title: Text(item,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const StudentAffairsClearance()),
                          );
                        },
                      );
                  }
                  return null;
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
