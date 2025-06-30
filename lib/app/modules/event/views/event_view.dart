import 'dart:math';

import 'package:citysync/app/helper/all_imports.dart';

import '../controllers/event_controller.dart';

class EventView extends GetView<EventController> {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
      init: EventController(),
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
                                  text: AppStrings.event,
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
                            imageUrl: getKey(controller.event, ["image"], ""),
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
                                    text: getKey(controller.event, [
                                      "title",
                                    ], ""),
                                    style: Styles.Body16pxBold(
                                      context,
                                      ColorStyle.neutralBlack800,
                                    ),
                                    width: 227.w(context),
                                    maxLines: null,
                                    minFontSize:
                                        16.t(context).floor().toDouble(),
                                  ),
                                  SizedBox(height: 8.h(context)),
                                  AppText(
                                    text: formatDateTime(
                                      fromUtc(
                                        getKey(controller.event, [
                                          "start_time",
                                        ], ""),
                                      ),
                                    ),
                                    style: Styles.Body13pxRegular(
                                      context,
                                      ColorStyle.neutralBlack700,
                                    ),
                                    width: 227.w(context),
                                    maxLines: null,
                                    minFontSize:
                                        13.t(context).floor().toDouble(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              //TODO: Fix category text overflow
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w(context),
                                  vertical: 6.h(context),
                                ),
                                decoration: BoxDecoration(
                                  color: ColorStyle.primary50,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: AppText(
                                  text: getKey(controller.event, [
                                    "category",
                                  ], ""),
                                  style: Styles.Body11pxSemibold(
                                    context,
                                    ColorStyle.primary500,
                                  ),
                                  maxLines: null,
                                  width: 60.w(context),
                                ),
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
                                text: getKey(controller.event, [
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
                          SizedBox(height: 4.h(context)),
                          Row(
                            children: [
                              Center(
                                child: CommonImage(
                                  imageUrl: AppImages.icDeedGreen,
                                  fit: BoxFit.contain,
                                  height: 16.h(context),
                                  width: 16.w(context),
                                  type: "asset",
                                ),
                              ),
                              SizedBox(width: 4.w(context)),
                              AppText(
                                text:
                                    "Earn "
                                    "${getKey(controller.event, ["deeds"], 0)} Deeds",
                                overflow: TextOverflow.ellipsis,
                                minFontSize: 13.t(context).floorToDouble(),
                                style: Styles.Body13pxSemibold(
                                  context,
                                  ColorStyle.primary500,
                                ),
                                width: 250.w(context),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h(context)),
                          AppText(
                            text: AppStrings.organizer,
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
                                    imageUrl: getKey(controller.event, [
                                      "organizer_data",
                                      "image",
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
                                      Row(
                                        children: [
                                          AppText(
                                            text: getKey(controller.event, [
                                              "organizer_data",
                                              "name",
                                            ], ""),
                                            style: Styles.Body16pxBold(
                                              context,
                                              ColorStyle.neutralBlack800,
                                            ),
                                          ),
                                          SizedBox(width: 12.w(context)),
                                          if (getKey(controller.event, [
                                            "organizer_data",
                                            "verified",
                                          ], ""))
                                            CommonImage(
                                              imageUrl: AppImages.icVerified,
                                              fit: BoxFit.contain,
                                              width: 16.w(context),
                                              height: 16.h(context),
                                              type: "asset",
                                            ),
                                        ],
                                      ),
                                      SizedBox(height: 5.h(context)),
                                      AppText(
                                        text: getKey(controller.event, [
                                          "organizer_data",
                                          "about",
                                        ], ""),
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
                            text: AppStrings.aboutTheEvent,
                            style: Styles.Body16pxBold(
                              context,
                              ColorStyle.neutralBlack800,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4.h(context)),
                          AppText(
                            text:
                                getKey(controller.event, [
                                  "description",
                                ], "").substring(
                                  0,
                                  controller.readMore
                                      ? null
                                      : min(
                                        524,
                                        getKey(controller.event, [
                                          "description",
                                        ], "").length,
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
                          .collection("registrations")
                          .where("user", isEqualTo: controller.user?.uid ?? "")
                          .where(
                            "event",
                            isEqualTo: getKey(controller.event, ["id"], "1"),
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
                                  ? await DatabaseHelper.unregisterEvent(
                                    eventId: getKey(controller.event, [
                                      "id",
                                    ], ""),
                                    userId: controller.user?.uid ?? "",
                                  )
                                  : await DatabaseHelper.registerEvent(
                                    eventId: getKey(controller.event, [
                                      "id",
                                    ], ""),
                                    userId: controller.user?.uid ?? "",
                                  ),
                      text:
                          registered
                              ? AppStrings.unRegister
                              : AppStrings.register,
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
