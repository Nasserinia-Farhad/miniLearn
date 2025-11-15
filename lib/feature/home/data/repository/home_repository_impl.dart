import 'package:dartz/dartz.dart';
import 'package:minilearn/feature/home/data/datasource/home_datasource.dart';
import 'package:minilearn/feature/home/data/model/lessons_model.dart';
import 'package:minilearn/feature/home/domain/entity/lessons_entity.dart';
import 'package:minilearn/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({required this.dataSource});
  final HomeDatasource dataSource;

  @override
  Future<Either<Exception, List<LessonEntity>>> getLessons() async {
    try {
      var result = await dataSource.getLessons();
      final entities = result.map((element) => element.toEntity()).toList();
      return right(entities);
    } catch (e) {
      return left(Exception(e.toString()));
    }
  }
}
