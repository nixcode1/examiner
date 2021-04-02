import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  final String question;

  const QuestionCard({Key? key, required this.question}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width: context.width,
        child: Center(
          child: Text(question, style: Theme.of(context).textTheme.subtitle1),
        ),
      ),
    );
  }
}
