import '../../../helper/all_imports.dart';
import '../../../widgets/common_event_card_big.dart';
import '../controllers/manage_events_controller.dart';

class ManageEventsView extends GetView<ManageEventsController> {
  const ManageEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManageEventsController>(
      init: ManageEventsController(),
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

                            FutureBuilder(
                              future: DatabaseHelper.getOrganizationByUser(
                                userId: controller.user?.uid ?? "",
                              ),
                              builder: (context, snapshot) {
                                String organizer = getKey(
                                  snapshot.data as Map,
                                  ["id"],
                                  "",
                                );
                                return FirestorePagination(
                                  query: FirebaseFirestore.instance
                                      .collection("events")
                                      .where("organizer", isEqualTo: organizer)
                                      .orderBy("start_time"),
                                  shrinkWrap: true,
                                  reverse: true,
                                  separatorBuilder: (p0, p1) {
                                    return SizedBox(height: 20.h(context));
                                  },
                                  itemBuilder: (
                                    BuildContext context,
                                    list,
                                    item,
                                  ) {
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
                                          {
                                            "organizer_data": snapshot.data,
                                          }.entries,
                                        );
                                        return CommonEventCardBig(
                                          event: issue,
                                          manage: true,
                                        );
                                      },
                                    );
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
