import 'package:examiner/data/bindings/questions_list_bindings.dart';
import 'package:examiner/data/bindings/quiz_bindings.dart';
import 'package:examiner/data/bindings/quiz_home_bindings.dart';
import 'package:examiner/ui/screens/course_list.dart';
import 'package:examiner/ui/screens/homepage.dart';
import 'package:examiner/ui/screens/questions_list.dart';
import 'package:examiner/ui/screens/quiz_home.dart';
import 'package:examiner/ui/screens/quiz_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => Homepage(),
    ),
    GetPage(
      name: Routes.QUIZHOME,
      page: () => QuizHomePage(),
      binding: QuizHomeBinding(),
    ),
    GetPage(
      name: Routes.QUIZPAGE,
      page: () => QuizPage(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: Routes.COURSELIST,
      page: () => CourseListPage(),
    ),
    GetPage(
      name: Routes.QUESTIONSLIST,
      page: () => QuestionsListPage(),
      binding: QuestionsListBinding(),
    ),
  ];
}
