import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:examiner/data/controllers/quiz_controller.dart';
import 'package:examiner/ui/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizPage extends GetView<QuizController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QuizPage')),
      floatingActionButton: Obx(
        () => !controller.loaded
            ? SizedBox.shrink()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  _button(
                      title: "Start", onPressed: () => controller.startTimer()),
                  SizedBox(
                    width: 10,
                  ),
                  _button(
                      title: "Pause",
                      onPressed: () => controller.countDownController.pause()),
                  SizedBox(
                    width: 10,
                  ),
                  _button(
                      title: "Resume",
                      onPressed: () => controller.countDownController.resume()),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: CircularCountDownTimer(
                  duration: controller.duration,
                  initialDuration: 0,
                  controller: controller.countDownController,
                  width: 200,
                  height: 200,
                  ringColor: Colors.grey[300]!,
                  ringGradient: null,
                  fillColor: Colors.purpleAccent[100]!,
                  fillGradient: null,
                  backgroundColor: Colors.purple[500],
                  backgroundGradient: null,
                  strokeWidth: 20.0,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(
                      fontSize: 33.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.HH_MM_SS,
                  isReverse: true,
                  isReverseAnimation: true,
                  isTimerTextShown: true,
                  autoStart: false,
                  onStart: () {
                    print('Countdown Started');
                  },
                  onComplete: () {
                    print('Countdown Ended');
                  },
                ),
              ),
              Obx(
                () => controller.loaded
                    ? Container(
                        height: context.height / 2,
                        child: ListView(
                          children: controller.questions
                              .map((question) =>
                                  QuestionCard(question: question))
                              .toList(),
                        ),
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
              ElevatedButton(onPressed: () => controller.countDownController.getTime(), child: Text("Text"))
            ],
          ),
        ),
      ),
    );
  }

  _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
        child: ElevatedButton(
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
    ));
  }
}
