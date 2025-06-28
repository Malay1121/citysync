import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:citysync/app/helper/all_imports.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorStyle.neutralWhite,
            body:
                controller.page == 0
                    ? SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w(context),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 34.h(context)),
                            CommonImage(
                              imageUrl: "",
                              fit: BoxFit.fitHeight,
                              width: 107.w(context),
                              height: 107.h(context),
                            ),
                            SizedBox(height: 24.h(context)),
                            AppText(
                              text: AppStrings.welcome,
                              centered: true,
                              style: Styles.Heading28pxBold(
                                context,
                                ColorStyle.greyscale900,
                              ),
                            ),
                            SizedBox(height: 24.h(context)),
                            CommonTextField(
                              hintText: AppStrings.email,
                              controller: controller.emailController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Icon(
                                Icons.email,
                                color: ColorStyle.greyscale500,
                                size: 20.t(context),
                              ),
                            ),
                            SizedBox(height: 20.h(context)),
                            CommonTextField(
                              hintText: AppStrings.password,
                              controller: controller.passwordController,
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: ColorStyle.greyscale500,
                                size: 20.t(context),
                              ),
                            ),
                            SizedBox(height: 64.h(context)),
                            CommonButton(
                              text: AppStrings.next,
                              backgroundColor: ColorStyle.primary500,
                              onTap: () => controller.next(),
                            ),
                            SizedBox(height: 70.h(context)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 113.5.w(context),
                                  color: ColorStyle.greyscale200,
                                  height: 1,
                                ),
                                SizedBox(width: 8.w(context)),
                                AppText(
                                  text: AppStrings.continueWith,
                                  centered: true,
                                  style: Styles.Body13pxRegular(
                                    context,
                                    ColorStyle.neutralBlack600,
                                  ),
                                  width: 85.w(context),
                                  height: 18.h(context),
                                ),
                                SizedBox(width: 8.w(context)),
                                Container(
                                  width: 113.5.w(context),
                                  color: ColorStyle.greyscale200,
                                  height: 1,
                                ),
                              ],
                            ),
                            SizedBox(height: 50.h(context)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  text: AppStrings.alreadyHaveAnAccount,
                                  style: Styles.Body16pxBold(
                                    context,
                                    ColorStyle.greyscale500,
                                  ),
                                ),
                                SizedBox(width: 4.w(context)),
                                GestureDetector(
                                  onTap: () => Get.toNamed(Routes.SIGNIN),
                                  child: AppText(
                                    text: AppStrings.signIn,
                                    style: Styles.Body16pxBold(
                                      context,
                                      ColorStyle.primary500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h(context)),
                          ],
                        ),
                      ),
                    )
                    : Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w(context),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 34.h(context)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => controller.previous(),
                                        child: Icon(
                                          Icons.arrow_back_outlined,
                                          color: ColorStyle.greyscale900,
                                          size: 24.t(context),
                                        ),
                                      ),
                                      SizedBox(width: 16.w(context)),
                                      AppText(
                                        text: AppStrings.completeYourProfile,
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
                                    onTap:
                                        () => controller.selectProfilePicture(),
                                    child: Stack(
                                      children: [
                                        CommonImage(
                                          imageUrl:
                                              controller.profilePicture != null
                                                  ? controller
                                                      .profilePicture!
                                                      .path
                                                  : AppImages.profilePicture,
                                          type:
                                              controller.profilePicture != null
                                                  ? "file"
                                                  : "asset",
                                          fit: BoxFit.cover,
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          width: 110.h(context),
                                          height: 110.h(context),
                                        ),
                                        Positioned(
                                          bottom: 2.5.h(context),
                                          right: 2.5.w(context),
                                          child: Container(
                                            width: 35.w(context),
                                            height: 35.w(context),
                                            decoration: BoxDecoration(
                                              color: ColorStyle.primary500,
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                    hintText: AppStrings.fullName,
                                    controller: controller.nameController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.name,
                                  ),
                                  SizedBox(height: 20.h(context)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonTextField(
                                        hintText: AppStrings.username,
                                        controller:
                                            controller.usernameController,
                                        textInputAction: TextInputAction.done,
                                      ),
                                      if (!isEmptyString(
                                        controller.usernameController.text,
                                      ))
                                        FutureBuilder(
                                          future:
                                              DatabaseHelper.usernameAvailable(
                                                username:
                                                    controller
                                                        .usernameController
                                                        .text,
                                              ),
                                          builder: (context, snapshot) {
                                            return snapshot.data != null
                                                ? AppText(
                                                  text:
                                                      snapshot.data
                                                          ? AppStrings
                                                              .usernameAvailable
                                                          : AppStrings
                                                              .usernameAlreadyExists,
                                                  style:
                                                      Styles.BodyMediumRegular(
                                                        context,
                                                        snapshot.data
                                                            ? ColorStyle
                                                                .alertSuccess100
                                                            : ColorStyle
                                                                .alertError100,
                                                      ),
                                                )
                                                : SizedBox();
                                          },
                                        ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h(context)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: AppStrings.gender,
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
                                          for (String gender
                                              in controller.genders)
                                            CommonButton(
                                              width: 100.w(context),
                                              height: 40.h(context),
                                              text: gender,
                                              backgroundColor:
                                                  controller.isGenderSelected(
                                                        gender,
                                                      )
                                                      ? ColorStyle.primary500
                                                      : Colors.transparent,
                                              border:
                                                  controller.isGenderSelected(
                                                        gender,
                                                      )
                                                      ? null
                                                      : Border.all(
                                                        color:
                                                            ColorStyle
                                                                .primary500,
                                                      ),
                                              textColor:
                                                  controller.isGenderSelected(
                                                        gender,
                                                      )
                                                      ? ColorStyle.neutralWhite
                                                      : ColorStyle.primary500,
                                              onTap:
                                                  () => controller.selectGender(
                                                    gender,
                                                  ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 70.h(context)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h(context)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonButton(
                              width: 154.w(context),
                              text: AppStrings.previous,
                              backgroundColor: ColorStyle.primary100,
                              textColor: ColorStyle.primary500,
                              onTap: () => controller.previous(),
                            ),
                            SizedBox(width: 12.w(context)),
                            CommonButton(
                              text: AppStrings.signUp,
                              width: 154.w(context),
                              backgroundColor: ColorStyle.primary500,
                              onTap: () => controller.signUp(),
                            ),
                          ],
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
