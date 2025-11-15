import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

mixin StorageHelper {
  final GetStorage box = GetStorage();
  RxBool isAnswered = RxBool(false);

  void saveToStorage(int index) => box.write(index.toString(), index);

  void isAnsweredCheck(int index) {
    if (box.read(index.toString()) == index) isAnswered.value = true;
  }
}
