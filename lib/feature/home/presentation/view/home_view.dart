import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minilearn/feature/home/presentation/view/widget/on_loaded.dart';
import 'package:minilearn/feature/home/presentation/view/widget/on_empty.dart';
import 'package:minilearn/feature/home/presentation/view/widget/on_error.dart';
import 'package:minilearn/feature/home/presentation/view/widget/on_loading.dart';

import '../../../../core/component/custom_place_holder/custom_place_holder.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPlaceHolder(
        state: controller.lessonState,
        onEmpty: OnEmpty(),
        onError: OnError(),
        onLoading: OnLoading(),
        onLoaded: OnLoaded(),
      ),
    );
  }
}
