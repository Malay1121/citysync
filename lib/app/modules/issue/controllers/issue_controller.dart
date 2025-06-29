import 'package:citysync/app/helper/all_imports.dart';

class IssueController extends CommonController {
  Map issue = {};
  bool readMore = false;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      if (getKey(Get.arguments, ["issue"], null) != null) {
        issue = getKey(Get.arguments, ["issue"], null);
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
