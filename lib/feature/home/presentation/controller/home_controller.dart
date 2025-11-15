import 'package:get/get.dart';
import '../../../../core/component/custom_place_holder/custom_place_holder.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../domain/entity/lessons_entity.dart';
import '../../domain/usecase/lessons_usecase.dart';

class HomeController extends GetxController {
  HomeController({required this.lessonsUsecase});
  final LessonsUsecase lessonsUsecase;

  RxList<LessonEntity> lessons = RxList([]);
  RxList<LessonEntity> searchedLessons = RxList([]);
  Rx<StateEnum> lessonState = Rx(StateEnum.loading);
  RxInt minAge = RxInt(0);
  RxInt maxAge = RxInt(0);

  void getLessons() async {
    lessonState.value = StateEnum.loading;
    var result = await lessonsUsecase(params: NoParams());
    result.fold(
      (failure) {
        lessonState.value = StateEnum.error;
      },
      (data) {
        lessons.addAll(data);
        lessonState.value = StateEnum.loaded;
        searchedLessons.addAll(lessons);
      },
    );
  }

  void searchByAge() {
    searchedLessons.clear();
    searchedLessons.addAll(lessons.where((lesson) => minAge.value == lesson.ageMin && maxAge.value == lesson.ageMax).toList());
  }

  @override
  void onInit() {
    getLessons();
    super.onInit();
  }
}
