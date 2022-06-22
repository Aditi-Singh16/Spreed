// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LeaderboardTab extends StatelessWidget {
  const LeaderboardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .where('type', isEqualTo: 'user')
            .orderBy('top_score', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('something went wrong');
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Column(
                  children: <Widget>[
                    Icon(
                      Icons.info,
                      color: Colors.blue,
                      size: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('No connection'),
                    )
                  ],
                );
              case ConnectionState.waiting:
                return SpinKitChasingDots(
                  color: Colors.pink,
                  size: 50.0,
                );
              case ConnectionState.active:
                if (snapshot.hasData) {
                  return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                            color: Colors.blue
                                                .withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(
                                                20) // use instead of BorderRadius.all(Radius.circular(20))
                                            ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20.0,
                                        child: Text('${i+1}'),
                                      ),
                                      Spacer(),
                                      Text('${snapshot.data!.docs[i]['name']}'),
                                      Spacer(),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue.shade500
                                                  .withOpacity(0.5),
                                              borderRadius: BorderRadius.circular(
                                                  20) // use instead of BorderRadius.all(Radius.circular(20))
                                              ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text('${snapshot.data!.docs[i]['top_score']}'),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                } else {
                  return Container();
                }
              case ConnectionState.done:
                return Container();
            }
          }
        });
  }
}
