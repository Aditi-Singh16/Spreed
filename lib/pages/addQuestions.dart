import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spreed/pages/home.dart';
import 'package:spreed/services/database.dart';

class addQuestions extends StatefulWidget {
  String test_id, questions, mcq_id, passage, theme, level;

  addQuestions(
      {required this.test_id,
      required this.questions,
      required this.mcq_id,
      required this.passage,
      required this.level,
      required this.theme});
  @override
  State<addQuestions> createState() => _addQuestionsState(
      test_id: test_id, questions: questions, mcq_id: mcq_id);
}

class _addQuestionsState extends State<addQuestions> {
  final _formKey = GlobalKey<FormState>();
  String test_id, questions, mcq_id;
  _addQuestionsState(
      {required this.test_id, required this.questions, required this.mcq_id});

  String recruiter_id = "zjRF1fFYmAu2XCsnMpZW";
  DatabaseService databaseService = DatabaseService();
  List questionss = [];
  bool loading = false;
  TextEditingController _correct = TextEditingController();
  List<DropdownMenuItem<String>> correctItems = [
    DropdownMenuItem(child: Text("1"), value: "1"),
    DropdownMenuItem(child: Text("2"), value: "2"),
    DropdownMenuItem(child: Text("3"), value: "3"),
    DropdownMenuItem(child: Text("4"), value: "4"),
  ];
  List<String> opt = ['', '', '', ''];
  late String quest;
  createquestion() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection("Test").doc(test_id).update({
        'mcq_id': mcq_id,
      });
      await databaseService
          .addquestionData(questionss, widget.mcq_id, widget.passage,
              widget.theme, widget.level)
          .then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => home()));
      });
    }
  }

  @override
  void initState() {
    //  for (int i = 1; i <= int.parse(questions); i++) {
    //    questionss.add(QuestionLists(
    //      id: i, question: '', options: ['', '', '', ''], correct: 0));
    // }
    for (int i = 1; i <= int.parse(questions); i++) {
      questionss.add({
        'question': '',
        'options': ['', '', '', ''],
        'correct': 0
      });
    }
    print(questionss[0]);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: questionss.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                                key: ObjectKey(questionss[index]),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0, bottom: 5.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Question ',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          Text(
                                            "${index + 1}",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextFormField(
                                      validator: (val) => val!.isEmpty
                                          ? "Enter question"
                                          : null,
                                      onChanged: (val) {
                                        quest = val;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Enter Question"),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    TextFormField(
                                      validator: (val) => val!.isEmpty
                                          ? "Enter option 1"
                                          : null,
                                      onChanged: (val) {
                                        opt[0] = val;
                                      },
                                      decoration:
                                          InputDecoration(hintText: "Option 1"),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    TextFormField(
                                      validator: (val) => val!.isEmpty
                                          ? "Enter option 2"
                                          : null,
                                      onChanged: (val) {
                                        opt[1] = val;
                                      },
                                      decoration:
                                          InputDecoration(hintText: "Option 2"),
                                    ),
                                    TextFormField(
                                      validator: (val) => val!.isEmpty
                                          ? "Enter option 3"
                                          : null,
                                      onChanged: (val) {
                                        opt[2] = val;
                                      },
                                      decoration:
                                          InputDecoration(hintText: "Option 3"),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    TextFormField(
                                      validator: (val) => val!.isEmpty
                                          ? "Enter option 4"
                                          : null,
                                      onChanged: (val) {
                                        opt[3] = val;
                                        questionss[index]['options'] = opt;
                                      },
                                      decoration:
                                          InputDecoration(hintText: "Option 4"),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.0, bottom: 5.0),
                                          child: Text(
                                            'Select Correct option',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    DropdownButtonFormField(
                                        dropdownColor: Colors.white,
                                        isExpanded: true,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            questionss[index]['correct'] =
                                                int.parse(newValue!);
                                            questionss[index]['options'] = opt;
                                            questionss[index]['question'] =
                                                quest;
                                          });
                                        },
                                        validator: (String? newValue) =>
                                            newValue == null
                                                ? 'correct option'
                                                : null,
                                        hint: Text('Option number ',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        // value: _division.text,
                                        items: correctItems),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ));
                          })),
                ),
                SizedBox(
                  height: 50.0,
                ),
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    createquestion();
                  },
                ),
              ],
            ),
          )),
    );
  }
}

class QuestionLists {
  late int? id;
  late String? question;
  late List<String>? options;
  late int? correct;

  QuestionLists({this.id, this.question, this.options, this.correct});
}
