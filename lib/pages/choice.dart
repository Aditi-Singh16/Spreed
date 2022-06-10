import 'package:flutter/material.dart';
import 'package:spreed/pages/Create_mcq.dart';
import 'package:spreed/pages/Select_mcq.dart';

class choice extends StatelessWidget {
  String test_id;
  choice({required this.test_id, String});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              text: 'SPREED',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                letterSpacing: 0.0,
              ),
            ),
          ),
          backgroundColor: Colors.blue[600],
          elevation: 1.0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blueAccent,
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20)),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Create_mcq(test_id: test_id)));
                        },
                        child: const Text('Custom Test',
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                color: Colors.blueAccent,
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20)),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Select_mcq(test_id: test_id)));
                        },
                        child: const Text('Select Test',
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
