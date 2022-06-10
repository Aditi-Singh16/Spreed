import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<void> addTestData(String Company, String Description, String Name,
      String test_id, String recruiter_id) async {
    await FirebaseFirestore.instance.collection("Test").doc(test_id).set({
      'Company': Company,
      'Description': Description,
      'Name': Name,
      'Test_id': test_id,
      'mcq_id': '',
      'recruiter_id': recruiter_id
    });
    catchError(e) {
      print(e.toString());
    }
  }

  Future<void> addPassageData(
      String Passage, String theme, String level, String mcq_id) async {
    await FirebaseFirestore.instance.collection("MCQ").doc(mcq_id).set({
      'Passage': Passage,
      'Theme': theme,
      'level': level,
    });
    catchError(e) {
      print(e.toString());
    }
  }

  Future<void> addquestionData(List questions, String mcq_id, String passage,
      String theme, String level) async {
    print(questions[0]);
    await FirebaseFirestore.instance.collection("MCQ").doc(mcq_id).set({
      'questions': questions,
      'Passage': passage,
      'Theme': theme,
      'level': level,
      'mcq_id': mcq_id
    });
    catchError(e) {
      print(e.toString());
    }
  }
}
