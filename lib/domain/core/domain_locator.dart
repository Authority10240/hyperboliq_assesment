import 'package:hyperboliq/data/core/data_locator.dart';
import 'package:hyperboliq/domain/usecases/image_swap/image_swap_load_data_usecase.dart';
import 'package:hyperboliq/domain/usecases/image_swap/image_swap_select_image_usecase.dart';

class DomainLocator{

  final ImageSwapSelectImageUseCase imageSwapPageSelectImageUseCase;
  final ImageSwapLoadDataUseCase imageSwapLoadDataUseCase;

  DomainLocator._({
    required this.imageSwapPageSelectImageUseCase,
    required this.imageSwapLoadDataUseCase
  });

  static Future<DomainLocator> init() async{

    late final ImageSwapSelectImageUseCase imageSwapPageSelectImageUseCase;
    late final ImageSwapLoadDataUseCase imageSwapLoadDataUseCase;
    
    final dataLocator = await DataLocator.init();

    imageSwapPageSelectImageUseCase = ImageSwapSelectImageUseCase(imageSwapSelectImageRepository: dataLocator.imageSwapSelectImageRepository);
    imageSwapLoadDataUseCase = ImageSwapLoadDataUseCase(imageSwapLoadDataRepository: dataLocator.imageSwapLoadDataRepository);

    return DomainLocator._(
      imageSwapPageSelectImageUseCase: imageSwapPageSelectImageUseCase,
      imageSwapLoadDataUseCase: imageSwapLoadDataUseCase
    );
  }

}