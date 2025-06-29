import 'package:get/get.dart';

import '../controllers/issue_controller.dart';

class IssueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IssueController>(
      () => IssueController(),
    );
  }
}
