
import 'package:flutter/material.dart';
import 'package:hyperboliq/presentation/base_classes/base_event.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class ImageSwapPageEvent extends BaseEvent{}

class ImageSwapPageSelectImageEvent extends ImageSwapPageEvent{}

class ImageSwapPageSwapImageEvent extends ImageSwapPageEvent{
  XFile imageFile;

  ImageSwapPageSwapImageEvent({
    required this.imageFile
  });
}

