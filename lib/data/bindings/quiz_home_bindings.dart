import 'package:examiner/data/controllers/quiz_home_controller.dart';
import 'package:examiner/data/services/api_service.dart';
import 'package:examiner/data/services/fake_service.dart';
import 'package:get/get.dart';

class QuizHomeBinding implements Bindings {
  @override
  void dependencies() {
    ApiService apiService = Get.put<ApiService>(FakeService());
    Get.lazyPut<QuizHomeController>(
        () => QuizHomeController(apiService: apiService));
  }
}
