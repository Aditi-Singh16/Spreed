import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spreed/pages/home.dart';

class viewquiz extends StatelessWidget {
  // List questions;
  String mcq_id, test_id;
  viewquiz({required this.test_id, required this.mcq_id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: 'SPREED',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              letterSpacing: 0.0,
            ),
          ),
        ),
        backgroundColor: Colors.blue[600],
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Passage"),
          Text("Questions"),
          Text("Answers"),
          ElevatedButton(
            child: Text('Ok'),
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection("Test")
                  .doc(test_id)
                  .update({
                'mcq_id': mcq_id,
              });
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => home(),
              ));
            },
          )
        ],
      ),
    );
  }
}
