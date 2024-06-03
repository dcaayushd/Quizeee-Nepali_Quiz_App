import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizieee/configs/configs.dart';
import 'package:quizieee/screens/quiz/quiz_overview_screen.dart';
import 'package:quizieee/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = '',
    this.showActionIcon = false,
    this.leading,
    this.titleWidget,
    this.onMenuActionTap,
  });

  final String title;
  final Widget? titleWidget;
  final bool showActionIcon;
  final Widget? leading;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kMobileScreenPadding,
              vertical: kMobileScreenPadding / 1.2),
          child: Stack(
            children: [
              Positioned.fill(
                child: titleWidget == null
                    ? Center(child: Text(title, style: kAppBarTS))
                    : Center(child: titleWidget!),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  leading ??
                      Transform.translate(
                          offset: const Offset(-14, 0),
                          child:
                              const BackButton()), // transform to align icons with body content
                  if (showActionIcon)
                    Transform.translate(
                      offset: const Offset(10,
                          0), // transform to align icons with body content =>  - CircularButton.padding
                      child: CircularButton(
                        onTap: onMenuActionTap ??
                            () {
                              Get.toNamed(QuizOverviewScreen.routeName);
                            },
                        child: const Icon(AppIcons.menu),
                      ),
                    )
                ],
              ),
            ],
          )),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        80,
      );
}
