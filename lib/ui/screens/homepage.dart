import 'package:examiner/data/controllers/home_controller.dart';
import 'package:examiner/data/navigation/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Examiner")),
      body: SafeArea(
        child: Container(
          width: context.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.QUIZHOME),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Column(
                      children: [Text("Theory Generator")],
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
