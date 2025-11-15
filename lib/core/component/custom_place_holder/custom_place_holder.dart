import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'on_loading_view.dart';

class CustomPlaceHolder extends StatelessWidget {
  final Widget onLoaded;
  final Widget? onLoading;
  final Widget? onError;
  final Widget? onEmpty;
  final Rx<StateEnum>? state;
  const CustomPlaceHolder({
    super.key,
    required this.onLoaded,
    this.onLoading,
    this.onError,
    this.onEmpty,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        switch (state?.value) {
          case StateEnum.loading:
            return onLoading ?? OnLoadingView();
          case StateEnum.loaded:
            return onLoaded;
          case StateEnum.empty:
            return onEmpty ?? SizedBox.shrink();
          case StateEnum.error:
            return onError ?? SizedBox.shrink();
          default:
            return onLoaded;
        }
      },
    );
  }
}

enum StateEnum {
  loading,
  loaded,
  error,
  empty,
}
