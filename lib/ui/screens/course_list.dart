import 'package:examiner/data/controllers/quiz_home_controller.dart';
import 'package:examiner/data/navigation/app_pages.dart';
import 'package:examiner/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseListPage extends GetView<QuizHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Course List')),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: showAddDialog, label: Text("Add course")),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
          child: Obx(
            () => controller.isLoading
                ? LoadingWidget()
                : ListView(
                    children: [
                      for (String course in controller.courseList)
                        Card(
                          child: ListTile(
                            onTap: () => Get.toNamed(Routes.QUESTIONSLIST,
                                arguments: course),
                            contentPadding: EdgeInsets.all(10),
                            title: Text(
                              course,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        )
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  void showAddDialog() {
    String course = '';
    Get.defaultDialog(
        title: "Add a Course",
        content: TextField(
          onChanged: (String value) => course = value,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
        onConfirm: () {
          if (course.isNotEmpty) {
            controller.addCourse(course);
            Get.back();
          }
        },
        onCancel: () {});
  }
}
