import 'package:flutter/material.dart';
import 'package:hyperboliq/generated/l10n.dart';
import 'package:hyperboliq/presentation/features/image_swap/image_swap_page.dart';
import 'package:hyperboliq/core/locator.dart';

class  HyperboliqApp extends StatefulWidget{
  const HyperboliqApp._({
    Key? key
}) : super(key: key);

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return ImageSwapPage.route();
    }
    return ImageSwapPage.route();
  }

  static Future<void> appInit() async{
    await setUpLocators();
  }

  static void run(){
   return runApp(MaterialApp(
     
  localizationsDelegates: const [
     AppLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('en','')
  ],
    initialRoute:'/' ,
      title: 'Hyperbolq App',
      onGenerateInitialRoutes: (String initialRoute){
        return [ImageSwapPage.route()];
      },
      onGenerateRoute: onGenerateRoute,
    ));
  }
  _HyperboliqAppState createState() => _HyperboliqAppState();
}

class _HyperboliqAppState extends State<HyperboliqApp>{

  @override
  Widget build (BuildContext context){
    return MaterialApp(
    );
  }
}