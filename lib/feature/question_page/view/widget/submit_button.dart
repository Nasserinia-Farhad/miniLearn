import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minilearn/feature/question_page/controller/question_controller.dart';

class SubmitButton extends GetView<QuestionController> {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(controller.isTestTrue.value ? "Good job!" : "So close! Give it another try! 💪"),
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              width: 120.0,
              child: FilledButton(
                onPressed: () {
                  controller.saveToStorage(controller.index);
                  Get.back();
                },
                child: Text("Done"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
