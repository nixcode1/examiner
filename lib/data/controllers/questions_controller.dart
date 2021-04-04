import 'package:examiner/data/models/question.dart';
import 'package:examiner/data/services/api_service.dart';
import 'package:examiner/utils/error_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class QuestionsController extends GetxController {
  final ApiService apiService;
  final String course;
  late final TextEditingController textController;

  final _questions = <QuestionModel>[].obs;
  final _loading = true.obs;

  QuestionsController({required this.apiService, required this.course});
  set questions(List<QuestionModel> value) => this._questions.value = value;
  List<QuestionModel> get questions => this._questions;

  get loading => this._loading.value;
  set loading(value) => this._loading.value = value;

  @override
  void onInit() {
    textController = TextEditingController();
    getQuestions();
    super.onInit();
  }

  void getQuestions() async {
    List<QuestionModel> fecthedQuestions =
        await apiService.getQuestions(course);
    questions = fecthedQuestions;
    loading = false;
  }

  void addOrUpdateQuestion(String id, bool edited) async {
    bool added;
    loading = true;
    if (!edited) {
      added = await apiService
          .addQuestion(course, QuestionModel(title: textController.text));
    } else {
      added = await apiService
          .updateQuestion(course, QuestionModel(id: id, title: textController.text));
    }
    if (!added) {
      loading = false;
      ErrorHandler.showError("Failed to add question");
    } else {
      getQuestions();
    }
    clearController();
  }

  void deleteQuetion(QuestionModel question) async {
    loading = true;
    bool deleted = await apiService.deleteQuestion(course, question);
    print(deleted);
    if (!deleted) {
      loading = false;
      ErrorHandler.showError("Failed to delete question");
    } else {
      getQuestions();
    }
  }

  void editQuestion(QuestionModel question) {
    textController.text = question.title;
  }

  void clearController() {
    textController.clear();
  }
}
