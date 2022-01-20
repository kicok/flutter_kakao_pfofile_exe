import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/controller/profileController.dart';
import 'src/profile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ImageCropper',
      theme: ThemeData.light().copyWith(primaryColor: Colors.deepOrange),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<ProfileController>(() => ProfileController());
      }),
      home: const Profile(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   final String title;

//   const MyHomePage({required this.title});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// enum AppState {
//   free,
//   picked,
//   cropped,
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late AppState state;
//   File? imageFile;

//   @override
//   void initState() {
//     super.initState();
//     state = AppState.free;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: imageFile != null ? Image.file(imageFile!) : Container(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.deepOrange,
//         onPressed: () {
//           if (state == AppState.free) {
//             _pickImage();
//             // } else if (state == AppState.picked) {
//             //   _cropImage();
//           } else if (state == AppState.cropped) {
//             _clearImage();
//           }
//         },
//         child: _buildButtonIcon(),
//       ),
//     );
//   }

//   Widget _buildButtonIcon() {
//     if (state == AppState.free) {
//       return const Icon(Icons.add);
//     } else if (state == AppState.picked) {
//       return const Icon(Icons.crop);
//     } else if (state == AppState.cropped) {
//       return const Icon(Icons.clear);
//     } else {
//       return Container();
//     }
//   }

//   Future<void> _pickImage() async {
//     final pickedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     imageFile = pickedImage != null ? File(pickedImage.path) : null;
//     if (imageFile != null) {
//       _cropImage();
//     }
//   }

//   Future<void> _cropImage() async {
//     File? croppedFile = await ImageCropper.cropImage(
//         sourcePath: imageFile!.path,
//         aspectRatioPresets: Platform.isAndroid
//             ? [
//                 CropAspectRatioPreset.square,
//                 CropAspectRatioPreset.ratio3x2,
//                 CropAspectRatioPreset.original,
//                 CropAspectRatioPreset.ratio4x3,
//                 CropAspectRatioPreset.ratio16x9
//               ]
//             : [
//                 CropAspectRatioPreset.original,
//                 CropAspectRatioPreset.square,
//                 CropAspectRatioPreset.ratio3x2,
//                 CropAspectRatioPreset.ratio4x3,
//                 CropAspectRatioPreset.ratio5x3,
//                 CropAspectRatioPreset.ratio5x4,
//                 CropAspectRatioPreset.ratio7x5,
//                 CropAspectRatioPreset.ratio16x9
//               ],
//         androidUiSettings: const AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Colors.deepOrange,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//         iosUiSettings: const IOSUiSettings(
//           title: 'Cropper',
//         ));
//     if (croppedFile != null) {
//       imageFile = croppedFile;
//       setState(() {
//         state = AppState.cropped;
//       });
//     }
//   }

//   void _clearImage() {
//     imageFile = null;
//     setState(() {
//       state = AppState.free;
//     });
//   }
// }
