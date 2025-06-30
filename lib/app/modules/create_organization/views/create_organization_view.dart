import '../../../helper/all_imports.dart';
import '../controllers/create_organization_controller.dart';

class CreateOrganizationView extends GetView<CreateOrganizationController> {
  const CreateOrganizationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateOrganizationController>(
      init: CreateOrganizationController(),
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
                                text: AppStrings.createAnOrganization,
                                style: Styles.Heading19pxSemibold(
                                  context,
                                  ColorStyle.greyscale900,
                                ),
                              ),
                              SizedBox(width: 24.t(context)),
                            ],
                          ),
                          SizedBox(height: 33.5.h(context)),
                          GestureDetector(
                            onTap: () => controller.selectOrganizationPicture(),
                            child: Stack(
                              children: [
                                controller.organizationPicture != null
                                    ? CommonImage(
                                      imageUrl:
                                          controller.organizationPicture!.path,
                                      type: "file",
                                      fit: BoxFit.cover,
                                      borderRadius: BorderRadius.circular(100),
                                      width: 110.h(context),
                                      height: 110.h(context),
                                    )
                                    : Container(
                                      width: 110.w(context),
                                      height: 110.h(context),

                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorStyle.greyscale100,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.business,
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
                            hintText: AppStrings.organizationName,
                            controller: controller.nameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(height: 20.h(context)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextField(
                                hintText: AppStrings.organizationUniqueId,
                                controller: controller.uniqueIdController,
                                textInputAction: TextInputAction.next,
                              ),
                              if (!isEmptyString(
                                controller.uniqueIdController.text,
                              ))
                                FutureBuilder(
                                  future:
                                      DatabaseHelper.organizationUniqueIdAvailable(
                                        uniqueId:
                                            controller.uniqueIdController.text,
                                      ),
                                  builder: (context, snapshot) {
                                    return snapshot.data != null
                                        ? AppText(
                                          text:
                                              snapshot.data
                                                  ? AppStrings
                                                      .organizationIdAvailable
                                                  : AppStrings
                                                      .organizationAlreadyExists,
                                          style: Styles.BodyMediumRegular(
                                            context,
                                            snapshot.data
                                                ? ColorStyle.alertSuccess100
                                                : ColorStyle.alertError100,
                                          ),
                                        )
                                        : SizedBox();
                                  },
                                ),
                            ],
                          ),
                          SizedBox(height: 20.h(context)),
                          CommonTextField(
                            hintText: AppStrings.aboutOrganization,
                            controller: controller.aboutController,
                            textInputAction: TextInputAction.next,
                            maxLines: 5,
                            height: null,
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 20.h(context)),
                          CommonTextField(
                            hintText: AppStrings.website,
                            controller: controller.websiteController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.url,
                          ),
                          SizedBox(height: 70.h(context)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h(context)),
                CommonButton(
                  text: AppStrings.createOrganization,
                  backgroundColor: ColorStyle.primary500,
                  onTap: () => controller.createOrganization(),
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
