import 'package:examiner/data/controllers/quiz_home_controller.dart';
import 'package:get/get.dart';

class QuizHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizHomeController>(() => QuizHomeController());
  }
}
