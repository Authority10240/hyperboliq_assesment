import 'package:flutter/material.dart';
import 'base_bloc.dart';
import 'base_state.dart';

abstract class BaseWidget extends StatefulWidget{
  const BaseWidget({key? key}) : super(key:key);
}

abstract class BaseWidgetState<T extends BaseWidget , B extends BaseBloc> extends State<T>{
  late B baseBloc

  @mustCallSuper
  void onBlocStateChanged(BaseBlocPrimaryState state) => state.call(context);

  B getBloc() => baseBloc;

  B initBloc();

  @override
  void dispose(){
    getBloc().dispose();
    super.dispose();
  }
}