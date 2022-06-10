import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:spreed/pages/choice.dart';
import 'package:spreed/services/database.dart';

class Create_test extends StatefulWidget {
  @override
  State<Create_test> createState() => _Create_testState();
}

class _Create_testState extends State<Create_test> {
  final _formKey = GlobalKey<FormState>();
  String recruiter_id = "zjRF1fFYmAu2XCsnMpZW";
  DatabaseService databaseService = DatabaseService();
  late String TestName, Company, Description, test_id;
  bool loading = false;
  createcustomquiz() async {
    if (_formKey.currentState!.validate()) {
      // setState(() {
      //   loading = true;
      // });
      test_id = randomAlphaNumeric(16);

      await databaseService
          .addTestData(Company, Description, TestName, test_id, recruiter_id)
          .then((value) {
        // setState() {
        //   loading = false;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => choice(test_id: test_id)));
        // }
      });
    }
  }

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
        body: Form(
          key: _formKey,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TextFormField(
                    validator: (val) => val!.isEmpty ? "Enter Test Name" : null,
                    onChanged: (val) {
                      TestName = val;
                    },
                    decoration: InputDecoration(hintText: "Enter Test Name"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? "Enter Company Name" : null,
                    onChanged: (val) {
                      Company = val;
                    },
                    decoration: InputDecoration(hintText: "Enter Company Name"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? "Enter Description" : null,
                    onChanged: (val) {
                      Description = val;
                    },
                    decoration: InputDecoration(hintText: "Enter Description"),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  ElevatedButton(
                    child: Text('Proceed'),
                    onPressed: () {
                      createcustomquiz();
                    },
                  ),
                ],
              )),
        ));
  }
}
