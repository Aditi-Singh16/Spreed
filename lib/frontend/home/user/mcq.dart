import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';
import 'package:spreed/backend/firebase_data.dart';

class ReadingTest extends StatefulWidget {
  const ReadingTest({Key? key}) : super(key: key);

  @override
  State<ReadingTest> createState() => _ReadingTestState();
}

class _ReadingTestState extends State<ReadingTest> {
  Map<String, dynamic> result = {};

  getQuestion() async {
    Map<String, dynamic> res = await FirebaseData().allQuestions();
    setState(() {
      result = res;
    });
  }

  @override
  void initState() {
    getQuestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConditionalQuestions(
          children: List<Question>.generate(result.length, (index) {
        return PolarQuestion(
          question: result['questions'][index]['question'],
          answers: List<String>.generate(
              result['questions'][index]['options'].length, (index) {
            return result['questions'][index]['options'][index];
          }),
          isMandatory: true,
        );
      })),
    );
  }
}
