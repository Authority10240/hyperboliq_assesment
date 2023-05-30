import 'package:flutter/material.dart';

class BaseState{
  DataState dataState;

  BaseState({
    this.dataState = DataState.init
});
}

enum DataState{
  init,
  loading,
  reloading,
  success,
  error
}

abstract class BaseBlocPrimaryState{
  void call(BuildContext context);
}