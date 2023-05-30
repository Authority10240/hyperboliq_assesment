
import 'dart:ui';

import 'package:hyperboliq/presentation/base_classes/base_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class ImageSwapPageState extends BaseState{

}

class ImageSwapPageImageSuccessState extends ImageSwapPageState{
  XFile file;

  ImageSwapPageImageSuccessState({required this.file});
}

class ImageSwapPageImageFailureState extends ImageSwapPageState{
 

  ImageSwapPageImageFailureState();
}

class ImageSwapPageImageLoadingState extends ImageSwapPageState{
  

  ImageSwapPageImageLoadingState();
}



class ImageSwapPageLoadDataState extends ImageSwapPageState{
img.Image image;
  ImageSwapPageLoadDataState({required this.image});
}

class ImageSwapPageLoadDataFailedState extends ImageSwapPageState{

}

class ImageSwapPageLoadDataInitState extends ImageSwapPageState{

}