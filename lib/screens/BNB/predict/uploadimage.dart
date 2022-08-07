import 'dart:convert';
import 'dart:io';
import 'package:autismx/shared/local/component.dart';
import 'package:autismx/shared/network/dio/ai_helper.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../../../shared/local/AlertDialog.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final ImagePicker _picker = ImagePicker();
  File _image;
  bool uploadStatus = false;

  _imageFromCamera() async {
    final PickedFile pickedImage =
        await _picker.getImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedImage == null) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "No Image was selected.");
      return;
    }
    final File fileImage = File(pickedImage.path);

    setState(() {
      _image = fileImage;
    });
  }

  _imageFromGallery() async {
    final PickedFile pickedImage =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedImage == null) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "No Image was selected.");
      return;
    }
    final File fileImage = File(pickedImage.path);

    setState(() {
      _image = fileImage;
    });
  }

  uploadImage() async {
    if (_image == null) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "No Image was selected.");
      return;
    }

    setState(() {
      uploadStatus = true;
    });
    var response = await AIDioHelper.uploadImage(imageFile: _image);
    print(response.statusCode);
    if (response.statusCode != 200) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "Server Side Error.");
    } else {
      var result = response.data;
      print(result);
      showAlertDialog(
          context: context, title: "Image Sent!", content: result['result']);
    }
    setState(() {
      uploadStatus = false;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showAlertDialog(
        context: context,
        title: "Note!",
        content: "Child age should be between 2 to 14 years old",
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            CustombackAppBar(
              context,
              () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                // Display Progress Indicator if uploadStatus is true
                child: uploadStatus
                    ? Center(
                        child: Container(
                            height: 100,
                            width: 100,
                            child:
                                Image.asset("assets/images/puzzleloading.gif")),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            GestureDetector(
                              onTap: () {
                                _imageFromGallery();
                              },
                              child: CircleAvatar(
                                radius: MediaQuery.of(context).size.width / 3.5,
                                backgroundColor: Colors.grey,
                                backgroundImage: _image != null
                                    ? FileImage(_image)
                                    : const AssetImage(
                                        'assets/images/cam.gif',
                                      ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                child: Text(
                                  "Upload child image",
                                  style: TextStyle(
                                      color: Colors.blue[300],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                onPressed: () {
                                  _imageFromGallery();
                                }),
                            const Text(
                              "or",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            IconButton(
                                onPressed: () {
                                  _imageFromCamera();
                                },
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 35,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: uploadImage,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.file_upload),
                                    Text(
                                      'Upload Image',
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}