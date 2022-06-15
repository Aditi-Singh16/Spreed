// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../read_passage.dart';

class proficiencySetting extends StatefulWidget {
  _proficiencySettingState createState() => _proficiencySettingState();
  static const routeName = '/proficiencySetting';
}

class _proficiencySettingState extends State<proficiencySetting> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Color(0xfff4e1e1)])),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                  right: 0,
                  top: 100), //apply padding to all four sides
              child: Text(
                "How proficient are you?",
                style: TextStyle(
                    //fontFamily: 'Nunito',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 15,
                  bottom: 70,
                  right: 20,
                  top: 05), //apply padding to some sides only
              child: Text(
                "We've got everyone covered",
                style: TextStyle(
                  //fontFamily: 'Nunito',
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: const Text("Beginner",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 47, right: 47),
                      primary: Color(0xff99c661),
                      onPrimary: Colors.white),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  child: const Text(
                    "Intermediate",
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 30, right: 30),
                      primary: const Color(0xffff5757),
                      onPrimary: Colors.white),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  child: const Text("Advance",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 47, right: 47),
                      primary: const Color(0xffff0065),
                      onPrimary: Colors.white),
                  onPressed: () {},
                ),
                SizedBox(height: 60),
                ElevatedButton(
                  child: const Text("I'm Ready",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 60, right: 60),
                      primary: Colors.white,
                      onPrimary: Color(0xffff0265)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => readingScreen()),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
