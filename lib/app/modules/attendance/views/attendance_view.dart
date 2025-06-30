import 'dart:math';

import '../../../helper/all_imports.dart';
import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(
      init: AttendanceController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorStyle.neutralWhite,

            body: Column(
              children: [
                SizedBox(height: 34.h(context)),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: ColorStyle.greyscale900,
                          size: 24.t(context),
                        ),
                      ),
                      AppText(
                        text: AppStrings.participants,
                        centered: true,
                        style: Styles.Heading19pxSemibold(
                          context,
                          ColorStyle.greyscale900,
                        ),
                      ),
                      SizedBox(width: 24.t(context)),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
                      child: Column(
                        children: [
                          SizedBox(height: 34.h(context)),

                          FirestorePagination(
                            query: FirebaseFirestore.instance
                                .collection("registrations")
                                .where(
                                  "event",
                                  isEqualTo: getKey(controller.event, [
                                    "id",
                                  ], ""),
                                )
                                .orderBy("created_at"),
                            shrinkWrap: true,
                            separatorBuilder: (p0, p1) {
                              return SizedBox(height: 20.h(context));
                            },
                            itemBuilder: (BuildContext context, list, item) {
                              Map registration = list[item].data() as Map;
                              return FutureBuilder(
                                future: DatabaseHelper.getUser(
                                  userId: getKey(registration, ["user"], ""),
                                ),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return SizedBox();
                                  }
                                  Map userDetails = snapshot.data;
                                  return Container(
                                    width: 328.w(context),
                                    height: 51.h(context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: ColorStyle.greyscale100,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w(context),
                                      vertical: 8.h(context),
                                    ),
                                    child: Row(
                                      children: [
                                        CommonImage(
                                          imageUrl: getKey(userDetails, [
                                            "profile_picture",
                                          ], ""),
                                          fit: BoxFit.cover,
                                          height: min(
                                            30.h(context),
                                            30.w(context),
                                          ),
                                          width: min(
                                            30.h(context),
                                            30.w(context),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          type: "network",
                                        ),
                                        SizedBox(width: 6.w(context)),
                                        AppText(
                                          text: getKey(userDetails, [
                                            "name",
                                          ], ""),
                                          style: Styles.Body13pxSemibold(
                                            context,
                                            ColorStyle.neutralBlack800,
                                          ),
                                          width: 224.w(context),
                                        ),
                                        SizedBox(width: 6.w(context)),
                                        Checkbox(
                                          value: getKey(registration, [
                                            "present",
                                          ], false),
                                          onChanged: (value) {
                                            registration["present"] =
                                                !registration["present"];
                                            controller.update();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(height: 20.h(context)),
                        ],
                      ),
                    ),
                  ),
                ),
                CommonButton(
                  onTap: () => null,
                  text: AppStrings.markAttendance,
                ),
                SizedBox(height: 16.h(context)),
              ],
            ),
          ),
        );
      },
    );
  }
}
