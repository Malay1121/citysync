import 'package:citysync/app/helper/all_imports.dart';

class HomeController extends GetxController {
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
        statusBarColor: Colors.green,
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
