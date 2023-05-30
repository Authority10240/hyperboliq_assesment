
import 'package:hyperboliq/data/back_end/image_picker_service.dart';
import 'package:hyperboliq/data/sources/local/image_swap_page_select_image_source/image_swap_select_image_source.dart';
import 'package:image_picker/image_picker.dart';

class ImageSwapSelectImageSourceImpl implements ImageSwapSelectImageSource{
final ImageVideoPickerService imageVideoPickerService;

ImageSwapSelectImageSourceImpl({required this.imageVideoPickerService});

  @override
  Future<XFile> getImage() {
   return imageVideoPickerService.getFileFromLocalStorage();
  }

 

}