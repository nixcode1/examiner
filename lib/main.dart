import 'package:examiner/constants/app_theme.dart';
import 'package:examiner/data/bindings/home_binding.dart';
import 'package:examiner/ui/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/navigation/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.INITIAL,
        initialBinding: HomeBinding(),
        theme: appThemeData,
        defaultTransition: Transition.fade,
        // initialBinding: MyHomeBinding(),
        getPages: AppPages.pages,
        home: Homepage(),
    );
  }
}
