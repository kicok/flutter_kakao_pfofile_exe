import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/app.dart';
import 'src/controller/image_crop_controller.dart';
import 'src/controller/profile_controller.dart';

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
        Get.lazyPut<ImageCropController>(() => ImageCropController());
      }),
      home: const App(),
    );
  }
}
