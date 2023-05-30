import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyperboliq/domain/entities/color_averages/color_averages.dart';
import 'package:hyperboliq/domain/usecases/image_swap/image_swap_select_image_usecase.dart';
import 'package:hyperboliq/presentation/base_classes/base_bloc.dart';
import 'package:hyperboliq/presentation/base_classes/base_state.dart';
import 'package:hyperboliq/presentation/features/image_swap/image_swap_page_bloc/image_swap_page_event.dart';
import 'package:hyperboliq/presentation/features/image_swap/image_swap_page_bloc/image_swap_page_state.dart';
import 'package:hyperboliq/domain/usecases/image_swap/image_swap_load_data_usecase.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:delta_e/delta_e.dart';



class ImageSwapPageBloc extends BaseBloc<ImageSwapPageEvent, ImageSwapPageState> {
final ImageSwapSelectImageUseCase imageSwapSelectImageUseCase;
final ImageSwapLoadDataUseCase imageSwaptLoadDataUseCase;

  ImageSwapPageBloc({
    required this.imageSwapSelectImageUseCase,
    required this.imageSwaptLoadDataUseCase}) : super(ImageSwapPageState()) {
    on<ImageSwapPageSelectImageEvent>(
      _onImageSwapPageSelectImageEvent
    );

    on<ImageSwapPageSwapImageEvent>(
      _onImageSwapPageSwapImageEvent
    );

   
  }
  _onImageSwapPageSwapImageEvent(
    ImageSwapPageSwapImageEvent event,
    Emitter<ImageSwapPageState> emit
  )async{
    emit(ImageSwapPageLoadDataInitState()..dataState = DataState.loading);
     imageSwaptLoadDataUseCase.call(
      onSuccess: (model) async {
        
        img.Image? image = await _decodeImage(event.imageFile);
        ColorAverages colorAverages = await _loadDataset(imagePaths: model);

        img.Image? newSplitImage = await _generateNewImage(colorAverages,image, 400, event.imageFile);
        emit(ImageSwapPageLoadDataState(image: newSplitImage)..dataState = DataState.success);
      },
      onError: (error) => emit(
        ImageSwapPageLoadDataFailedState()..dataState = DataState.error) ,
    );

  }

     _onImageSwapPageSelectImageEvent(
    ImageSwapPageSelectImageEvent event, 
    Emitter<ImageSwapPageState> emit) async{
      emit(ImageSwapPageImageLoadingState()..dataState = DataState.loading);
   await imageSwapSelectImageUseCase.call(
    onSuccess: (file) =>  emit(ImageSwapPageImageSuccessState(file: file)..dataState = DataState.success),
    onError: (error) => emit(ImageSwapPageImageFailureState()..dataState = DataState.error),
   );
  }

  Future<img.Image?> _decodeImage(XFile imageFile) async{
      Uint8List imageBytes = await imageFile.readAsBytes();
        return await img.decodeImage(imageBytes);
  }

   //All out logic is in this method
  // Step 2: Divide our input image in 20x20 parts
  Future<img.Image> _splitImage({
    required int widthCount, 
    required int heightCount,
    required XFile imageFile,
    required List<Color> datasetAvgRgbs,   
    required final List<String> imageDataset,   
    required final List<img.Image> imageTiles }) async {

    Uint8List imageList = await imageFile.readAsBytes();

    img.Image? decodedImage = img.decodeImage(imageList);
    img.Image? newCreatedImage = decodedImage;
    int x = 0, y = 0;

    int width = (decodedImage!.width / widthCount).round();
    int height = (decodedImage.height / heightCount).round();

    List<img.Image> parts = [];
    List<img.Image> newImages = [];

    // Step 3: Calculate the avg RGB for each of the 400 parts in our input image
    List<Color> avgColours = [];
    for (int i = 0; i < heightCount; i++) {
      for (int j = 0; j < widthCount; j++) {
        img.Image imageToAdd = img.copyCrop(decodedImage, x, y, width, height);
        parts.add(imageToAdd);
        Color avgPartRgb = getAverageRBG(imageToAdd);
        int shortestValueIndex = 0;
        double shortestValue = double.maxFinite;
        for (int k = 0; k < datasetAvgRgbs.length; k++) {
          double distance = getDeltaE(datasetAvgRgbs[k], avgPartRgb);

          if (distance < shortestValue) {
            shortestValue = distance;
            shortestValueIndex = k;
          }
        }

        ByteData byteData =
            await rootBundle.load(imageDataset[shortestValueIndex]);

        Uint8List bytes = byteData.buffer.asUint8List();

        img.Image? imageToReplace = img.decodeImage(bytes);

        img.Image resizedImage = img.copyResize(imageToReplace!,
            width: imageToAdd.width, height: imageToAdd.height);
        newImages.add(resizedImage);
        avgColours.add(avgPartRgb);
        newCreatedImage = img.copyInto(newCreatedImage!, resizedImage,
            dstX: x, dstY: y, srcH: imageToAdd.height, srcW: imageToAdd.width);

        x += width;
      }
      x = 0;
      y += height;
    }
    return newCreatedImage!;
  }

  Future<img.Image> _generateNewImage(ColorAverages colorAverages,var image, int tileSize,XFile imageFile) async {
     
    List<Color> datasetAvgRgbs = []; 
    final List<String> imageDataset = []; 
    final List<img.Image> imageTiles = [];

    img.Image newSplitImage = await _splitImage(
      heightCount: 20,
      widthCount:20,
      imageDataset: colorAverages.imageDataset,
      datasetAvgRgbs:colorAverages.datasetAvgRgbs,
      imageFile: imageFile,
      imageTiles: imageTiles );
    img.Image newImage = newSplitImage;

    return newSplitImage;

  }

  Future<ColorAverages> _loadDataset({required dynamic imagePaths
     }) async {

        List<String> imageDataset =[];
        List<Color> datasetAvgRgbs =[];
      for (var path in imagePaths) {
        ByteData byteData = await rootBundle.load(path);

        Uint8List bytes = byteData.buffer.asUint8List();

        img.Image? decodedImage = img.decodeImage(bytes);

        //Step 1: Calculate avg RGB for each tile image from our assets folder (Avg R, Avg G, Avg B)
        Color avgRgb = getAverageRBG(decodedImage!);
        datasetAvgRgbs.add(avgRgb);
        imageDataset.add(path);
      }

      return ColorAverages(datasetAvgRgbs: datasetAvgRgbs, imageDataset: imageDataset, imageTiles: []);
    }
  

  Color getAverageRBG(img.Image image) {
  int redBucket = 0;
  int greenBucket = 0;
  int blueBucket = 0;
  int pixelCount = 0;

  for (int y = 0; y < image.height; y++) {
    for (int x = 0; x < image.width; x++) {
      int c = image.getPixel(x, y);

      pixelCount++;
      redBucket += img.getRed(c);
      greenBucket += img.getGreen(c);
      blueBucket += img.getBlue(c);
    }
  }
  Color averageColor = Color.fromRGBO(redBucket ~/ pixelCount,
      greenBucket ~/ pixelCount, blueBucket ~/ pixelCount, 1);

  return averageColor;
}

double getDeltaE(Color color1, Color color2) {
  LabColor lab1 = LabColor.fromRGB(color1.red, color1.green, color1.blue);
  LabColor lab2 = LabColor.fromRGB(color2.red, color2.green, color2.blue);
  return deltaE(lab1, lab2, algorithm: DeltaEAlgorithm.cie76);
}

}

  

  