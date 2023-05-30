import 'package:hyperboliq/presentation/base_classes/base_bloc.dart';
import 'package:hyperboliq/presentation/base_classes/base_state.dart';
import 'package:hyperboliq/presentation/navigation/navigate_to_swap_screen_replacement.dart';

class SplashBloc extends BaseBloc{

 

  SplashBloc():super(BaseState()){
    init();
  }

  init(){
    Future.delayed(const Duration(seconds: 3));
    sinkState?.add(NavigateToImageSwapPageReplacement());
  }

  


}