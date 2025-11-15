import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minilearn/feature/question_page/controller/question_controller.dart';

class QuestionListview extends GetView<QuestionController> {
  const QuestionListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(
        () {
          return ListView.builder(
            itemCount: controller.questionLength.value,
            itemBuilder: (context, questionIndex) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.lessons[controller.index].questions[questionIndex].question,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: context.width,
                    padding: const EdgeInsets.only(top: 8, bottom: 24.0),
                    child: Obx(
                      () => ListView.builder(
                        itemCount: controller.lessons[controller.index].questions[questionIndex].choices.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, choiceIndex) {
                          return GestureDetector(
                            onTap: () {
                              controller.selectAnswer(questionIndex, choiceIndex);
                              controller.incrementListView();
                            },
                            child: Container(
                              width: 70,
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              decoration: BoxDecoration(
                                color: controller.selectedAnswers[questionIndex] == choiceIndex ? Colors.green : Colors.blue,
                                border: Border.all(
                                  color: controller.selectedAnswers[questionIndex] == choiceIndex ? Colors.green : Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  controller.lessons[controller.index].questions[questionIndex].choices[choiceIndex],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
