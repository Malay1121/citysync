import 'package:citysync/app/helper/all_imports.dart';

class CreateIssueController extends CommonController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  File? issuePicture;

  List issueTypes = [
    AppStrings.daily,
    AppStrings.frequently,
    AppStrings.rarely,
  ];
  int? selectedIssueType;

  void selectIssueType(String issueType) {
    selectedIssueType = issueTypes.indexOf(issueType);
    update();
  }

  bool isIssueTypeSelected(String issueType) {
    return issueTypes.indexOf(issueType) == selectedIssueType;
  }

  void pickImage(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      issuePicture = File(image.path);
      update();
    }
    Get.back();
  }

  void selectIssuePicture() async {
    Get.bottomSheet(
      Container(
        width: 360.w(Get.context!),
        height: 266.h(Get.context!),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: ColorStyle.neutralWhite,
        ),
        child: Column(
          children: [
            SizedBox(height: 8.h(Get.context!)),
            Container(
              width: 38.w(Get.context!),
              height: 3.h(Get.context!),
              color: ColorStyle.greyscale300,
            ),
            SizedBox(height: 24.h(Get.context!)),
            AppText(
              text: AppStrings.selectImageSource,
              style: Styles.Heading23pxBold(
                Get.context!,
                ColorStyle.greyscale900,
              ),
            ),
            SizedBox(height: 32.h(Get.context!)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => pickImage(ImageSource.camera),
                  child: Container(
                    width: 154.w(Get.context!),
                    height: 104.h(Get.context!),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: ColorStyle.primary500),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 30.t(Get.context!),
                          color: ColorStyle.primary500,
                        ),
                        SizedBox(height: 10.h(Get.context!)),
                        AppText(
                          text: AppStrings.camera,
                          style: Styles.Heading19pxSemibold(
                            Get.context!,
                            ColorStyle.primary500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12.w(Get.context!)),
                GestureDetector(
                  onTap: () => pickImage(ImageSource.gallery),
                  child: Container(
                    width: 154.w(Get.context!),
                    height: 104.h(Get.context!),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: ColorStyle.primary500),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo_library_outlined,
                          size: 30.t(Get.context!),
                          color: ColorStyle.primary500,
                        ),
                        SizedBox(height: 10.h(Get.context!)),
                        AppText(
                          text: AppStrings.gallery,
                          style: Styles.Heading19pxSemibold(
                            Get.context!,
                            ColorStyle.primary500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void createIssue() async {
    if (await pageValidation()) {
      EasyLoading.show();

      Map organization = await DatabaseHelper.getOrganizationByUser(
        userId: user?.uid ?? "",
      );

      Map<String, dynamic> issueDetails = {
        "title": titleController.text,
        "description": descriptionController.text,
        "location": locationController.text,
        "image": issuePicture!.path,
        "issuer": user?.uid ?? "",
        "category": "Community Service",
        "problem_type": issueTypes[selectedIssueType!],
      };
      Map? issue = await DatabaseHelper.createIssue(data: issueDetails);
      if (issue != null) {
        Get.back();
      }
      EasyLoading.dismiss();
    }
  }

  Future<bool> pageValidation({bool snackbar = true}) async {
    if (issuePicture == null) {
      if (snackbar == true) showSnackbar(message: AppStrings.imageValidation);
      return false;
    } else if (isEmptyString(titleController.text)) {
      if (snackbar == true) showSnackbar(message: AppStrings.titleValidation);
      return false;
    } else if (isEmptyString(locationController.text)) {
      if (snackbar == true)
        showSnackbar(message: AppStrings.locationValidation);
      return false;
    } else if (isEmptyString(descriptionController.text)) {
      if (snackbar == true) {
        showSnackbar(message: AppStrings.descriptionValidation);
      }
      return false;
    } else if (selectedIssueType == null) {
      if (snackbar == true) showSnackbar(message: AppStrings.issueType);
    }
    return true;
  }

  @override
  void onInit() {
    super.onInit();
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
