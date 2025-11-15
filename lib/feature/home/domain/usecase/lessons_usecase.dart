import 'package:dartz/dartz.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entity/lessons_entity.dart';
import '../repository/home_repository.dart';

class LessonsUsecase implements UseCase<List<LessonEntity>, NoParams> {
  const LessonsUsecase({required this.repository});
  final HomeRepository repository;

  @override
  Future<Either<Exception, List<LessonEntity>>> call({required NoParams? params}) async {
    var result = await repository.getLessons();
    return result;
  }
}
