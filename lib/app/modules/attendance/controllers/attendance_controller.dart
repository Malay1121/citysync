import '../../../helper/all_imports.dart';

class AttendanceController extends CommonController {
  Map event = {};

  List changes = [];

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
