import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:citysync/app/helper/all_imports.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorStyle.neutralWhite,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 34.h(context)),
                    Icon(
                      Icons.arrow_back_outlined,
                      color: ColorStyle.greyscale900,
                    ),
                    SizedBox(height: 70.h(context)),
                    AppText(
                      text: AppStrings.welcomeBack,
                      style: Styles.Heading28pxBold(
                        context,
                        ColorStyle.greyscale900,
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(height: 60.h(context)),
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
                      text: AppStrings.signIn,
                      backgroundColor: ColorStyle.primary500,
                      onTap: () => controller.submit(),
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
                            ColorStyle.greyscale700,
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
                    SizedBox(height: 150.h(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: AppStrings.dontHaveAnAccount,
                          style: Styles.Body16pxBold(
                            context,
                            ColorStyle.greyscale500,
                          ),
                        ),
                        SizedBox(width: 4.w(context)),
                        GestureDetector(
                          onTap: () => Get.offAllNamed(Routes.SIGNUP),
                          child: AppText(
                            text: AppStrings.signUp,
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
            ),
          ),
        );
      },
    );
  }
}
