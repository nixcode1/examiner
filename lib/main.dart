import 'package:examiner/constants/app_theme.dart';
import 'package:examiner/data/bindings/home_binding.dart';
import 'package:examiner/ui/screens/homepage.dart';
import 'package:examiner/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/navigation/app_pages.dart';

import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
              body: Center(
                  child: Text("Unexpected error. See console for details.")));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
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

        // Otherwise, show something whilst waiting for initialization to complete
        return LoadingWidget();
      },
    );
  }
}
