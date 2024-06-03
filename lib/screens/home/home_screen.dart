import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:quizieee/configs/configs.dart';
import 'package:quizieee/controllers/controllers.dart';
import 'package:quizieee/widgets/widgets.dart';

import 'custom_drawer.dart';

class HomeScreen extends GetView<MyDrawerController> {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    QuizPaperController quizePprController = Get.find();
    return Scaffold(
        body: GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        borderRadius: 50.0,
        showShadow: true,
        angle: 0.0,
        style: DrawerStyle.defaultStyle,
        menuScreen: const CustomDrawer(),
        menuBackgroundColor: Colors.white.withOpacity(0.5),
        slideWidth: MediaQuery.of(context).size.width * 0.6,
        mainScreen: Container(
          decoration: BoxDecoration(gradient: mainGradient(context)),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(kMobileScreenPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: const Offset(-10, 0),
                        child: CircularButton(
                          onTap: controller.toggleDrawer,
                          child: const Icon(AppIcons.menuLeft),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const Icon(AppIcons.peace),
                            Builder(
                              builder: (_) {
                                final AuthController auth = Get.find();
                                final user = auth.getUser();
                                String label = '  Hello mate';
                                if (user != null) {
                                  label = '  Hello ${user.displayName}';
                                }
                                return Text(label,
                                    style: kDetailsTS.copyWith(
                                        color: kOnSurfaceTextColor));
                              },
                            ),
                          ],
                        ),
                      ),
                      const Text('What Do You Want To Improve Today ?',
                          style: kHeaderTS),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ContentArea(
                      addPadding: false,
                      child: Obx(
                        () => LiquidPullToRefresh(
                          height: 150,
                          springAnimationDurationInMilliseconds: 500,
                          //backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          onRefresh: () async {
                            quizePprController.getAllPapers();
                          },
                          child: ListView.separated(
                            padding: UIParameters.screenPadding,
                            shrinkWrap: true,
                            itemCount: quizePprController.allPapers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return QuizPaperCard(
                                model: quizePprController.allPapers[index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
