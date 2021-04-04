import 'package:examiner/data/models/question.dart';

abstract class ApiService {
  Future<List<QuestionModel>> getQuestions(String course);
  Future<List<String>> getCourses();

  Future<bool> addCourse(String course);

  Future<bool> addQuestion(String course, QuestionModel question);

  Future<bool> deleteQuestion(String course, QuestionModel question);

  Future<bool> updateQuestion(String course, QuestionModel question);
}
