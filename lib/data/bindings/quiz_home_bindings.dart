import 'package:examiner/data/controllers/quiz_home_controller.dart';
import 'package:examiner/data/services/api_service.dart';
import 'package:examiner/data/services/firesbase_service.dart';
import 'package:get/get.dart';

class QuizHomeBinding implements Bindings {
  @override
  void dependencies() {
    ApiService apiService = Get.put<ApiService>(FirebaseService());
    Get.lazyPut<QuizHomeController>(
        () => QuizHomeController(apiService: apiService));
  }
}
