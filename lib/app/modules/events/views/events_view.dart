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
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
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
                                      Row(
                                        children: [
                                          CommonImage(
                                            imageUrl: AppImages.icDeed,
                                            fit: BoxFit.contain,
                                            width: 20.w(context),
                                            height: 20.h(context),
                                            type: "asset",
                                          ),
                                          SizedBox(width: 4.w(context)),
                                          AppText(
                                            text: "200",
                                            style: Styles.Heading19pxExtraBold(
                                              context,
                                              ColorStyle.surface500,
                                            ),
                                          ),
                                        ],
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
                              SizedBox(height: 16.h(context)),
                              Container(
                                width: 328.w(context),
                                height: 53.h(context),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorStyle.greyscale100,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
