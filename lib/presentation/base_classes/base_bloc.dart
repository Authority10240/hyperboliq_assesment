import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:hyperboliq/presentation/base_classes/base_bloc.dart';
import 'package:hyperboliq/presentation/base_classes/base_event.dart';
import 'package:hyperboliq/presentation/base_classes/base_state.dart';

abstract class BaseBloc<T extends BaseEvent, S extends BaseState> extends Bloc<T,S>{
  final _stateController = StreamController<BaseBlocPrimaryState>();

  BaseBloc(S initialState) : super(initialState){}

  Stream<BaseBlocPrimaryState>? get baseState => _stateController.stream;

  Sink<BaseBlocPrimaryState>? get sinkState{
    if (_stateController.isClosed)
      return null;
    return _stateController.sink;
  }

  @mustCallSuper
  dispose(){
      _stateController.close();
  }

}