import 'dart:math';

import '../../../helper/all_imports.dart';
import '../controllers/issue_controller.dart';

class IssueView extends GetView<IssueController> {
  const IssueView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IssueController>(
      init: IssueController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorStyle.neutralWhite,
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 56.h(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 24.t(context),
                                    color: ColorStyle.greyscale900,
                                  ),
                                ),
                                AppText(
                                  text: AppStrings.issue,
                                  style: Styles.Heading3(
                                    context,
                                    ColorStyle.greyscale900,
                                  ),
                                ),
                                SizedBox(width: 24.t(context)),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h(context)),
                          CommonImage(
                            imageUrl: getKey(controller.issue, ["image"], ""),
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(12),
                            height: 216.h(context),
                            width: 328.w(context),
                            type: "network",
                          ),
                          SizedBox(height: 24.h(context)),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: getKey(controller.issue, [
                                      "title",
                                    ], ""),
                                    style: Styles.Body16pxBold(
                                      context,
                                      ColorStyle.neutralBlack800,
                                    ),
                                    width: 328.w(context),
                                    maxLines: null,
                                    minFontSize:
                                        16.t(context).floor().toDouble(),
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8.h(context)),
                                  AppText(
                                    text: formatDateTime(
                                      fromUtc(
                                        getKey(controller.issue, [
                                          "created_at",
                                        ], ""),
                                      ),
                                    ),
                                    style: Styles.Body13pxRegular(
                                      context,
                                      ColorStyle.neutralBlack700,
                                    ),
                                    width: 328.w(context),
                                    maxLines: null,
                                    minFontSize:
                                        13.t(context).floor().toDouble(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h(context)),

                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: ColorStyle.primary500,
                                size: 16.t(context),
                              ),
                              SizedBox(width: 4.w(context)),
                              AppText(
                                text: getKey(controller.issue, [
                                  "location",
                                ], ""),
                                overflow: TextOverflow.ellipsis,
                                minFontSize: 13.t(context).floorToDouble(),
                                style: Styles.Body13pxSemibold(
                                  context,
                                  ColorStyle.neutralBlack500,
                                ),
                                width: 300.w(context),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h(context)),
                          Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_up_rounded,
                                size: 16.t(context),
                                color: ColorStyle.primary500,
                              ),
                              SizedBox(width: 4.w(context)),
                              AppText(
                                text:
                                    getKey(controller.issue, [
                                      "upvotes",
                                    ], 0).toString() +
                                    " " +
                                    AppStrings.upvotes,
                                overflow: TextOverflow.ellipsis,
                                minFontSize: 13.t(context).floorToDouble(),
                                style: Styles.Body13pxSemibold(
                                  context,
                                  ColorStyle.neutralBlack500,
                                ),
                                width: 300.w(context),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h(context)),
                          AppText(
                            text: AppStrings.issuer,
                            style: Styles.Heading19pxBold(
                              context,
                              ColorStyle.neutralBlack800,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8.h(context)),
                          Container(
                            height: 76.h(context),
                            width: 328.w(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: ColorStyle.greyscale100,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 12.h(context),
                                horizontal: 12.h(context),
                              ),
                              child: Row(
                                children: [
                                  CommonImage(
                                    imageUrl: getKey(controller.issue, [
                                      "issuer_data",
                                      "profile_picture",
                                    ], ""),
                                    fit: BoxFit.cover,
                                    height: min(52.h(context), 52.w(context)),
                                    width: min(52.h(context), 52.w(context)),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  SizedBox(width: 8.w(context)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 6.h(context)),
                                      AppText(
                                        text: getKey(controller.issue, [
                                          "issuer_data",
                                          "name",
                                        ], ""),
                                        style: Styles.Body16pxBold(
                                          context,
                                          ColorStyle.neutralBlack800,
                                        ),
                                      ),
                                      SizedBox(height: 5.h(context)),
                                      AppText(
                                        text:
                                            "${AppStrings.joinedOn} ${formatDateTime(fromUtc(getKey(controller.issue, ["issuer_data", "created_at"], "")))}",
                                        style: Styles.Body13pxRegular(
                                          context,
                                          ColorStyle.neutralBlack700,
                                        ),
                                        minFontSize:
                                            13.t(context).floorToDouble(),
                                        overflow: TextOverflow.ellipsis,
                                        width: 240.w(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h(context)),
                          AppText(
                            text: AppStrings.aboutTheIssue,
                            style: Styles.Body16pxBold(
                              context,
                              ColorStyle.neutralBlack800,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4.h(context)),
                          AppText(
                            text:
                                getKey(controller.issue, [
                                  "description",
                                ], "").substring(
                                  0,
                                  controller.readMore
                                      ? null
                                      : min(
                                        getKey(controller.issue, [
                                          "description",
                                        ], "").length,
                                        524,
                                      ),
                                ) +
                                (controller.readMore ? "" : "..."),
                            style: Styles.Body13pxRegular(
                              context,
                              ColorStyle.neutralBlack700,
                            ),
                            maxLines: null,
                          ),
                          SizedBox(height: 4.h(context)),
                          GestureDetector(
                            onTap: () {
                              controller.readMore = !controller.readMore;
                              controller.update();
                            },
                            child: AppText(
                              text: AppStrings.readMore,
                              style: Styles.Body13pxBold(
                                context,
                                ColorStyle.additionalSky200,
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h(context)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h(context)),
                StreamBuilder(
                  stream:
                      FirebaseFirestore.instance
                          .collection("upvotes")
                          .where("user", isEqualTo: controller.user?.uid ?? "")
                          .where(
                            "issue",
                            isEqualTo: getKey(controller.issue, ["id"], "1"),
                          )
                          .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(
                        color: ColorStyle.primary500,
                      );
                    }

                    if (!snapshot.hasData || snapshot.data == null) {
                      return SizedBox();
                    }

                    bool registered = snapshot.data!.docs.isNotEmpty;

                    return CommonButton(
                      onTap:
                          () async =>
                              registered
                                  ? await DatabaseHelper.removeVote(
                                    issueId: getKey(controller.issue, [
                                      "id",
                                    ], ""),
                                    userId: controller.user?.uid ?? "",
                                  )
                                  : await DatabaseHelper.upvote(
                                    issueId: getKey(controller.issue, [
                                      "id",
                                    ], ""),
                                    userId: controller.user?.uid ?? "",
                                  ),
                      text:
                          registered
                              ? AppStrings.removeVote
                              : AppStrings.upvote,
                      borderRadius: BorderRadius.circular(12),
                      backgroundColor:
                          registered
                              ? Colors.transparent
                              : ColorStyle.primary500,
                      border:
                          registered
                              ? Border.all(color: ColorStyle.alertError100)
                              : null,
                      textColor:
                          registered
                              ? ColorStyle.alertError100
                              : ColorStyle.neutralWhite,
                    );
                  },
                ),
                SizedBox(height: 12.h(context)),
              ],
            ),
          ),
        );
      },
    );
  }
}
