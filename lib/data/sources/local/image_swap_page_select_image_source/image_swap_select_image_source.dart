import 'package:image_picker/image_picker.dart';

abstract class ImageSwapSelectImageSource{

  Future<XFile>getImage();
}