import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import 'package:path_provider/path_provider.dart' as syspath;

class UserImage extends StatefulWidget {
  const UserImage({Key? key, required this.img}) : super(key: key);

  final void Function(String image) img;

  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  File? fetchedImage;
  String str = '';
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('$path');

    final file = File('${(await syspath.getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  // static Image imageFromBase64String(String base64String) {
  //   return Image.memory(
  //     base64Decode(base64String),
  //     fit: BoxFit.fill,
  //   );
  // }

  void pickImage() async {
    final imagePicker = ImagePicker();

    var image = await imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 70,
        maxWidth: 300,
        maxHeight: 500);
    fetchedImage = File(image!.path);
    final filename = path.basename(image.path);
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final savedImage = await fetchedImage?.copy('${appDir.path}/$filename');
    // print(savedImage!.path);
    // File i = await getImageFileFromAssets(
    //     '/data/user/0/com.example.docapp/app_flutter/$filename');

    //print(savedImage);
    if (savedImage != null) {
      String imgString = base64String(savedImage.readAsBytesSync());

      setState(() {
        str = imgString;
        fetchedImage = File(image.path);
      });
      widget.img(str);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(str);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: fetchedImage == null
              ? const AssetImage('assets/images/user.png')
              : MemoryImage(base64Decode(str)) as ImageProvider,
          // AssetImage('assets/images/user.png'),
          // fetchedImage == null ? AssetImage(assetName): MemoryImage(base64Decode(str)),
          radius: 50,
        ),
        IconButton(
          onPressed: pickImage,
          icon: const Icon(
            Icons.camera_alt,
            color: Colors.white60,
          ),
        )
      ],
    );
  }
}
