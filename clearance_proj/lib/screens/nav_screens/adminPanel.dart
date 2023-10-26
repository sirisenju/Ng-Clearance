import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: SafeArea(
        child: Column(
          children: [
            Text("Admin panel", style: TextStyle(
              fontSize: 26
            ),)
          ],
        ),
      ),
    );
  }
}
