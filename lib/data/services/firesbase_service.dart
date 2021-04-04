import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examiner/data/models/question.dart';
import 'package:examiner/data/services/api_service.dart';

class FirebaseService implements ApiService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference courses = firestore.collection('courses');
  String questionCollection = 'questions';
  @override
  Future<bool> addCourse(String course) async {
    try {
      await courses.doc(course).set({'title': course});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> addQuestion(String course, QuestionModel question) async {
    DocumentReference docRef = courses.doc(course).collection(questionCollection).doc();
    question.id = docRef.id;
    try {
      await courses.doc(course).collection(questionCollection).doc(docRef.id).set(question.toJson());
      return true;
    } catch(err) {
      print(err);
      return false;
    }
  }

  @override
  Future<bool> deleteQuestion(String course, QuestionModel question) async {
    try {
      await courses.doc(course).collection(questionCollection).doc(question.id).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<List<String>> getCourses() async {
    QuerySnapshot query = await courses.get();
    return query.docs.map((doc) => '${doc['title']}').toList();
  }

  @override
  Future<List<QuestionModel>> getQuestions(String course) async {
    try {
      QuerySnapshot query =
          await courses.doc(course).collection(questionCollection).get();
      return query.docs
          .map((doc) => QuestionModel.fromJson(doc.data()!))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<bool> updateQuestion(String course, QuestionModel question) async {
    try {
      await courses.doc(course).collection(questionCollection).doc(question.id).update(question.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
