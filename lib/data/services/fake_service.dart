import 'package:examiner/data/models/question.dart';
import 'package:examiner/data/services/api_service.dart';

class FakeService implements ApiService {
  Map<String, List<QuestionModel>> courseList = {
    "Anatomy": [],
    "Physiology": [],
    "Biochemistry": [],
    "New": []
  };

  final List<QuestionModel> fakeList = List<QuestionModel>.generate(10,
      (index) => QuestionModel(id: "$index", title: "Test Question $index"));

  List<QuestionModel> generateCourseList(String course) {
    return List<QuestionModel>.generate(
        10,
        (index) =>
            QuestionModel(id: "$index", title: "$course Question $index"));
  }

  FakeService() {
    courseList.updateAll((key, value) => generateCourseList(key));
    print(courseList);
  }

  @override
  Future<bool> addQuestion(String course, QuestionModel question) async {
    question.id = courseList[course]!.length.toString();
    courseList[course]!.add(question);
    return courseList[course]!.contains(question);
  }

  @override
  Future<List<QuestionModel>> getQuestions(String course) async {
    return Future.delayed(Duration(seconds: 2), () => courseList[course]!);
  }

  @override
  Future<bool> deleteQuestion(String course, QuestionModel question) async {
    courseList[course]!.removeWhere((element) => element.id == question.id);
    return !courseList[course]!.contains(question);
    
  }

  @override
  Future<bool> updateQuestion(String course, QuestionModel question) async {
    courseList[course]![
        courseList[course]!.indexWhere((e) => e.id == question.id)] = question;
    return courseList[course]!.contains(question);
  }

  @override
  Future<List<String>> getCourses() async {
    return courseList.keys.toList();
  }

  @override
  Future<bool> addCourse(String course) async {
    courseList[course] = [];
    return true;
  }

  
}
