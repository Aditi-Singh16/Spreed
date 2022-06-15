// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
//import 'read_passage.dart';
import 'language.dart';

class GameSettings extends StatefulWidget {
  _GameSettingsState createState() => _GameSettingsState();
  static const routeName = '/gameSetting';
}

class _GameSettingsState extends State<GameSettings> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 243, 218, 218)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "What's your Genre?",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Choose a category that interests you the most!",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 64,
                              height: 64,
                              child: Image.network(
                                  "https://img.icons8.com/external-flaticons-lineal-color-flat-icons/64/undefined/external-fiction-literature-flaticons-lineal-color-flat-icons-3.png")),
                          Container(
                            child: Text(
                              "Fiction",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 64,
                              height: 64,
                              child: Image.network(
                                  "https://img.icons8.com/color/64/undefined/comedy.png")),
                          Container(
                            child: Text(
                              "Comedy",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 64,
                              height: 64,
                              child: Image.network(
                                  "https://img.icons8.com/external-flaticons-flat-flat-icons/64/undefined/external-history-history-flaticons-flat-flat-icons-6.png")),
                          Container(
                            child: Text(
                              "History",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 64,
                              height: 64,
                              child: Image.network(
                                  "https://img.icons8.com/external-bzzricon-flat-bzzricon-studio/64/undefined/external-couple-valentines-day-bzzricon-flat-bzzricon-flat-bzzricon-studio.png")),
                          Container(
                            child: Text(
                              "Romance",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 64,
                              height: 64,
                              child: Image.network(
                                  "https://img.icons8.com/fluency/64/undefined/horror.png")),
                          Container(
                            child: Text(
                              "Thriller",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 64,
                              height: 64,
                              child: Image.network(
                                  "https://img.icons8.com/external-dreamcreateicons-flat-dreamcreateicons/64/undefined/external-skull-halloween-dreamcreateicons-flat-dreamcreateicons.png")),
                          Container(
                            child: Text(
                              "Horror",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => languageSetting()),
            );
          },
          child: const Icon(Icons.arrow_forward_rounded),
          backgroundColor: Color(0xffff0065),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
