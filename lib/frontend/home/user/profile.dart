// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:spreed/frontend/home/user/profile_insights_tab.dart';
import 'package:spreed/frontend/home/user/profile_leaderboard_tab.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.logout_outlined),
              )
            ],
            bottom: TabBar(  
            tabs: [  
                Tab(
                  icon: Icon(
                    Icons.star
                  ),
                  text: "Insights",
                ),  
                Tab(
                  icon: Icon(Icons.leaderboard),
                  text:"Leaderboard"
                ),  
              ],
            ),
          ),
          
          body:TabBarView(  
                children: [  
                  UserProfileInsightsTab(),
                  LeaderboardTab()
                ],  
              ),  
        ),
      ),
    );
  }
}
