

import 'package:camera/camera.dart';
import 'package:camera_app/screens/camera.dart';
import 'package:flutter/material.dart';

import 'infraestrutura/camera-device.dart';

//Future<void> main() async {
//
//  final cameras = await availableCameras();
//  final firstCamera = cameras.first;
//  runApp(MaterialApp(
//    theme: ThemeData.dark(),
//    home: CameraDevice(camera: firstCamera,),
//  ));
//}


void main()=> runApp(
  MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context)=> Camera(),
    },
  )
);