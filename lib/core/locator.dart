
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';


GetIt locator = GetIt.instance;

Future<void> setUpLocators()async {

  locator.registerSingleton(<Dio>(()=>Dio()));
  final presentation = await PresentationModule.init();
  final domain = await DomainModule.init();
  final data = await DataModule.init()
}