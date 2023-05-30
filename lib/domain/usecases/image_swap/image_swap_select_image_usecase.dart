import 'package:hyperboliq/domain/repositories/image_swap/image_swap_page_select_image_repository.dart';
import 'package:hyperboliq/domain/usecases/base_usecase.dart';
import 'package:image_picker/image_picker.dart';

class ImageSwapSelectImageUseCase extends BaseUseCase{
  ImageSwapSelectImageRepository  imageSwapSelectImageRepository;

  ImageSwapSelectImageUseCase({required this.imageSwapSelectImageRepository});
  @override
  Future<void> call({
    Function(XFile file)? onSuccess, 
    Function(String error)? onError,
     BaseUseCaseParams? params}) async{
    await imageSwapSelectImageRepository.getImage(
      onSuccess: (file) => onSuccess?.call(file),
      onError: (error) => onError?.call(error),);
  }

}