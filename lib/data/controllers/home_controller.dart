import 'package:get/get.dart';

class HomeController extends GetxController {

  final _title = ''.obs;
  final _count = 0.obs;
  get count => this._count.value;
  set obj(value) => this._title.value = value;
  get obj => this._title.value;

  increment() {
    _count.value++;
  }
}