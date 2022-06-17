// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class UserProfileInsightsTab extends StatelessWidget {
  const UserProfileInsightsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1595433707802-6b2626ef1c91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8a2l0dGVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')),
              ),
              Text(
                'Hi Tom',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('user')
                      .doc('FhJxNc1dneUdRfbC3Qzx')
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, left: 20.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.local_fire_department_sharp,
                                        color: Colors.orange, size: 30.0),
                                    Text('${snapshot.data['streak']} days',
                                        style: TextStyle(fontSize: 20))
                                  ],
                                ),
                                Divider(),
                                Row(children: [
                                  SvgPicture.asset('assets/icons/trophy.svg',
                                      width: 40.0, height: 40.0),
                                  Text('Best Score',
                                      style: TextStyle(fontSize: 25)),
                                  Spacer(),
                                  Text('${snapshot.data['top_score']} words/min',
                                      style: TextStyle(fontSize: 20))
                                ]),
                                SizedBox(height: MediaQuery.of(context).size.height*0.03),
                                Row(
                                  children: [
                                  SvgPicture.asset('assets/icons/jobs.svg',
                                      width: 40.0, height: 40.0),
                                  SizedBox(width: 10),
                                  Text('Jobs Applied',
                                      style: TextStyle(fontSize: 25)),
                                ]
                              ),
                              SizedBox(height:MediaQuery.of(context).size.height*0.015),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: MediaQuery.of(context).size.height * 0.2,
                                child: ListView.builder(
                                itemCount:
                                    snapshot.data['jobs_applied'].length,
                                itemBuilder: (context, i) {
                                  return Card(
                                    child: ListTile(
                                      title: Text('${snapshot.data['jobs_applied'][i]['company']}'),
                                      subtitle: Text('${snapshot.data['jobs_applied'][i]['test_date']}'),
                                      trailing: Icon(Icons.more_vert),
                                    ),
                                  );
                                })
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                              Row(children: [
                                  SvgPicture.asset('assets/icons/goal.svg',
                                      width: 40.0, height: 40.0),
                                  Text('Daily Todos',
                                      style: TextStyle(fontSize: 25)),
                                ]),
                                SizedBox(height: MediaQuery.of(context).size.height*0.015),
                                
                              ],
                            ),
                          );
                        case ConnectionState.done:
                          return Container();
                      }
                    }
                  }
                )
            ],
          ),
    );
  }
}
