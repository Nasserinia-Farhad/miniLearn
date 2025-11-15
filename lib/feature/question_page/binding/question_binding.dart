import 'package:get/get.dart';
import 'package:minilearn/feature/question_page/controller/question_controller.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuestionController());
  }
}
