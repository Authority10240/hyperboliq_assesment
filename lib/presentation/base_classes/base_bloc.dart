import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

abstract class BaseBloc<T extends BaseEvent, S extends BaseState> extends <T,S>{
  final _stateController = StreamController<BaseBlocPrimaryState>();

  BaseBloc(S initialState) : super(initalState){}

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