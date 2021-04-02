import 'package:examiner/data/services/api_service.dart';

class FakeService implements ApiService {

  final List<String> fakeList = List<String>.generate(20, (index) => "Test Question $index" );

  @override
  bool addQuetion() {
    return true;
  }

  @override
  Future<List<String>> getQuestions() {
    return Future.delayed(Duration(seconds: 2), () => fakeList);
  }
  
}