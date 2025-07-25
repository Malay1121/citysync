import 'package:citysync/app/helper/all_imports.dart';

class HomeController extends CommonController {
  List acts = [
    {"title": AppStrings.donation, "image": AppImages.icDonation},
    {"title": AppStrings.charity, "image": AppImages.icCharity},
    {"title": AppStrings.campaign, "image": AppImages.icCampaign},
    {"title": AppStrings.more, "image": AppImages.icMore},
  ];

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: ColorStyle.primary500,
        //or set color with: Color(0xFF0000FF)
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
