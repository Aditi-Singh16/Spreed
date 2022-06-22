import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JobList extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobs"),
        leading: Icon(Icons.arrow_back),
        backgroundColor: Color(0xff265D80),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('Test').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 300,
                  child: Image.network(
                      "http://unblast.com/wp-content/uploads/2020/05/Job-Hunting-Illustration.jpg"),
                ),
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: snapshot.data!.docs.map((doc) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, top: 15),
                        child: Card(
                          color: Color(0xffD5EAEF),
                          child: ListTile(
                            leading: Icon(Icons.work,
                                size: 30, color: Color(0xff265D80)),
                            title: Text(doc.data()!['Company'],
                                style: TextStyle(
                                    color: Color(0xff265D80),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            subtitle: Text(doc.data()!['Description'],
                                style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
        },
      ),
    );
  }
}
