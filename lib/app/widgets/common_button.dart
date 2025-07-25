import 'package:citysync/app/helper/all_imports.dart';

class CommonButton extends StatefulWidget {
  CommonButton({
    super.key,
    this.text,
    required this.onTap,
    this.child,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.border,
  });

  String? text;
  Widget? child;
  VoidCallback onTap;
  double? height;
  double? width;
  Color? backgroundColor;
  Color? textColor;
  Border? border;
  BorderRadius? borderRadius;

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? 52.h(context),
        width: widget.width ?? 328.w(context),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? ColorStyle.primary500,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(100),
          border: widget.border,
        ),
        child:
            widget.child ??
            Center(
              child: AppText(
                text: widget.text ?? "",
                height: 22.h(context),
                centered: true,
                style: Styles.Body16pxSemibold(
                  context,
                  widget.textColor ?? ColorStyle.neutralWhite,
                ),
              ),
            ),
      ),
    );
  }
}
