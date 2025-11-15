import 'package:get/get.dart';

import '../../home/domain/entity/lessons_entity.dart';
import '../helper/storage_helper.dart';

class QuestionController extends GetxController with StorageHelper {
  late RxList<LessonEntity> lessons;
  late int index;

  RxInt questionLength = RxInt(1);
  RxBool isLastQuestion = RxBool(false);
  RxMap<int, int> selectedAnswers = RxMap<int, int>();
  RxList<int> answeredList = RxList([]);
  RxBool isTestTrue = RxBool(false);

  void selectAnswer(int questionIndex, int answerIndex) {
    answeredList.add(answerIndex);
    selectedAnswers[questionIndex] = answerIndex;
  }

  void incrementListView() {
    bool canIncrement = questionLength.value < lessons.length;
    if (canIncrement) {
      questionLength.value++;
    } else {
      checkTest();
      isLastQuestion.value = true;
    }
  }

  void checkTest() {
    isTestTrue.value = answeredList.asMap().entries.every((e) => e.value == lessons[index].questions[e.key].answerIndex);
  }

  @override
  void onInit() {
    lessons = Get.arguments['lessons'];
    index = Get.arguments['index'];
    isAnsweredCheck(index);
    super.onInit();
  }
}
