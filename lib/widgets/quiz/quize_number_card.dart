import 'package:flutter/material.dart';
import 'package:quizieee/configs/configs.dart';
import 'package:quizieee/widgets/widgets.dart';

class QuizNumberCard extends StatelessWidget {
  const QuizNumberCard({
    super.key,
    required this.index,
    required this.status,
    required this.onTap,
  });

  final int index;
  final AnswerStatus? status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).primaryColor;

    switch (status) {
      case AnswerStatus.answered:
        backgroundColor = Theme.of(context).primaryColor;
        break;
      case AnswerStatus.correct:
        backgroundColor = kCorrectAnswerColor;
        break;
      case AnswerStatus.wrong:
        backgroundColor = kWrongAnswerColor;
        break;
      case AnswerStatus.notanswered:
        backgroundColor = Theme.of(context).primaryColor.withOpacity(0.1);
        break;
      default:
        backgroundColor = Theme.of(context).primaryColor.withOpacity(0.1);
    }

    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: UIParameters.cardBorderRadius),
        child: Center(
          child: Text(
            '$index',
            style: kQuizeNumberCardTs.copyWith(
                color: status == AnswerStatus.notanswered
                    ? Theme.of(context).primaryColor
                    : null),
          ),
        ),
      ),
    );
  }
}
