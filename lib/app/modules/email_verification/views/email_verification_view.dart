import 'package:citysync/app/helper/all_imports.dart';
import 'package:citysync/app/helper/figma_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/email_verification_controller.dart';

class EmailVerificationView extends GetView<EmailVerificationController> {
  const EmailVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmailVerificationController>(
      init: EmailVerificationController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorStyle.neutralWhite,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 35.h(context)),
                CommonImage(
                  imageUrl: AppImages.checkMail,
                  fit: BoxFit.fitWidth,
                  width: 266.w(context),
                  height: 200.h(context),
                  type: "asset",
                ),
                SizedBox(height: 40.h(context)),
                Center(
                  child: AppText(
                    text: 'Check your Email',
                    style: Styles.Heading23pxBold(
                      context,
                      ColorStyle.neutralBlack800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 32.h(context)),
                Center(
                  child: AppText(
                    text:
                        'We have sent you an Email on ${controller.user?.email}, check your spam/bin if not visible on main inbox',
                    textAlign: TextAlign.center,
                    maxLines: null,
                    width: 250.w(context),
                    style: Styles.Body13pxRegular(
                      context,
                      ColorStyle.greyscale500,
                    ),
                  ),
                ),
                SizedBox(height: 32.h(context)),
                Center(
                  child: CircularProgressIndicator(
                    color: ColorStyle.primary500,
                  ),
                ),
                SizedBox(height: 8.h(context)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Center(
                    child: AppText(
                      text: 'Verifying email....',
                      style: Styles.Body16pxBold(
                        context,
                        ColorStyle.neutralBlack500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Spacer(),
                CommonButton(
                  text: "Resend",
                  onTap: () {
                    try {
                      controller.user?.sendEmailVerification();
                    } catch (e) {
                      debugPrint('$e');
                    }
                  },
                ),
                SizedBox(height: 32.h(context)),
              ],
            ),
          ),
        );
      },
    );
  }
}
