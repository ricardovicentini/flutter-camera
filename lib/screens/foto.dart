import 'dart:io';
import 'package:flutter/material.dart';

class Foto extends StatelessWidget {
  final String imagePath;

  const Foto({Key key,@required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Foto tirada'),

      ),
      body: Image.file(File(this.imagePath)),
    );
  }
}
