import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizieee/controllers/controllers.dart';
import 'package:quizieee/firebase/firebase_configs.dart';

// ignore: must_be_immutable
class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  PapersDataUploader controller = Get.put(PapersDataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Obx(() => Text(
              controller.loadingStatus.value == LoadingStatus.completed
                  ? "Uploading Complete"
                  : "Uploading...."))),
    );
  }
}
