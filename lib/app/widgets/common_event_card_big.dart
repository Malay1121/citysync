import 'package:citysync/app/helper/all_imports.dart';

class CommonEventCardBig extends StatefulWidget {
  CommonEventCardBig({required this.event, this.manage = false});

  Map event;
  bool manage;

  @override
  State<CommonEventCardBig> createState() => _CommonEventCardBigState();
}

class _CommonEventCardBigState extends State<CommonEventCardBig> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w(context)),
      child: Column(
        children: [
          CommonImage(
            imageUrl: getKey(widget.event, ["image"], ""),
            fit: BoxFit.cover,
            width: 328.w(context),
            height: 105.h(context),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            type: "network",
          ),
          Container(
            width: 328.w(context),
            decoration: BoxDecoration(
              color: ColorStyle.greyscale0,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 4,
                  color: ColorStyle.neutralBlack800.withOpacity(0.08),
                ),
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 4,
                  color: ColorStyle.neutralBlack800.withOpacity(0.08),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              vertical: 12.h(context),
              horizontal: 12.w(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(
                      text: getKey(widget.event, [
                        "organizer_data",
                        "name",
                      ], ""),
                      style: Styles.Body11pxRegular(
                        context,
                        ColorStyle.neutralBlack700,
                      ),
                      height: 15.h(context),
                    ),
                    SizedBox(width: 4.w(context)),
                    if (getKey(widget.event, [
                      "organizer_data",
                      "verified",
                    ], false))
                      CommonImage(
                        imageUrl: AppImages.icVerified,
                        fit: BoxFit.contain,
                        width: 12.w(context),
                        height: 12.h(context),
                        type: "asset",
                      ),
                  ],
                ),
                SizedBox(height: 6.h(context)),
                AppText(
                  text: getKey(widget.event, ["title"], ""),
                  style: Styles.Body16pxBold(
                    context,
                    ColorStyle.neutralBlack800,
                  ),
                  maxLines: 2,
                  minFontSize: 13.t(context).floor().toDouble(),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12.h(context)),
                Row(
                  children: [
                    Icon(
                      Icons.event,
                      color: ColorStyle.primary500,
                      size: 16.t(context),
                    ),
                    SizedBox(width: 4.w(context)),
                    AppText(
                      text: formatDateTime(
                        fromUtc(getKey(widget.event, ["start_time"], "")),
                      ),
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 13.t(context).floorToDouble(),
                      style: Styles.Body13pxSemibold(
                        context,
                        ColorStyle.neutralBlack500,
                      ),
                      width: 250.w(context),
                    ),
                  ],
                ),
                SizedBox(height: 8.h(context)),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: ColorStyle.primary500,
                      size: 16.t(context),
                    ),
                    SizedBox(width: 4.w(context)),
                    AppText(
                      text: getKey(widget.event, ["location"], ""),
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 13.t(context).floorToDouble(),
                      style: Styles.Body13pxSemibold(
                        context,
                        ColorStyle.neutralBlack500,
                      ),
                      width: 250.w(context),
                    ),
                  ],
                ),
                SizedBox(height: 8.h(context)),
                Row(
                  children: [
                    Center(
                      child: CommonImage(
                        imageUrl: AppImages.icDeedGreen,
                        fit: BoxFit.contain,
                        height: 16.h(context),
                        width: 16.w(context),
                        type: "asset",
                      ),
                    ),
                    SizedBox(width: 4.w(context)),
                    AppText(
                      text:
                          "Earn "
                          "${getKey(widget.event, ["deeds"], 0)} Deeds",
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 13.t(context).floorToDouble(),
                      style: Styles.Body13pxSemibold(
                        context,
                        ColorStyle.primary500,
                      ),
                      width: 250.w(context),
                    ),
                  ],
                ),
                SizedBox(height: 12.h(context)),
                CommonButton(
                  text:
                      widget.manage
                          ? AppStrings.participants
                          : AppStrings.details,
                  onTap:
                      () => Get.toNamed(
                        widget.manage ? Routes.ATTENDANCE : Routes.EVENT,
                        arguments: {"event": widget.event},
                      ),
                  height: 32.h(context),
                  width: 304.w(context),
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
