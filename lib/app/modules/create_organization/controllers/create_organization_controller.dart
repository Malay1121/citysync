import '../../../helper/all_imports.dart';

class CreateOrganizationController extends CommonController {
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController uniqueIdController = TextEditingController();

  File? organizationPicture;

  void pickImage(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      organizationPicture = File(image.path);
      update();
    }
    Get.back();
  }

  void selectOrganizationPicture() async {
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

  void createOrganization() async {
    if (await pageValidation()) {
      EasyLoading.show();

      Map<String, dynamic> organizationDetails = {
        "name": nameController.text,
        "id": uniqueIdController.text,
        "about": aboutController.text,
        "website": websiteController.text,
        "organization_picture": organizationPicture!.path,
        "admin": user?.uid ?? "",
        "verified": false,
      };
      Map? organization = await DatabaseHelper.createOrganization(
        data: organizationDetails,
      );
      if (organization != null) {
        Get.back();
      }
      EasyLoading.dismiss();
    }
  }

  Future<bool> pageValidation({bool snackbar = true}) async {
    if (organizationPicture == null) {
      if (snackbar == true)
        showSnackbar(message: AppStrings.organizationPictureValidation);
      return false;
    } else if (isEmptyString(nameController.text)) {
      if (snackbar == true) showSnackbar(message: AppStrings.nameValidation);
      return false;
    } else if (isEmptyString(websiteController.text)) {
      if (snackbar == true)
        showSnackbar(message: AppStrings.organizationWebsiteValidation);
      return false;
    } else if (isEmptyString(uniqueIdController.text) ||
        !(await DatabaseHelper.organizationUniqueIdAvailable(
          uniqueId: uniqueIdController.text,
        ))) {
      if (snackbar == true) {
        showSnackbar(
          message:
              "${AppStrings.usernameIsEmpty} or ${AppStrings.usernameAlreadyExists}",
        );
      }
      return false;
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
