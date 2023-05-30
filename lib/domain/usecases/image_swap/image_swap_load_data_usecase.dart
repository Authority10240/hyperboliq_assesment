
import 'package:hyperboliq/domain/repositories/image_swap/image_swap_load_data_repository.dart';
import 'package:hyperboliq/domain/usecases/base_usecase.dart';

class ImageSwapLoadDataUseCase extends BaseUseCase{

  ImageSwapLoadDataRepository imageSwapLoadDataRepository;

  ImageSwapLoadDataUseCase({required this.imageSwapLoadDataRepository});
  @override
  Future<void> call({
    Function(dynamic model)? onSuccess,
     Function(String error)? onError, 
     BaseUseCaseParams? params})async {
      await imageSwapLoadDataRepository.loadData(
        (model) => onSuccess?.call(model), 
        (error) => onError?.call(error));
  }

}