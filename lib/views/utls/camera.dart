// A screen that allows users to take a picture using a given camera.
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Camera extends StatefulWidget {
  const Camera(
      {super.key,
      required this.camera,
      required this.vehicleID,
      required this.refresh});

  final CameraDescription camera;
  final String vehicleID;
  final Function refresh;

  @override
  CameraState createState() => CameraState();
}

class CameraState extends State<Camera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Column(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                return SizedBox(
                    height: screenHeight * .8,
                    child: CameraPreview(_controller));
              } else {
                // Otherwise, display a loading indicator.
                return const Center(child: CupertinoActivityIndicator());
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CupertinoButton.filled(
              // Provide an onPressed callback.
              onPressed: () async {
                // Take the Picture in a try / catch block. If anything goes wrong,
                // catch the error.
                try {
                  // Ensure that the camera is initialized.
                  await _initializeControllerFuture;

                  // Attempt to take a picture and then get the location
                  // where the image file is saved.
                  final image = await _controller.takePicture();
                  if (!mounted) return;

                  // If the picture was taken, display it on a new screen.
                  await Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => DisplayPictureScreen(
                          // Pass the automatically generated path to
                          // the DisplayPictureScreen widget.
                          imagePath: image.path,
                          vehicleID: widget.vehicleID,
                          refresh: widget.refresh),
                    ),
                  );
                } catch (e) {
                  // If an error occurs, log the error to the console.
                  debugPrint(e.toString());
                }
              },
              child: const Icon(CupertinoIcons.camera),
            ),
          )
        ],
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen(
      {super.key,
      required this.imagePath,
      required this.vehicleID,
      required this.refresh});

  final String imagePath;
  final String vehicleID;
  final Function refresh;

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    double screenHeight = MediaQuery.of(context).size.height;
    var key = UniqueKey();
    Reference storageRef =
        FirebaseStorage.instance.ref("${user!.uid}/$vehicleID/$key");

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text(
          "Picture Confirmation",
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * .8,
            child: Image.file(
              File(imagePath),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CupertinoButton.filled(
                  child: const Text("Retake"),
                  onPressed: () => Navigator.pop(context)),
              CupertinoButton.filled(
                  child: const Text("Save"),
                  onPressed: () async {
                    File file = File(imagePath);
                    try {
                      await storageRef.putFile(file).then((p0) {
                        Navigator.popUntil(
                            context, ModalRoute.withName('/carDetails'));
                        refresh();
                      });
                    } on FirebaseException catch (e) {
                      // ...
                      debugPrint(e.toString());
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
