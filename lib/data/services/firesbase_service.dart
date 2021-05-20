import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examiner/data/models/question.dart';
import 'package:examiner/data/services/api_service.dart';

class FirebaseService implements ApiService {
  final coursesRef = FirebaseFirestore.instance.collection('courses');
  final questionRef = FirebaseFirestore.instance.collection('courses').doc();
  String questionCollection = 'questions';
  @override
  Future<bool> addCourse(String course) async {
    try {
      await coursesRef.doc(course).set({'title': course});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> addQuestion(String course, QuestionModel question) async {
    final docRef = getQuestionRef(course).doc();
    // coursesRef.doc(course).collection(questionCollection).doc();
    question.id = docRef.id;
    try {
      await getQuestionRef(course)
          .doc(docRef.id)
          .set(question);
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  @override
  Future<bool> deleteQuestion(String course, QuestionModel question) async {
    try {
      await getQuestionRef(course)
          .doc(question.id)
          .delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<List<String>> getCourses() async {
    QuerySnapshot query = await coursesRef.get();
    return query.docs.map((doc) => '${doc['title']}').toList();
  }

  @override
  Future<List<QuestionModel>> getQuestions(String course) async {
    try {
      // QuerySnapshot query =
      //     await coursesRef.doc(course).collection(questionCollection).get();
      return getQuestionRef(course)
          .get()
          .then((value) => value.docs.map((e) => e.data()).toList());
      // return query.docs
      //     .map((doc) => QuestionModel.fromJson(doc.data()))
      //     .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<bool> updateQuestion(String course, QuestionModel question) async {
    try {
      await getQuestionRef(course)
          .doc(question.id)
          .update(question.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  CollectionReference<QuestionModel> getQuestionRef(String course) {
    return coursesRef
        .doc(course)
        .collection(questionCollection)
        .withConverter<QuestionModel>(
            fromFirestore: (snapshots, _) =>
                QuestionModel.fromJson(snapshots.data()!),
            toFirestore: (question, _) => question.toJson());
  }
}
