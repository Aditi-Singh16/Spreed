import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:spreed/pages/addQuestions.dart';
import 'package:spreed/services/database.dart';

class Create_mcq extends StatefulWidget {
  String test_id;

  Create_mcq({required this.test_id});

  @override
  State<Create_mcq> createState() => _Create_mcqState();
}

class _Create_mcqState extends State<Create_mcq> {
  late String Passage, mcq_id;
  final _formKey = GlobalKey<FormState>();
  DatabaseService databaseService = DatabaseService();
  TextEditingController _question = TextEditingController();
  TextEditingController _theme = TextEditingController();
  TextEditingController _level = TextEditingController();
  List<DropdownMenuItem<String>> questionItems = [
    DropdownMenuItem(child: Text("1"), value: "1"),
    DropdownMenuItem(child: Text("2"), value: "2"),
    DropdownMenuItem(child: Text("3"), value: "3"),
    DropdownMenuItem(child: Text("4"), value: "4"),
    DropdownMenuItem(child: Text("5"), value: "5"),
    DropdownMenuItem(child: Text("6"), value: "6"),
    DropdownMenuItem(child: Text("7"), value: "7"),
    DropdownMenuItem(child: Text("8"), value: "8"),
    DropdownMenuItem(child: Text("9"), value: "9"),
    DropdownMenuItem(child: Text("10"), value: "10"),
  ];
  List<DropdownMenuItem<String>> levelItems = [
    DropdownMenuItem(child: Text("Beginner"), value: "1"),
    DropdownMenuItem(child: Text("Intermediate"), value: "2"),
    DropdownMenuItem(child: Text("Advanced"), value: "3"),
  ];
  List<DropdownMenuItem<String>> themeItems = [
    DropdownMenuItem(child: Text("General"), value: "General"),
    DropdownMenuItem(child: Text("Historic"), value: "Historic"),
    DropdownMenuItem(child: Text("Geographic"), value: "Geographic"),
    DropdownMenuItem(child: Text("Science"), value: "Science"),
  ];
  createpassage() async {
    if (_formKey.currentState!.validate()) {
      mcq_id = randomAlphaNumeric(16);

      await databaseService
          .addPassageData(Passage, _theme.text, _level.text, mcq_id)
          .then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => addQuestions(
                    test_id: widget.test_id,
                    questions: _question.text,
                    mcq_id: mcq_id,
                    passage: Passage,
                    theme: _theme.text,
                    level: _level.text)));
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
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Text(
                        'Enter Passage',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      validator: (val) => val!.isEmpty ? "Enter Passage" : null,
                      onChanged: (val) {
                        Passage = val;
                      },
                      decoration:
                          InputDecoration(hintText: "Hello,Have a nice day!"),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Text(
                        'Select Theme',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            _theme.text = newValue!;
                          });
                        },
                        validator: (String? newValue) =>
                            newValue == null ? 'Theme' : null,
                        hint: Text('Theme',
                            style: TextStyle(color: Colors.black)),
                        // value: _division.text,
                        items: themeItems),
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Text(
                        'Select Level',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            _level.text = newValue!;
                          });
                        },
                        validator: (String? newValue) =>
                            newValue == null ? 'level' : null,
                        hint: Text('level',
                            style: TextStyle(color: Colors.black)),
                        // value: _division.text,
                        items: levelItems),
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Text(
                        'Select Number of Questions',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            _question.text = newValue!;
                          });
                        },
                        validator: (String? newValue) =>
                            newValue == null ? 'Question' : null,
                        hint: Text('Question',
                            style: TextStyle(color: Colors.black)),
                        // value: _division.text,
                        items: questionItems),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Text('Proceed'),
                          onPressed: () {
                            createpassage();
                          },
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ));
  }
}
