import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quizieee/controllers/auth_controller.dart';
import 'package:quizieee/firebase/references.dart';
import 'package:quizieee/models/models.dart' show QuizPaperModel;
import 'package:quizieee/screens/screens.dart' show QuizeScreen;
import 'package:quizieee/services/firebase/firebasestorage_service.dart';
import 'package:quizieee/utils/logger.dart';

class QuizPaperController extends GetxController {
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  final allPapers = <QuizPaperModel>[].obs;
  final allPaperImages = <String>[].obs;

  Future<void> getAllPapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await quizePaperFR.get();
      final paperList =
          data.docs.map((paper) => QuizPaperModel.fromSnapshot(paper)).toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imageUrl =
            await Get.find<FireBaseStorageService>().getImage(paper.title);
        paper.imageUrl = imageUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      AppLogger.e(e);
    }
  }

  void navigatoQuestions(
      {required QuizPaperModel paper, bool isTryAgain = false}) {
    AuthController authController = Get.find();

    if (authController.isLogedIn()) {
      if (isTryAgain) {
        Get.back();
        Get.offNamed(QuizeScreen.routeName,
            arguments: paper, preventDuplicates: false);
      } else {
        Get.toNamed(QuizeScreen.routeName, arguments: paper);
      }
    } else {
      authController.showLoginAlertDialog();
    }
  }
}
