import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class ImageDatasetService{

  Future<dynamic> readDataSet() async{
    String manifestJson = await rootBundle.loadString('AssetManifest.json');
      return await json
          .decode(manifestJson)
          .keys
          .where((String key) => key.startsWith('assets/pictures/'));

          

  }


}