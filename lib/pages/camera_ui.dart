import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:better_open_file/better_open_file.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraSelect extends StatefulWidget {
  const CameraSelect({super.key});

  @override
  State<CameraSelect> createState() => _CameraSelectState();
}

class _CameraSelectState extends State<CameraSelect> {
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  var SuccBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Upload Successful',
      message: 'The photo selected is uploaded successfully',
      contentType: ContentType.success,
    ),
  );
  var ErrorBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'An Error Occurred',
      message:
          'Upload Error.\nPlease try Again with the correct permission/credentials/file',
      contentType: ContentType.failure,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photo(
          pathBuilder: () async {
            final Directory extDir = await getTemporaryDirectory();
            final testDir =
                await Directory('${extDir.path}/test').create(recursive: true);
            return '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
          },
        ),
        onMediaTap: (mediaCapture) async {
          // OpenFile.open(mediaCapture.filePath);
          File file = File(mediaCapture.filePath);
          String st = DateTime.now().toIso8601String();
          try {
            await FirebaseStorage.instance.ref('$uid/upload/$st').putFile(file);
            ScaffoldMessenger.of(context).showSnackBar(SuccBar);
            Navigator.of(context).pop();
          } catch (error) {
            ScaffoldMessenger.of(context).showSnackBar(ErrorBar);
          }
        },
        aspectRatio: CameraAspectRatios.ratio_4_3, // 4:3 default
        // No zoom
        zoom: 0.0,
        exifPreferences: ExifPreferences(
          // For photos only
          saveGPSLocation: false,
        ),
      ),
    );
  }
}
