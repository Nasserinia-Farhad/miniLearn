// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonsModel _$LessonsModelFromJson(Map<String, dynamic> json) => LessonsModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      ageMin: (json['ageMin'] as num?)?.toInt(),
      ageMax: (json['ageMax'] as num?)?.toInt(),
      icon: json['icon'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LessonsModelToJson(LessonsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'ageMin': instance.ageMin,
      'ageMax': instance.ageMax,
      'icon': instance.icon,
      'questions': instance.questions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      q: json['q'] as String?,
      choices:
          (json['choices'] as List<dynamic>?)?.map((e) => e as String).toList(),
      answerIndex: (json['answerIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'q': instance.q,
      'choices': instance.choices,
      'answerIndex': instance.answerIndex,
    };
