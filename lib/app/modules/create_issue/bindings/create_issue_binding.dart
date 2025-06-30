import 'package:get/get.dart';

import '../controllers/create_issue_controller.dart';

class CreateIssueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateIssueController>(
      () => CreateIssueController(),
    );
  }
}
