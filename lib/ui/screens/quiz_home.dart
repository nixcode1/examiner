import 'package:examiner/data/controllers/quiz_home_controller.dart';
import 'package:examiner/data/navigation/app_pages.dart';
import 'package:examiner/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizHomePage extends GetView<QuizHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz Details')),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Get.toNamed(Routes.COURSELIST),
          label: Text("Manage Questions")),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading
              ? LoadingWidget()
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Select Subject:",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                              _dropDown(context),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "Select hours",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Obx(
                                () => Slider(
                                    value: controller.hours,
                                    min: 0,
                                    max: 4,
                                    divisions: 8,
                                    label:
                                        "${controller.hours.toString()} hours",
                                    onChanged: (double value) =>
                                        controller.hours = value),
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Text(
                                  "Select Number of questions",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    color: Theme.of(context).accentColor,
                                    onPressed: () =>
                                        controller.decrementQuestions(),
                                    iconSize: 38,
                                    icon: Icon(Icons.remove_circle_rounded),
                                  ),
                                  Obx(() => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          controller.questionsCount.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                      )),
                                  IconButton(
                                    color: Theme.of(context).accentColor,
                                    onPressed: () =>
                                        controller.incrementQuestions(),
                                    iconSize: 38,
                                    icon: Icon(Icons.add_circle_rounded),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () => Get.toNamed(Routes.QUIZPAGE),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Generate Questions",
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

  Widget _dropDown(BuildContext context) {
    return Obx(
      () => DropdownButton<String>(
        value: controller.subject,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: Theme.of(context).textTheme.subtitle2,
        onChanged: (String? newValue) => controller.subject = newValue,
        items:
            controller.courseList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
