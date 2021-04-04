import 'package:examiner/data/controllers/quiz_controller.dart';
import 'package:examiner/data/controllers/quiz_home_controller.dart';
import 'package:examiner/data/services/api_service.dart';
import 'package:get/get.dart';

class QuizBinding implements Bindings {
  @override
  void dependencies() {
    QuizHomeController quizHome = Get.find<QuizHomeController>();
    Get.put<QuizController>(QuizController(
      count: quizHome.questionsCount,
      subject: quizHome.subject,
      hours: quizHome.hours,
      api: Get.find<ApiService>(),
    ));
  }
}
