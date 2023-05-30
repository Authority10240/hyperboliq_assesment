import 'package:hyperboliq/core/locator.dart';
import 'package:hyperboliq/data/back_end/image_dataset_service.dart';
import 'package:hyperboliq/data/back_end/image_picker_service.dart';
import 'package:hyperboliq/data/repositories/image_swap/Image_swap_select_Image_repository_impl.dart';
import 'package:hyperboliq/data/repositories/image_swap/image_swap_load_data_repository_impl.dart';
import 'package:hyperboliq/data/sources/local/image_swap_load_data_source/image_swap_load_data_source.dart';
import 'package:hyperboliq/data/sources/local/image_swap_load_data_source/image_swap_load_data_source_impl.dart';
import 'package:hyperboliq/data/sources/local/image_swap_page_select_image_source/image_swap_select_image_source_impl.dart';
import 'package:hyperboliq/domain/repositories/image_swap/image_swap_load_data_repository.dart';
import 'package:hyperboliq/domain/repositories/image_swap/image_swap_page_select_image_repository.dart';
import 'package:image_picker/image_picker.dart';

class DataLocator{

  final ImageSwapSelectImageRepository imageSwapSelectImageRepository;
  final ImageSwapLoadDataRepository imageSwapLoadDataRepository;

DataLocator._({
  required this.imageSwapSelectImageRepository,
  required this.imageSwapLoadDataRepository
});

 static  Future<DataLocator>init() async{
  late final ImageVideoPickerService imageVideoPickerService;

  late final ImageSwapLoadDataRepository imageSwapLoadDataRepository;
  late final ImageSwapSelectImageRepository imageSwapPageSelectImageRepository;

  late final ImageSwapLoadDataSource imageSwapLoadDataSource;
  late final ImageSwapSelectImageSourceImpl imageSwapPageSelectImageSource;

  imageVideoPickerService = ImageVideoPickerService(imagePicker: locator<ImagePicker>());
  
  imageSwapLoadDataSource = ImageSwapLoadDataSourceimpl(imageDatasetService: locator<ImageDatasetService>());
  imageSwapPageSelectImageSource = ImageSwapSelectImageSourceImpl(imageVideoPickerService: imageVideoPickerService);

  imageSwapLoadDataRepository = ImageSwapLoadDataRepositoryimpl(imageSwapLoadDataSourceimpl: imageSwapLoadDataSource);
  imageSwapPageSelectImageRepository = ImageSwapSelectImageRepositoryImpl(imageSwapSelectImageSourceImpl: imageSwapPageSelectImageSource);
  
    return DataLocator._(
      imageSwapSelectImageRepository: imageSwapPageSelectImageRepository,
      imageSwapLoadDataRepository: imageSwapLoadDataRepository);
  }
}