import 'package:flutter/material.dart';

class Exams extends StatelessWidget {
  const Exams({super.key});

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
          "25th, September 2023",
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
                        Text("GSE-221 General Studies",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("All Halls"),
                        Text("10:00am - 12:30pm")
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
          "28th, September 2023",
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
                        Text("CSC-222 System Design & Analysis",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("LT1-3"),
                        Text("11:15am - 02:15pm")
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
                        Text("MTH-221 Differential Equations",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("LT-1, TLH 1-6, 200LT"),
                        Text("02:30pm - 05:30pm")
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
          "3rd, October 2023",
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
                        Text("MTH-222 Linear Algebra 2",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("TLH 1-9"),
                        Text("11:15pm - 02:15pm")
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
          "4th, October 2023",
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
                        Text("CSC-223 Discrete Structures",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("TLH 1-4"),
                        Text("02:30pm - 05:30pm")
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