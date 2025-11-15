import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minilearn/feature/question_page/controller/question_controller.dart';
import 'package:minilearn/feature/question_page/view/widget/answered_text_view.dart';
import 'package:minilearn/feature/question_page/view/widget/submit_button.dart';
import 'package:minilearn/feature/question_page/view/widget/question_listview.dart';

class QuestionPage extends GetView<QuestionController> {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Visibility(
          visible: !controller.isAnswered.value,
          replacement: AnsweredTextView(),
          child: Obx(
            () => Visibility(
              visible: !controller.isLastQuestion.value,
              replacement: SubmitButton(),
              child: QuestionListview(),
            ),
          ),
        ),
      ),
    );
  }
}
