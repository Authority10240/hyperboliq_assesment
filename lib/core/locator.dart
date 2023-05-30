import 'package:hyperboliq/data/back_end/image_dataset_service.dart';
import 'package:hyperboliq/presentation/features/image_swap/image_swap_page_bloc/image_swap_page_bloc.dart';
import 'package:hyperboliq/domain/core/domain_locator.dart';
import 'package:hyperboliq/data/core/data_locator.dart';
import 'package:hyperboliq/presentation/features/splash_screen/splash_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';


GetIt locator = GetIt.instance;

Future<void> setUpLocators()async {

  locator.registerLazySingleton<ImagePicker>(()=>ImagePicker());
  locator.registerLazySingleton<ImageDatasetService>(() => ImageDatasetService());

  final domainLocator = await DomainLocator.init();
  final dataLocator = await DataLocator.init();

  //bloc
  locator.registerFactory<ImageSwapPageBloc>(() => ImageSwapPageBloc(
    imageSwapSelectImageUseCase:domainLocator.imageSwapPageSelectImageUseCase,
    imageSwaptLoadDataUseCase: domainLocator.imageSwapLoadDataUseCase ));
  locator.registerFactory<SplashBloc>(() => SplashBloc());
}