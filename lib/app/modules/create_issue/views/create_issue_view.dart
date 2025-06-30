import '../../../helper/all_imports.dart';
import '../controllers/create_issue_controller.dart';

class CreateIssueView extends GetView<CreateIssueController> {
  const CreateIssueView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateIssueController>(
      init: CreateIssueController(),
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
                              SizedBox(width: 16.w(context)),
                              AppText(
                                text: AppStrings.createAnIssue,
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
                            onTap: () => controller.selectIssuePicture(),
                            child: Stack(
                              children: [
                                controller.issuePicture != null
                                    ? CommonImage(
                                      imageUrl: controller.issuePicture!.path,
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
                            hintText: AppStrings.issueTitle,
                            controller: controller.titleController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 20.h(context)),
                          CommonTextField(
                            hintText: AppStrings.issueLocation,
                            controller: controller.locationController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 20.h(context)),
                          CommonTextField(
                            hintText: AppStrings.issueDescription,
                            controller: controller.descriptionController,
                            textInputAction: TextInputAction.next,
                            maxLines: 5,
                            height: null,
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 20.h(context)),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: AppStrings.issueType,
                                style: Styles.Heading19pxRegular(
                                  context,
                                  ColorStyle.greyscale900,
                                ),
                              ),
                              SizedBox(height: 10.h(context)),
                              Wrap(
                                runSpacing: 10.h(context),
                                spacing: 10.w(context),
                                children: [
                                  for (String issueType
                                      in controller.issueTypes)
                                    CommonButton(
                                      width: 100.w(context),
                                      height: 40.h(context),
                                      text: issueType,
                                      backgroundColor:
                                          controller.isIssueTypeSelected(
                                                issueType,
                                              )
                                              ? ColorStyle.primary500
                                              : Colors.transparent,
                                      border:
                                          controller.isIssueTypeSelected(
                                                issueType,
                                              )
                                              ? null
                                              : Border.all(
                                                color: ColorStyle.primary500,
                                              ),
                                      textColor:
                                          controller.isIssueTypeSelected(
                                                issueType,
                                              )
                                              ? ColorStyle.neutralWhite
                                              : ColorStyle.primary500,
                                      onTap:
                                          () => controller.selectIssueType(
                                            issueType,
                                          ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 40.h(context)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h(context)),
                CommonButton(
                  text: AppStrings.createIssue,
                  backgroundColor: ColorStyle.primary500,
                  onTap: () => controller.createIssue(),
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
