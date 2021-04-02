import 'package:get/get.dart';

class QuizHomeController extends GetxController {
  final _subject = "Anatomy".obs;
  final _hours = 2.0.obs;
  final _questionsCount = 6.obs;

  String get subject => _subject.value;
  double get hours => _hours.value;
  int get questionsCount => _questionsCount.value;

  set subject(value) => _subject.value = value;
  set hours(double value) => _hours.value = value;
  set questionsCount(value) => _questionsCount.value = value;

  incrementQuestions() {
    if(questionsCount < 15) {
      _questionsCount.value++;
    }
  }

  decrementQuestions() {
    if (questionsCount > 0) {
      _questionsCount.value--;
    }
  }

  List<String> subjectOptions = ["Anatomy", "Physiology", "Biochemistry"];
}
