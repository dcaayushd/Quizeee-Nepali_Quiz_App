import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizieee/configs/configs.dart';
import 'package:quizieee/controllers/controllers.dart';
import 'package:quizieee/controllers/quiz_paper/quiz_papers_controller.dart';
import 'package:quizieee/models/quiz_paper_model.dart';
import 'package:quizieee/screens/screens.dart';
import 'package:quizieee/widgets/widgets.dart';

class QuizPaperCard extends GetView<QuizPaperController> {
  const QuizPaperCard({super.key, required this.model});

  final QuizPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double padding = 10.0;
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        borderRadius: UIParameters.cardBorderRadius,
        onTap: () {
          controller.navigatoQuestions(paper: model);
        },
        child: Padding(
            padding: const EdgeInsets.all(padding),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: UIParameters.cardBorderRadius,
                      child: ColoredBox(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          child: SizedBox(
                            width: 65,
                            height: 65,
                            child: model.imageUrl == null ||
                                    model.imageUrl!.isEmpty
                                ? null
                                : Image.network(model.imageUrl!),
                          )),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: cardTitleTs(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(model.description),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: EasySeparatedRow(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(width: 15);
                            },
                            children: [
                              IconWithText(
                                  icon: Icon(Icons.help_outline_sharp,
                                      color: Colors.blue[700]),
                                  text: Text(
                                    '${model.questionsCount} quizzes',
                                    style: kDetailsTS.copyWith(
                                        color: Colors.blue[700]),
                                  )),
                              IconWithText(
                                  icon: const Icon(Icons.timer,
                                      color: Colors.blueGrey),
                                  text: Text(
                                    model.timeInMinits(),
                                    style: kDetailsTS.copyWith(
                                        color: Colors.blueGrey),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
                Positioned(
                    bottom: -padding,
                    right: -padding,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        // Get.find<NotificationService>().showQuizCompletedNotification(id: 1, title: 'Sampole', body: 'Sample', imageUrl: model.imageUrl, payload: json.encode(model.toJson())  );
                        Get.toNamed(LeaderBoardScreen.routeName,
                            arguments: model);
                      },
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(kCardBorderrRadius),
                                bottomRight:
                                    Radius.circular(kCardBorderrRadius)),
                            color: Theme.of(context).primaryColor),
                        child: const Icon(AppIcons.trophyoutline),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
