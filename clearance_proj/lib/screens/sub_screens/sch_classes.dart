import 'package:flutter/material.dart';

class SchClasses extends StatelessWidget {
  const SchClasses({super.key});
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
          "9th, September 2023",
          style: TextStyle(
              fontSize: 16
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 7),
          child: Container(
            height: screenHeight / 10,
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.indigoAccent[200],
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: const Row(
              children: [
                VerticalDivider(
                  width: 30,
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 2,
                  color: Colors.white,
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
                              fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),),
                        Text("8:00am - 10:00am", style: TextStyle(color: Colors.white,),)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_right, color: Colors.white,),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 7),
          child: Container(
            height: screenHeight / 10,
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.indigoAccent[200],
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: const Row(
              children: [
                VerticalDivider(
                  width: 30,
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 2,
                  color: Colors.white,
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
                              fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),),
                        Text("8:00am - 10:00am", style: TextStyle(color: Colors.white,),)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_right, color: Colors.white,),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 7),
          child: Container(
            height: screenHeight / 10,
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.indigoAccent[200],
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: const Row(
              children: [
                VerticalDivider(
                  width: 30,
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 2,
                  color: Colors.white,
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
                              fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),),
                        Text("8:00am - 10:00am", style: TextStyle(color: Colors.white,),)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_right, color: Colors.white,),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "10th, September 2023",
          style: TextStyle(
              fontSize: 16
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 7),
          child: Container(
            height: screenHeight / 10,
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.indigoAccent[200],
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: const Row(
              children: [
                VerticalDivider(
                  width: 30,
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 2,
                  color: Colors.white,
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
                              fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),),
                        Text("8:00am - 10:00am", style: TextStyle(color: Colors.white,),)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_right, color: Colors.white,),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 7),
          child: Container(
            height: screenHeight / 10,
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.indigoAccent,
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: const Row(
              children: [
                VerticalDivider(
                  width: 30,
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 2,
                  color: Colors.white,
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
                              fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),),
                        Text("8:00am - 10:00am", style: TextStyle(color: Colors.white,),)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_right, color: Colors.white,),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}