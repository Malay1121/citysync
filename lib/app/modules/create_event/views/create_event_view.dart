import '../../../helper/all_imports.dart';
import '../controllers/create_event_controller.dart';

class CreateEventView extends GetView<CreateEventController> {
  const CreateEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateEventController>(
      init: CreateEventController(),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 34.h(context)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Icon(
                                  Icons.arrow_back_outlined,
                                  color: ColorStyle.greyscale900,
                                  size: 24.t(context),
                                ),
                              ),
                              AppText(
                                text: AppStrings.createAnEvent,
                                style: Styles.Heading19pxSemibold(
                                  context,
                                  ColorStyle.greyscale900,
                                ),
                              ),
                              SizedBox(width: 40.t(context)),
                            ],
                          ),
                          SizedBox(height: 33.5.h(context)),
                          GestureDetector(
                            onTap: () => controller.selectEventPicture(),
                            child: Stack(
                              children: [
                                controller.eventPicture != null
                                    ? CommonImage(
                                      imageUrl: controller.eventPicture!.path,
                                      type: "file",
                                      fit: BoxFit.cover,
                                      borderRadius: BorderRadius.circular(8),
                                      width: 328.h(context),
                                      height: 216.h(context),
                                    )
                                    : Container(
                                      width: 328.w(context),
                                      height: 216.h(context),

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: ColorStyle.greyscale100,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          size: 50.t(context),
                                        ),
                                      ),
                                    ),
                                Positioned(
                                  bottom: 2.5.h(context),
                                  right: 2.5.w(context),
                                  child: Container(
                                    width: 35.w(context),
                                    height: 35.w(context),
                                    decoration: BoxDecoration(
                                      color: ColorStyle.primary500,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.edit,
                                      color: ColorStyle.neutralWhite,
                                      size: 24.t(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.h(context)),
                          CommonTextField(
                            hintText: AppStrings.eventTitle,
                            controller: controller.titleController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 20.h(context)),
                          CommonTextField(
                            hintText: AppStrings.eventLocation,
                            controller: controller.locationController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 20.h(context)),
                          CommonTextField(
                            hintText: AppStrings.eventDescription,
                            controller: controller.descriptionController,
                            textInputAction: TextInputAction.next,
                            maxLines: 5,
                            height: null,
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 20.h(context)),
                          GestureDetector(
                            onTap: () async {
                              controller
                                  .startDate = await showOmniDateTimePicker(
                                context: context,
                                initialDate: controller.startDate,
                              );
                              controller.update();
                            },
                            child: Container(
                              width: 328.w(context),
                              height: 48.h(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: ColorStyle.greyscale100,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w(context),
                                vertical: 12.h(context),
                              ),
                              child: Row(
                                children: [
                                  AppText(
                                    text:
                                        controller.startDate == null
                                            ? AppStrings.startDate
                                            : formatDateTime(
                                              controller.startDate!,
                                            ),
                                    style: Styles.BodyMediumRegular(
                                      context,
                                      controller.startDate == null
                                          ? ColorStyle.greyscale400
                                          : ColorStyle.greyscale900,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.calendar_month_rounded,
                                    color: ColorStyle.greyscale400,
                                    size: 24.t(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h(context)),

                          GestureDetector(
                            onTap: () async {
                              controller.endDate = await showOmniDateTimePicker(
                                context: context,
                                initialDate: controller.endDate,
                              );
                              controller.update();
                            },
                            child: Container(
                              width: 328.w(context),
                              height: 48.h(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: ColorStyle.greyscale100,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w(context),
                                vertical: 12.h(context),
                              ),
                              child: Row(
                                children: [
                                  AppText(
                                    text:
                                        controller.endDate == null
                                            ? AppStrings.endDate
                                            : formatDateTime(
                                              controller.endDate!,
                                            ),
                                    style: Styles.BodyMediumRegular(
                                      context,
                                      controller.endDate == null
                                          ? ColorStyle.greyscale400
                                          : ColorStyle.greyscale900,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.calendar_month_rounded,
                                    color: ColorStyle.greyscale400,
                                    size: 24.t(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h(context)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h(context)),
                CommonButton(
                  text: AppStrings.createEvent,
                  backgroundColor: ColorStyle.primary500,
                  onTap: () => controller.createEvent(),
                ),
                SizedBox(height: 20.h(context)),
              ],
            ),
          ),
        );
      },
    );
  }
}
