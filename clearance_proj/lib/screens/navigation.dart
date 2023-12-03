import 'package:clearance_proj/screens/home.dart';
import 'package:clearance_proj/screens/nav_screens/clearance.dart';
import 'package:clearance_proj/screens/nav_screens/courses.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}


class _NavigationState extends State<Navigation> {
  //page index above build context
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: <Widget>[
        const HomePage(),
        const ClearancePage(),
        const UserCheckStatus()
      ] [_currentIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedIndex: _currentIndex,
        destinations: const <Widget>[
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.support_agent_rounded), label: "Clearance"),
          NavigationDestination(
              icon: Icon(Icons.library_add_check_outlined), label: "Status"),
        ],
      )
    );
  }
}
