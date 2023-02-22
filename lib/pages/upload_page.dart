import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_remix/flutter_remix.dart';
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
                            'Directions to Use UAV app:\n\n1.Tap on the camera button to take a picture\n\n2.Select the last picture from the camera to upload the same picture.',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 22,
                                color: Colors.deepPurple[900]),
                          ),
                        ]),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CameraSelect())),
                child: Row(
                  children: [
                    Text("Camera",
                        style: TextStyle(
                          fontSize: 28,
                        )),
                    Icon(FlutterRemix.camera_lens_line),
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
