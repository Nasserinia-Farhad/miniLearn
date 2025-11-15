import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minilearn/feature/home/presentation/controller/home_controller.dart';
import 'package:minilearn/feature/question_page/binding/question_binding.dart';
import 'package:minilearn/feature/question_page/view/question_page.dart';

class OnLoaded extends GetView<HomeController> {
  const OnLoaded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kToolbarHeight),
        SearchBar(),
        SearchedQuestionListView(),
      ],
    );
  }
}

class SearchBar extends GetView<HomeController> {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          Container(
            height: 250.0,
            width: context.width,
            color: Colors.white,
            child: ListView.builder(
              itemCount: controller.lessons.length,
              itemBuilder: (BuildContext context, int index) {
                var model = controller.lessons[index];
                return TextButton(
                  onPressed: () {
                    controller.minAge.value = model.ageMin;
                    controller.maxAge.value = model.ageMax;
                    controller.searchByAge();
                    Get.close(0);
                  },
                  child: Text("${model.ageMin} - ${model.ageMax}"),
                );
              },
            ),
          ),
        );
      },
      child: Container(
        height: 48.0,
        width: context.width,
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Search your'e age"),
                Icon(
                  Icons.arrow_downward_rounded,
                  size: 16.0,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchedQuestionListView extends GetView<HomeController> {
  const SearchedQuestionListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          itemCount: controller.searchedLessons.length,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            var model = controller.searchedLessons[index];
            return InkWell(
              onTap: () {
                Get.to(
                  () => QuestionPage(),
                  binding: QuestionBinding(),
                  arguments: {
                    "lessons": controller.searchedLessons,
                    "index": index,
                  },
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                width: context.width,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Name: ",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          model.title,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text(model.icon),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Age range: ",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "${model.ageMin}-${model.ageMax}",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
