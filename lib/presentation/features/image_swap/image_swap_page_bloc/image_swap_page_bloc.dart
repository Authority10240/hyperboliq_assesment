import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_swap_page_event.dart';
part 'image_swap_page_state.dart';

class ImageSwapPageBloc extends BaseBloc<ImageSwapPageEvent, ImageSwapPageState> {
  ImageSwapPageBloc() : super(ImageSwapPageInitial()) {
    on<ImageSwapPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

export 'image_swap_page_event.dart';
export 'image_swap_page_state.dart';