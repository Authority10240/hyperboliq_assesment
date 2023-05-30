import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hyperboliq/data/back_end/image_dataset_service.dart';
import 'package:hyperboliq/data/sources/local/image_swap_load_data_source/image_swap_load_data_source.dart';

class ImageSwapLoadDataSourceimpl implements ImageSwapLoadDataSource{
  ImageDatasetService imageDatasetService;

  ImageSwapLoadDataSourceimpl({required this.imageDatasetService});
  @override
  Future<dynamic>loadData() async {
    return await imageDatasetService.readDataSet();
  }

}