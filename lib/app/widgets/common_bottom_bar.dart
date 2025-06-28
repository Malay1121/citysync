import 'package:citysync/app/helper/all_imports.dart';

class CommonBottomBar extends StatefulWidget {
  CommonBottomBar({super.key, required this.selectedTab});
  String selectedTab;
  @override
  State<CommonBottomBar> createState() => _CommonBottomBarState();
}

class _CommonBottomBarState extends State<CommonBottomBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 428.w(context),
      height: 65.h(context),
      child: Row(
        children: [
          for (Map tab in tabs)
            Expanded(
              child: GestureDetector(
                onTap:
                    () => Get.offAndToNamed(
                      tab["page"],
                      arguments:
                          tab["title"] == AppStrings.profile
                              ? {
                                "userId": getKey(userDetails, ["uid"], ""),
                              }
                              : null,
                    ),
                child: Container(
                  height: 47.h(context),
                  decoration: BoxDecoration(color: ColorStyle.neutralWhite),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        tab["icon"],
                        color:
                            tab["title"] == widget.selectedTab
                                ? ColorStyle.primary500
                                : ColorStyle.greyscale400,
                        size: 24.t(context),
                      ),
                      if (tab["title"] == widget.selectedTab)
                        AppText(
                          text: tab["title"],
                          height: 12.h(context),
                          centered: true,
                          style:
                              tab["title"] == widget.selectedTab
                                  ? Styles.BodyXSmallSemibold(
                                    context,
                                    ColorStyle.primary500,
                                  )
                                  : Styles.BodyXSmallRegular(
                                    context,
                                    ColorStyle.greyscale400,
                                  ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
