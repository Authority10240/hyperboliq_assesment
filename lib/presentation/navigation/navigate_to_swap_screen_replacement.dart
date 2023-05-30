import 'package:flutter/material.dart';
import 'package:hyperboliq/core/constants.dart';
import 'package:hyperboliq/core/locator.dart';
import 'package:hyperboliq/presentation/base_classes/base_state.dart';
import 'package:hyperboliq/presentation/features/image_swap/image_swap_page.dart';

class NavigateToImageSwapPageReplacement extends BaseBlocPrimaryState {
  final bool shouldCompleteOnboardingFirst;
  final Function(dynamic result)? onPop;

  NavigateToImageSwapPageReplacement({
    this.onPop,
    this.shouldCompleteOnboardingFirst = false,
  }) : super();

  @override
  call(context) async {
    final result = await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          settings: const RouteSettings(name: PageNames.imageSwapPage),
          builder: (_) => ImageSwapPage(
              )),
    );
    onPop?.call(result);
  }
}
