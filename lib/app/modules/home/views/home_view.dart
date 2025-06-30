import 'package:citysync/app/helper/all_imports.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorStyle.neutralWhite,
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 360.w(context),
                          height: 176.h(context),
                          decoration: BoxDecoration(
                            color: ColorStyle.primary500,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 28.w(context),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 24.h(context)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          AppText(
                                            text: AppStrings.yourDeeds,
                                            style: Styles.Body13pxRegular(
                                              context,
                                              ColorStyle.surface500,
                                            ),
                                          ),
                                          SizedBox(width: 4.w(context)),
                                          CommonImage(
                                            imageUrl: AppImages.icEye,
                                            fit: BoxFit.contain,
                                            type: "asset",
                                            width: 20.w(context),
                                            height: 20.h(context),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4.h(context)),
                                      StreamBuilder(
                                        stream:
                                            FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(controller.user?.uid ?? "")
                                                .snapshots(),
                                        builder: (context, snapshot) {
                                          int deeds = getKey(
                                            (snapshot.data?.data() as Map?) ??
                                                {},
                                            ["deeds"],
                                            0,
                                          );
                                          return Row(
                                            children: [
                                              CommonImage(
                                                imageUrl: AppImages.icDeedWhite,
                                                fit: BoxFit.contain,
                                                width: 20.w(context),
                                                height: 20.h(context),
                                                type: "asset",
                                              ),
                                              SizedBox(width: 4.w(context)),
                                              AppText(
                                                text: deeds.toString(),
                                                style:
                                                    Styles.Heading19pxExtraBold(
                                                      context,
                                                      ColorStyle.surface500,
                                                    ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 174.w(context),
                                    height: 40.h(context),
                                    decoration: BoxDecoration(
                                      color: ColorStyle.neutralWhite,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w(context),
                                      vertical: 12.h(context),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 16.h(context),
                                          decoration: BoxDecoration(
                                            color: ColorStyle.alertSuccess25,
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.w(context),
                                          ),
                                          child: AppText(
                                            text: "200",
                                            centered: true,
                                            style: Styles.Body13pxMedium(
                                              context,
                                              ColorStyle.alertSuccess300,
                                            ),
                                          ),
                                        ),
                                        AppText(
                                          text: AppStrings.badges,
                                          style: Styles.Body13pxSemibold(
                                            context,
                                            ColorStyle.neutralBlack800,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 16.t(context),
                                          color: ColorStyle.greyscale900,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w(context),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24.h(context)),
                              AppText(
                                text: AppStrings.sharingKindness,
                                style: Styles.Body16pxBold(
                                  context,
                                  ColorStyle.greyscale500,
                                ),
                              ),
                              SizedBox(height: 12.h(context)),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (Map act in controller.acts)
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: 12.w(context),
                                        ),
                                        child: SizedBox(
                                          width: 73.w(context),
                                          height: 62.h(context),
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 40.w(context),
                                                  height: 40.h(context),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: ColorStyle.primary50,
                                                  ),
                                                  child: Center(
                                                    child: CommonImage(
                                                      imageUrl: getKey(act, [
                                                        "image",
                                                      ], ""),
                                                      fit: BoxFit.contain,
                                                      type: "asset",
                                                      height: 20.h(context),
                                                      width: 20.w(context),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 4.h(context)),
                                                AppText(
                                                  text: getKey(act, [
                                                    "title",
                                                  ], ""),
                                                  width: 73.w(context),
                                                  centered: true,
                                                  style: Styles.Body13pxMedium(
                                                    context,
                                                    ColorStyle.neutralBlack700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 24.h(context)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text: AppStrings.newEvents,
                                    style: Styles.Body16pxBold(
                                      context,
                                      ColorStyle.greyscale500,
                                    ),
                                  ),
                                  AppText(
                                    text: AppStrings.seeAll,
                                    style: Styles.Body11pxMedium(
                                      context,
                                      ColorStyle.primary500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h(context)),
                              FutureBuilder(
                                future: DatabaseHelper.getEvents(limit: 5),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData ||
                                      snapshot.data == null) {
                                    return SizedBox();
                                  }
                                  List events = snapshot.data;
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        for (Map event in events)
                                          CommonEventCard(event: event),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 24.h(context)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text: AppStrings.latestIssues,
                                    style: Styles.Body16pxBold(
                                      context,
                                      ColorStyle.greyscale500,
                                    ),
                                  ),
                                  AppText(
                                    text: AppStrings.seeAll,
                                    style: Styles.Body11pxMedium(
                                      context,
                                      ColorStyle.primary500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h(context)),
                              FutureBuilder(
                                future: DatabaseHelper.getIssues(limit: 5),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData ||
                                      snapshot.data == null) {
                                    return SizedBox();
                                  }
                                  List issues = snapshot.data;
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        for (Map issue in issues)
                                          CommonIssueCard(
                                            issue: issue,
                                            user: controller.user!,
                                          ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 32.h(context)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CommonBottomBar(selectedTab: AppStrings.home),
              ],
            ),
          ),
        );
      },
    );
  }
}
