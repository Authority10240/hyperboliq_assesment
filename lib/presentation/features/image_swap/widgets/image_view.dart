import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';


class ImageView extends StatelessWidget {  

  String imagePath;

  ImageView({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Container(
            width: screen.width,
            height: screen.height,
          padding: const EdgeInsets.all(20),
          child:  Image.file(File(imagePath)));
  }
}
