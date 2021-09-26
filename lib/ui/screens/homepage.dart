import 'package:examiner/data/controllers/home_controller.dart';
import 'package:examiner/data/navigation/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Examiner")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.bottomSheet(
          Container(
            width: context.width,
            height: context.height * 0.1,
            color: Colors.white,
            child: TextField(),
          ),
        ),
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          width: context.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(Routes.QUIZHOME),
                child: Card(
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          "Theory Generator",
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
