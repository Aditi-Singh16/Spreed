import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseData {
  Future allQuestions() async {
    var res = await FirebaseFirestore.instance
        .collection("MCQ")
        .doc("gdyedUNcUNTTql304GJT")
        .get();

    return res.data();
  }
  //write crud operations here
}
