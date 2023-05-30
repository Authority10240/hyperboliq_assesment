
import 'package:flutter/material.dart';
import 'package:hyperboliq/core/constants.dart';
import 'package:hyperboliq/core/locator.dart';
import 'package:hyperboliq/presentation/base_classes/base_widget.dart';
import 'package:hyperboliq/presentation/features/splash_screen/splash_bloc.dart';
class SplashScreen extends BaseWidget{

  final SplashBloc Function() onInitBloc;

  const SplashScreen({Key? key , required this.onInitBloc}) : super(key:key);

  static MaterialPageRoute<dynamic> route(){
    return MaterialPageRoute(
      builder: (_) => SplashScreen(
      onInitBloc:()=> locator<SplashBloc>()),
      settings: const RouteSettings(name: PageNames.splashPage),
    );
  }
  
  State<SplashScreen> createState() => _SplashScreenState();
  
}

class _SplashScreenState extends BaseWidgetState<SplashScreen, SplashBloc>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: 500,
          child: Image.asset(ImageAssets.hyperboliqLogo),
        ),
      ),
   );
  }

  @override
  SplashBloc initBloc() {
    return widget.onInitBloc();
  }
}