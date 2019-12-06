import 'package:camera/camera.dart';
import 'package:camera_app/screens/foto.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraDevice extends StatefulWidget {
  final CameraDescription camera;

  const CameraDevice({Key key, @required this.camera}) : super(key: key);

  @override
  _CameraDeviceState createState() => _CameraDeviceState();
}

class _CameraDeviceState extends State<CameraDevice> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = CameraController(widget.camera, ResolutionPreset.medium);

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione uma foto'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try{
            await _initializeControllerFuture;

            final path = join(
                (await getTemporaryDirectory()).path, '${DateTime.now()}.png');

            await _controller.takePicture(path);

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Foto(imagePath: path,)
                ));

          }catch(e){
            print(e);
          }

        },
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
