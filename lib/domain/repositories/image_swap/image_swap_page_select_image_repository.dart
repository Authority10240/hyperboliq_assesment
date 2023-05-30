import 'package:image_picker/image_picker.dart';

abstract class ImageSwapSelectImageRepository {

  Future<void>getImage({
    Function(XFile file)? onSuccess, 
    Function(String error)? onError,});
}