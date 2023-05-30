import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class ColorAverages{
 final List<Color> datasetAvgRgbs;
 final List<String> imageDataset;
 final List<img.Image> imageTiles;

  ColorAverages({required this.datasetAvgRgbs,   
    required this.imageDataset,   
    required this.imageTiles });
}