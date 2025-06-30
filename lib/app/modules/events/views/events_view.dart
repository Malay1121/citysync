import 'package:citysync/app/widgets/common_event_card_big.dart';

import '../../../helper/all_imports.dart';
import '../controllers/events_controller.dart';

class EventsView extends GetView<EventsController> {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventsController>(
      init: EventsController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorStyle.neutralWhite,

            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: 360.w(context),
                          height: 100.h(context),
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
                        Column(
                          children: [
                            SizedBox(height: 16.h(context)),
                            StreamBuilder(
                              stream:
                                  FirebaseFirestore.instance
                                      .collection("organizations")
                                      .where(
                                        "admin",
                                        isEqualTo: controller.user?.uid ?? "",
                                      )
                                      .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.data == null) {
                                  return SizedBox();
                                }
                                bool organizationExist =
                                    snapshot.data!.docs.isNotEmpty;
                                return GestureDetector(
                                  onTap:
                                      () => Get.toNamed(
                                        organizationExist
                                            ? Routes.CREATE_EVENT
                                            : Routes.CREATE_ORGANIZATION,
                                      ),
                                  child: Container(
                                    width: 328.w(context),
                                    height: 53.h(context),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ColorStyle.greyscale100,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w(context),
                                      vertical: 8.h(context),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          organizationExist
                                              ? Icons.add
                                              : Icons.business,
                                          size: 20.t(context),
                                          color: ColorStyle.neutralGrey2600,
                                        ),
                                        SizedBox(width: 12.w(context)),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AppText(
                                              text:
                                                  organizationExist
                                                      ? AppStrings.createAnEvent
                                                      : AppStrings
                                                          .createAnOrganization,
                                              width: 242.w(context),
                                              style: Styles.Body13pxMedium(
                                                context,
                                                ColorStyle.neutralBlack800,
                                              ),
                                            ),
                                            if (!organizationExist)
                                              SizedBox(height: 4.h(context)),
                                            if (!organizationExist)
                                              AppText(
                                                text:
                                                    AppStrings
                                                        .requiredToHostAnEvent,
                                                width: 242.w(context),
                                                style: Styles.Body11pxRegular(
                                                  context,
                                                  ColorStyle.neutralGrey600,
                                                ),
                                              ),
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 20.t(context),
                                          color: ColorStyle.greyscale700,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 10.h(context)),
                            GestureDetector(
                              onTap: () => Get.toNamed(Routes.MANAGE_EVENTS),
                              child: Container(
                                width: 328.w(context),
                                height: 53.h(context),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorStyle.greyscale100,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w(context),
                                  vertical: 8.h(context),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.settings,
                                      size: 20.t(context),
                                      color: ColorStyle.neutralGrey2600,
                                    ),
                                    SizedBox(width: 12.w(context)),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppText(
                                          text: AppStrings.manageEvents,
                                          width: 242.w(context),
                                          style: Styles.Body13pxMedium(
                                            context,
                                            ColorStyle.neutralBlack800,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 20.t(context),
                                      color: ColorStyle.greyscale700,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h(context)),
                            FirestorePagination(
                              query: FirebaseFirestore.instance
                                  .collection("events")
                                  .orderBy("start_time"),
                              shrinkWrap: true,
                              reverse: true,
                              separatorBuilder: (p0, p1) {
                                return SizedBox(height: 20.h(context));
                              },
                              itemBuilder: (BuildContext context, list, item) {
                                Map issue = list[item].data() as Map;
                                return FutureBuilder(
                                  future: DatabaseHelper.getOrganization(
                                    organizationId: getKey(issue, [
                                      "organizer",
                                    ], ""),
                                  ),
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      return SizedBox();
                                    }
                                    issue.addEntries(
                                      {"organizer_data": snapshot.data}.entries,
                                    );
                                    return CommonEventCardBig(event: issue);
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 20.h(context)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                CommonBottomBar(selectedTab: AppStrings.events),
              ],
            ),
          ),
        );
      },
    );
  }
}
