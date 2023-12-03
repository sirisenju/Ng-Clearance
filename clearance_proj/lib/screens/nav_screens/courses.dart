import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserCheckStatus extends StatefulWidget {
  const UserCheckStatus({super.key});

  @override
  State<UserCheckStatus> createState() => _UserCheckStatusState();
}

class _UserCheckStatusState extends State<UserCheckStatus> {
  //instance of the signed in user
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("All Document status"),
            Text("Note: on the left are the names of the document submitted and on the right is the status."),
            Text("Yellow: pending. Green: approved. Red: rejected"),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("user_documents").doc(user?.uid).collection("documents").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if(snapshot.hasData){
                    List<DocumentSnapshot> documentItems = snapshot.data!.docs;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: documentItems.length,
                        itemBuilder: (context, index){
                          var data = documentItems[index].data() as Map<String, dynamic>;
                          //checking status of documents
                          IconData trailingIcon;
                          Color iconColor;
                          if(data["status"] == "approved"){
                           trailingIcon = Icons.check_rounded;
                           iconColor = Colors.green;
                          }
                          else if(data["status"] == "pending"){
                            trailingIcon = Icons.pending_rounded;
                            iconColor = Colors.yellow;
                          }
                          else{
                            trailingIcon = Icons.cancel_outlined;
                            iconColor = Colors.red;
                          }

                          return ListTile(
                            title: Text("${data["filename"]}"),
                            trailing: Icon(trailingIcon, color: iconColor,),
                          );
                        }
                    );
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return Text("nothing found");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
