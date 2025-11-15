import 'package:json_annotation/json_annotation.dart';
import 'package:minilearn/feature/home/domain/entity/lessons_entity.dart';

part 'lessons_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LessonsModel {
  @JsonKey(name: "id")
  final String? id;

  @JsonKey(name: "title")
  final String? title;

  @JsonKey(name: "ageMin")
  final int? ageMin;

  @JsonKey(name: "ageMax")
  final int? ageMax;

  @JsonKey(name: "icon")
  final String? icon;

  @JsonKey(name: "questions")
  final List<Question>? questions;

  LessonsModel({
    this.id,
    this.title,
    this.ageMin,
    this.ageMax,
    this.icon,
    this.questions,
  });

  factory LessonsModel.fromJson(Map<String, dynamic> json) => _$LessonsModelFromJson(json);

  Map<String, dynamic> toJson() => _$LessonsModelToJson(this);
}

@JsonSerializable()
class Question {
  @JsonKey(name: "q")
  final String? q;

  @JsonKey(name: "choices")
  final List<String>? choices;

  @JsonKey(name: "answerIndex")
  final int? answerIndex;

  Question({
    this.q,
    this.choices,
    this.answerIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

extension LessonsModelMapper on LessonsModel {
  LessonEntity toEntity() {
    return LessonEntity(
      id: id ?? '',
      title: title ?? '',
      ageMin: ageMin ?? 0,
      ageMax: ageMax ?? 0,
      icon: icon ?? '',
      questions: questions
              ?.map(
                (e) => QuestionEntity(
                  question: e.q ?? '',
                  choices: e.choices ?? [],
                  answerIndex: e.answerIndex ?? 0,
                ),
              )
              .toList() ??
          [],
    );
  }
}
