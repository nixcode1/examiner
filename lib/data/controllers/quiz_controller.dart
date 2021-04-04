import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:examiner/data/models/question.dart';
import 'package:examiner/data/services/api_service.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  final int? count;
  final String? subject;
  final double? hours;
  final ApiService api;
  late CountDownController countDownController;

  final _loaded = false.obs;
  List<QuestionModel> questions = <QuestionModel>[].obs;

  QuizController({this.count, this.subject, this.hours, required this.api});

  @override
  void onInit() {
    countDownController = CountDownController();
    fetchQuestions();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  get loaded => _loaded.value;
  int get duration => hours!.hours.inSeconds;

  void fetchQuestions() async {
    List<QuestionModel> fetchedQuestions = await api.getQuestions("anatomy");
    fetchedQuestions.shuffle();
    questions = fetchedQuestions.sublist(0, count! + 1);
    print(questions);
    _loaded.value = true;
  }

  void startTimer() {
    print("Start called");
    countDownController.start();
  }
}
