import 'package:examiner/data/controllers/questions_controller.dart';
import 'package:examiner/data/models/question.dart';
import 'package:examiner/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class QuestionsListPage extends GetView<QuestionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyPage')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(context, false, ""),
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.all(10),
            child: Obx(
              () => controller.loading
                  ? LoadingWidget()
                  : ListView(
                      children: controller.questions
                          .map((QuestionModel e) => slidable(
                                onEdit: () {
                                  controller.editQuestion(e);
                                  showDialog(context, true, e.id!);
                                },
                                onDelete: () => showDeleteDialog(context, e),
                                tile: Card(
                                  child: ListTile(
                                      minVerticalPadding: 10,
                                      title: Text(
                                        e.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      )),
                                ),
                              ))
                          .toList(),
                    ),
            )),
      ),
    );
  }

  void showDialog(BuildContext context, bool edited, String id) {
    Get.defaultDialog(
        title: "Add a new Question",
        content: TextField(
          controller: controller.textController,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
        onConfirm: () {
          controller.addOrUpdateQuestion(id, edited);
          Get.back();
        },
        onCancel: () => controller.clearController());
  }

  void showDeleteDialog(BuildContext context, QuestionModel question) {
    Get.defaultDialog(
        title: "Delete this question",
        middleText: '',
        onConfirm: () {
          controller.deleteQuetion(question);
          Get.back();
        },
        onCancel: () {});
  }

  Widget slidable(
      {Widget? tile, VoidCallback? onEdit, VoidCallback? onDelete}) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: tile!,
      secondaryActions: <Widget>[
        IconSlideAction(
            caption: 'Edit',
            color: Colors.green,
            icon: Icons.edit,
            onTap: onEdit),
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: onDelete),
      ],
    );
  }
}
