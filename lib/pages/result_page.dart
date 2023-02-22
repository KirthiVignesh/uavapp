import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    final storageRef = FirebaseStorage.instance.ref().child("$uid/result");
    final listResult = await storageRef.listAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Result")),
    );
  }
}
