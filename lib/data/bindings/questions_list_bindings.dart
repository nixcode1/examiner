import 'package:examiner/data/controllers/questions_controller.dart';
import 'package:examiner/data/services/api_service.dart';
import 'package:get/get.dart';

class QuestionsListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionsController>(() => QuestionsController(
          course: Get.arguments,
          apiService: Get.find<ApiService>(),
        ));
  }
}
