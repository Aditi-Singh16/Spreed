// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
//import 'read_passage.dart';

class readingScreen extends StatefulWidget {
  _readingScreenState createState() => _readingScreenState();
  static const routeName = '/readingScreen';
}

class _readingScreenState extends State<readingScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String title = "Title here";
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(15),
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                  right: 0,
                  top: 50), //apply padding to all four sides
              child: Text(
                title,
                style: TextStyle(
                    //fontFamily: 'Nunito',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 560,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 240, 196, 196)
                  ])),
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Text(
                  "Flamingos are highly gregarious birds. Flocks numbering in the hundreds may be seen in long, curving flight formations and in wading groups along the shore. On some of East Africa’s large lakes, more than a million lesser flamingos (Phoeniconaias minor) gather during the breeding season. In flight, flamingos present a striking and beautiful sight, with legs and neck stretched out straight, looking like white and rosy crosses with black arms. No less interesting is the flock at rest, with their long necks twisted or coiled upon the body in any conceivable position. Flamingos are often seen standing on one leg. Various reasons for this habit have been suggested, such as regulation of body temperature, conservation of energy, or merely to dry out the legs. The nest is a truncated cone of muddy clay piled up a few inches in a shallow lagoon; both parents share the monthlong incubation of the one or two chalky-white eggs that are laid in the hollow of the cone. Downy white young leave the nest in two or three days and are fed by regurgitation of partly digested food by the adults. Subadults are whitish, acquiring the pink plumage with age.To feed, flamingos tramp the shallows, head down and bill underwater, stirring up organic matter with their webbed feet. They eat various types of food, including diatoms, algae, blue-green algae, and invertebrates such as minute mollusks and crustaceans. While the head swings from side to side, food is strained from the muddy water with small comblike structures inside the bill. The bird’s pink colour comes from its food, which contains carotenoid pigments. The diet of flamingos kept in zoos is sometimes supplemented with food colouring to keep their plumage from fading.",
                  style: TextStyle(fontSize: 17),
                ),
                // for Vertical scrolling
                scrollDirection: Axis.vertical,
              ),
            ),
          ]),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.arrow_forward_rounded),
          backgroundColor: Color(0xffff0065),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
