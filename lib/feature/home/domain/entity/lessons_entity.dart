class LessonEntity {
  final String id;
  final String title;
  final int ageMin;
  final int ageMax;
  final String icon;
  final List<QuestionEntity> questions;

  LessonEntity({
    required this.id,
    required this.title,
    required this.ageMin,
    required this.ageMax,
    required this.icon,
    required this.questions,
  });
}

class QuestionEntity {
  final String question;
  final List<String> choices;
  final int answerIndex;

  QuestionEntity({
    required this.question,
    required this.choices,
    required this.answerIndex,
  });
}
