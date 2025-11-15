import 'package:minilearn/feature/home/data/model/lessons_model.dart';

abstract class HomeDatasource {
  Future<List<LessonsModel>> getLessons();
}
