import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spreed/pages/home.dart';
import 'package:spreed/pages/viewquiz.dart';

final mydoc = FirebaseFirestore.instance.collection('MCQ');

class Select_mcq extends StatefulWidget {
  String test_id;
  Select_mcq({required this.test_id});

  @override
  State<Select_mcq> createState() => _Select_mcqState();
}

class _Select_mcqState extends State<Select_mcq> {
  @override
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
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('MCQ').snapshots(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot mcq = snapshot.data!.docs[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => viewquiz(
                              test_id: widget.test_id, mcq_id: mcq['mcq_id']),
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.all(15.0),
                        padding: EdgeInsets.all(17.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(
                                0,
                                3,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 0.2,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Quiz ${index + 1}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Theme -',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '${mcq["Theme"]}  ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Level -',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '${mcq["level"]}  ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Icon(Icons.info_outline_rounded)
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
