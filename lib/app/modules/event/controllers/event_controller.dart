import 'package:citysync/app/helper/all_imports.dart';

class EventController extends CommonController {
  bool readMore = false;
  Map event = {};

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      if (getKey(Get.arguments, ["event"], null) != null) {
        event = getKey(Get.arguments, ["event"], null);
        update();
      } else {
        Get.back();
      }
    } else {
      Get.back();
    }
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
