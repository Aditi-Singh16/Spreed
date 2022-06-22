import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _MyAppState();
}

class _MyAppState extends State<Result> {

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const ResultPage(),
    );
  }
}

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  final CollectionReference _result = FirebaseFirestore.instance.collection('result');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(65.0), // here the desired height
            child: AppBar(
              title: Container(
                margin: EdgeInsets.fromLTRB(13, 16, 0, 0),
                child: Text("Participant" ,
                  style: TextStyle(fontFamily: 'Nunito', fontSize: 23, fontWeight: FontWeight.w700),),
              ),
              backgroundColor: Color(0xfff58cc02),
            )
        ),
        body: StreamBuilder(
          stream: _result.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
            if(streamSnapshot.hasData){
              return ListView.builder(itemCount: streamSnapshot.data!.docs.length,

                  itemBuilder: (context, index){
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                    return Card (
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey.shade300, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child:
                        ListTile(
                          trailing: Icon(Icons.open_in_new_outlined),
                          title: Text(documentSnapshot['name'] , style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold)),
                          subtitle: Text(documentSnapshot['email'].toString()),
                          onTap: (){

                          },
                        )
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
    );
  }
}
