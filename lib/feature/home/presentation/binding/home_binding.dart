import 'package:get/get.dart';
import 'package:minilearn/feature/home/data/datasource/home_datasource.dart';
import 'package:minilearn/feature/home/data/datasource/home_datasource_impl.dart';
import 'package:minilearn/feature/home/data/repository/home_repository_impl.dart';
import 'package:minilearn/feature/home/domain/repository/home_repository.dart';
import 'package:minilearn/feature/home/domain/usecase/lessons_usecase.dart';
import 'package:minilearn/feature/home/presentation/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // datasource
    Get.lazyPut<HomeDatasource>(() => HomeDatasourceImpl());
    // repository
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(dataSource: Get.find()));
    // usecase
    Get.lazyPut(() => LessonsUsecase(repository: Get.find()));
    // controller
    Get.lazyPut(() => HomeController(lessonsUsecase: Get.find()));
  }
}
