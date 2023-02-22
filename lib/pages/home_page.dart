// ignore_for_file: prefer_const_constructors

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:uavapp/pages/result_page.dart';
import 'package:uavapp/pages/upload_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  // ignore: prefer_final_fields
  List<Widget> _widgetOptions = <Widget>[UploadPage(), ResultPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            padding: const EdgeInsets.all(16),
            iconSize: 22,
            color: Colors.black,
            activeColor: Colors.white,
            backgroundColor: Colors.white,
            // tabMargin: EdgeInsets.symmetric(vertical: 3),
            tabBackgroundGradient: Gradient.lerp(
              LinearGradient(colors: [Colors.indigo, Colors.deepPurple]),
              LinearGradient(colors: [Colors.indigo, Colors.deepPurple]),
              45,
            ),
            gap: 2,
            tabs: const [
              GButton(
                  icon: FlutterRemix.upload_cloud_2_line,
                  text: 'Home',
                  textColor: Colors.white),
              GButton(
                icon: FlutterRemix.survey_line,
                text: 'Result',
              ),
              // GButton(
              //   icon: FlutterRemix.add_line,
              // ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
