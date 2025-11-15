import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:minilearn/feature/home/data/datasource/home_datasource.dart';
import 'package:minilearn/feature/home/data/model/lessons_model.dart';

class HomeDatasourceImpl implements HomeDatasource {
  @override
  Future<List<LessonsModel>> getLessons() async {
    try {
      String url = 'assets/lessons.json';
      final jsonStr = await rootBundle.loadString(url);
      final data = json.decode(jsonStr) as List;
      return data.map((e) => LessonsModel.fromJson(e)).toList();
    } on Exception catch (e) {
      throw Exception("Failed to load lessons: $e");
    }
  }
}
