import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({super.key});
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
          "El'Grande (SUG Week)",
          style: TextStyle(
              fontSize: 16
          ),
        ),
        const Text(
          "18th, September 2023",
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
                        Text("FAWA Dinner Night",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("4pm prompt")
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
          "19th, September 2023",
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
                        Text("NASS Dinner Night",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("4pm prompt")
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
          "20th, September 2023",
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
                        Text("Old School Night",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("4pm prompt")
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
          "21st, September 2023",
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
                        Text("Bon Fire Night",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("4pm prompt")
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
