import 'package:flutter/material.dart';

class Assessments extends StatelessWidget {
  const Assessments({super.key});

  @override
  Widget build(BuildContext context) {

    //size of the device
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          "27, September 2023",
          style: TextStyle(
              fontSize: 16
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 7),
          child: Container(
            height: screenHeight / 8,
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: const Row(
              children: [
                VerticalDivider(
                  width: 30,
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 2,
                  color: Colors.orange,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("CSC-221 Intro to computer programming",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("Project 2: Chapter 3 presentation."),
                        Text("Due 12:00pm")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_right),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 7),
          child: Container(
            height: screenHeight / 8,
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: const Row(
              children: [
                VerticalDivider(
                  width: 30,
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 2,
                  color: Colors.orange,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("CSC-221 Intro to computer programming",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("Project 2: Chapter 3 presentation."),
                        Text("Due 12:00pm")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_right),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "2nd, October 2023",
          style: TextStyle(
              fontSize: 16
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 7),
          child: Container(
            height: screenHeight / 8,
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: const Row(
              children: [
                VerticalDivider(
                  width: 30,
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 2,
                  color: Colors.orange,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("CSC-221 Intro to computer programming",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("Project 2: Chapter 3 presentation."),
                        Text("Due 12:00pm")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_right),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 7),
          child: Container(
            height: screenHeight / 8,
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: const Row(
              children: [
                VerticalDivider(
                  width: 30,
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 2,
                  color: Colors.orange,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("CSC-221 Intro to computer programming",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("Project 2: Chapter 3 presentation."),
                        Text("Due 12:00pm")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_right),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}