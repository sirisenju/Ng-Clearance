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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
              child: Text("All Document status",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
              child: Text("Note: on the left are the names of the document submitted and on the right is the status.",
                  style: TextStyle(fontSize: 16)
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
              child: Text("Orange: pending. Green: approved. Red: rejected",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
              ),
            ),
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
                            iconColor = Colors.orange;
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
                  return const Text("nothing found");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
