import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spreed/firebase_options.dart';
import 'package:spreed/pages/create_test.dart';
import 'package:spreed/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
      routes: {
        '/home': (context) => home(),
        '/create_test': (context) => Create_test(),
      },
    );
  }
}
