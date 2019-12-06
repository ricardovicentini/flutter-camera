import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Camera extends StatefulWidget {

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {

  File pic;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                RaisedButton.icon(
                    onPressed: () async {
                        var _pic = await ImagePicker.pickImage(
                            source: ImageSource.camera,
                          imageQuality: 50

                        );

                        setState(() {
                          pic = _pic;
                        });
                      },
                    icon: Icon(Icons.camera_alt),
                    label: Text('Abrir Camera')
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: MediaQuery.of(context).size.height -100,
                  child: Center(
                    child: pic == null ? Text('tire uma foto') : Image.file(pic),

                    ),
                ),
              ],
            ),

          ],
        ),

      ),
    );
  }
}
