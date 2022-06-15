import 'package:flutter/material.dart';
import 'proficiency.dart';

class languageSetting extends StatefulWidget {
  _languageSettingState createState() => _languageSettingState();
  static const routeName = '/languageSetting';
}

class _languageSettingState extends State<languageSetting> {
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
                  colors: [Colors.white, Color(0xfff3dede)])),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 10.0),
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.only(
                  left: 20,
                  bottom: 10,
                  right: 20,
                  top: 100), //apply padding to all four sides
              child: Text(
                "Choose a language",
                style: TextStyle(
                    // fontFamily: 'Nunito',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 50,
                  bottom: 0,
                  right: 50,
                  top: 05), //apply padding to some sides only
              child: Text(
                "Choose the language that ",
                style: TextStyle(
                  // fontFamily: 'Nunito',
                  fontSize: 15,
                  //fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 0,
                  bottom: 50,
                  right: 0,
                  top: 0), //apply padding to some sides only
              child: Text(
                "vibes with you !",
                style: TextStyle(
                  // fontFamily: 'Nunito',
                  fontSize: 15,
                  //fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text("Hindi"),
                  style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      minimumSize: const Size(100, 75),
                      maximumSize: const Size(200, 85),
                      primary: const Color(0xfff49c8e),
                      onPrimary: Colors.black),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: const Text("English"),
                  style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      minimumSize: const Size(100, 75),
                      maximumSize: const Size(200, 85),
                      primary: const Color(0xfff49c8e),
                      onPrimary: Colors.black),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              //Use of SizedBox
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text("Marathi"),
                  style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      minimumSize: const Size(100, 75),
                      maximumSize: const Size(200, 85),
                      primary: const Color(0xfff49c8e),
                      onPrimary: Colors.black),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: const Text("Gujarati"),
                  style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      minimumSize: const Size(100, 75),
                      maximumSize: const Size(200, 85),
                      primary: const Color(0xfff49c8e),
                      onPrimary: Colors.black),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/earth.png",
              width: 150,
              height: 150,
            )
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => proficiencySetting()),
          );
        },
        child: const Icon(Icons.arrow_forward_rounded),
        backgroundColor: Color(0xffff0065),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
