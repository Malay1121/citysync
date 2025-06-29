import 'package:citysync/app/helper/all_imports.dart';

class CommonIssueCard extends StatefulWidget {
  CommonIssueCard({required this.issue, required this.user});

  Map issue;
  User user;

  @override
  State<CommonIssueCard> createState() => _CommonIssueCardState();
}

class _CommonIssueCardState extends State<CommonIssueCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w(context)),
      child: Column(
        children: [
          CommonImage(
            imageUrl: getKey(widget.issue, ["image"], ""),
            fit: BoxFit.cover,
            width: 184.w(context),
            height: 105.h(context),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            type: "network",
          ),
          Container(
            width: 184.w(context),
            height: 172.h(context),
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
                AppText(
                  text: getKey(widget.issue, ["issuer_details", "name"], ""),
                  style: Styles.Body11pxRegular(
                    context,
                    ColorStyle.neutralBlack700,
                  ),
                  height: 15.h(context),
                ),
                SizedBox(height: 6.h(context)),
                AppText(
                  text:
                      "${formatDateTime(fromUtc(getKey(widget.issue, ["created_at"], "")))}",
                  style: Styles.Body13pxBold(
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
                      Icons.location_on_rounded,
                      color: ColorStyle.primary500,
                      size: 16.t(context),
                    ),
                    SizedBox(width: 4.w(context)),
                    AppText(
                      text: getKey(widget.issue, ["location"], ""),
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 13.t(context).floorToDouble(),
                      style: Styles.Body13pxSemibold(
                        context,
                        ColorStyle.neutralBlack500,
                      ),
                      width: 130.w(context),
                    ),
                  ],
                ),
                SizedBox(height: 12.h(context)),
                Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up_rounded,
                      size: 16.t(context),
                      color: ColorStyle.primary500,
                    ),
                    SizedBox(width: 4.w(context)),
                    AppText(
                      text:
                          getKey(widget.issue, ["upvotes"], "") +
                          " " +
                          AppStrings.upvotes,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 13.t(context).floorToDouble(),
                      style: Styles.Body13pxSemibold(
                        context,
                        ColorStyle.neutralBlack500,
                      ),
                      width: 130.w(context),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    CommonButton(
                      text: AppStrings.details,
                      onTap:
                          () => Get.toNamed(
                            Routes.ISSUE,
                            arguments: {"issue": widget.issue},
                          ),
                      height: 32.h(context),
                      width: 120.w(context),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    SizedBox(width: 8.w(context)),
                    StreamBuilder(
                      stream:
                          FirebaseFirestore.instance
                              .collection("upvotes")
                              .where("user", isEqualTo: widget.user?.uid ?? "")
                              .where(
                                "issue",
                                isEqualTo: getKey(widget.issue, ["id"], "1"),
                              )
                              .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator(
                            color: ColorStyle.primary500,
                          );
                        }

                        if (!snapshot.hasData || snapshot.data == null) {
                          return SizedBox();
                        }

                        bool registered = snapshot.data!.docs.isNotEmpty;

                        return CommonButton(
                          onTap:
                              () async =>
                                  registered
                                      ? await DatabaseHelper.removeVote(
                                        issueId: getKey(widget.issue, [
                                          "id",
                                        ], ""),
                                        userId: widget.user?.uid ?? "",
                                      )
                                      : await DatabaseHelper.upvote(
                                        issueId: getKey(widget.issue, [
                                          "id",
                                        ], ""),
                                        userId: widget.user?.uid ?? "",
                                      ),
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_up_rounded,
                              size: 24.t(context),
                              color:
                                  registered
                                      ? ColorStyle.neutralWhite
                                      : ColorStyle.primary500,
                            ),
                          ),
                          width: 32.w(context),
                          height: 32.h(context),
                          borderRadius: BorderRadius.circular(12),
                          backgroundColor:
                              registered
                                  ? ColorStyle.primary500
                                  : Colors.transparent,
                          border:
                              registered
                                  ? null
                                  : Border.all(color: ColorStyle.primary500),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
