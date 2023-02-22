import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uavapp/pages/camera_ui.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //   image: AssetImage("images/bg.png"),
        //   fit: BoxFit.cover,
        // )),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              SizedBox(height: 40),
              // SizedBox(height: 10),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Container(
              //     height: 40,
              //     width: 110,
              //     color: Colors.white,
              //   ),
              // ),
              Text(
                'Welcome!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                _userDetails?['first_name'] == null
                    ? "User 👋"
                    : "${_userDetails?['first_name']} 👋",
                style: TextStyle(fontSize: 36),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                elevation: 5,
                child: Container(
                  color: Colors.deepPurple[100],
                  // height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Directions to Use UAV app:\n1.Tap on the camera button to take a picture\n2.Select the last picture from the camera to upload the same picture.',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 22,
                                color: Colors.deepPurple[900]),
                          ),
                          Text(
                            '\n-Dolly Parton',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple[900]),
                          ),
                        ]),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Evaluate yourself ✅",
                  style: TextStyle(
                    fontSize: 28,
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 125,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                settings: RouteSettings(name: "/WelcomeScreen"),
                                builder: (context) => WelcomeScreen(),
                              ));
                            },
                            child: Text(
                              'Anxiety Test',
                              style: TextStyle(fontSize: 15),
                            )),
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
