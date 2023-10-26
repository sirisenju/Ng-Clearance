import 'package:flutter/material.dart';

//Display error message
void displayMessageToUser(String message, BuildContext context){
  showDialog(context: context, builder: (context) =>
      AlertDialog(
        title: Text(message),
      )
  );
}