import 'package:examiner/data/services/api_service.dart';
import 'package:get/get.dart';

class QuizHomeController extends GetxController {
  final _subject = "Anatomy".obs;
  final _hours = 2.0.obs;
  final _questionsCount = 6.obs;
  final _courseList = <String>[].obs;
  final _isLoading = true.obs;
  final ApiService apiService;

  QuizHomeController({required this.apiService});

  String get subject => _subject.value;
  double get hours => _hours.value;
  int get questionsCount => _questionsCount.value;
  List<String> get courseList => _courseList;
  bool get isLoading => _isLoading.value;

  set subject(value) => _subject.value = value;
  set hours(double value) => _hours.value = value;
  set questionsCount(value) => _questionsCount.value = value;
  set courseList(List<String> value) => _courseList.value = value;
  set isLoading(bool value) => _isLoading.value = value;

  @override
  onInit() {
    getCourseList();
    super.onInit();
  }

  void getCourseList() async {
    courseList = await apiService.getCourses();
    isLoading = false;
  }

  void addCourse(String course) async {
    isLoading = true;
    bool added = await apiService.addCourse(course.capitalizeFirst!);
    if(added) {
      getCourseList();
    } else {
      isLoading = false;
    }
  }

  incrementQuestions() {
    if (questionsCount < 15) {
      _questionsCount.value++;
    }
  }

  decrementQuestions() {
    if (questionsCount > 0) {
      _questionsCount.value--;
    }
  }
}
