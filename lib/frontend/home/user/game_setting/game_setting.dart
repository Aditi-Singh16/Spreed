import 'package:flutter/material.dart';
//import 'screens/home_screen.dart';
import 'genre.dart';

void main() => runApp(MyApp());
void submit() {}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: GameSettings(),
      routes: {
        //SignupScreen.routeName: (ctx) => SignupScreen(),
        GameSettings.routeName: (ctx) => GameSettings(),
        //HomeScreen.routeName: (ctx) => HomeScreen(),
      },
    );
  }
}
