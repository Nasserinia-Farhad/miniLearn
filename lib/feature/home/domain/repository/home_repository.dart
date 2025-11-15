import 'package:dartz/dartz.dart';
import 'package:minilearn/feature/home/domain/entity/lessons_entity.dart';

abstract class HomeRepository {
  Future<Either<Exception, List<LessonEntity>>> getLessons();
}
