import 'package:hyperboliq/data/back_end/back_end_calls.dart';
import 'package:hyperboliq/data/sources/local/image_swap_page_select_image_source/image_swap_select_image_source.dart';
import 'package:hyperboliq/data/sources/local/image_swap_page_select_image_source/image_swap_select_image_source_impl.dart';
import 'package:hyperboliq/domain/repositories/image_swap/image_swap_page_select_image_repository.dart';
import 'package:image_picker/image_picker.dart';

class ImageSwapSelectImageRepositoryImpl implements ImageSwapSelectImageRepository{
  ImageSwapSelectImageSource imageSwapSelectImageSourceImpl;

  ImageSwapSelectImageRepositoryImpl({
    required this.imageSwapSelectImageSourceImpl
    });

  @override
  Future<void> getImage({Function(XFile file)? onSuccess, Function(String error)? onError}) async {
    return await safeBackEndCalls(
      imageSwapSelectImageSourceImpl.getImage(), 
      onSuccess: (image)=> onSuccess?.call(image),
       onError: (error) => onError?.call(error.toString()));
    
  }
  
}