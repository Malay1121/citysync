import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../helper/all_imports.dart';

class CommonTextField extends StatefulWidget {
  CommonTextField({
    super.key,
    required this.hintText,
    this.height = 48,
    this.width = 328,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.textInputAction,
    this.maxLines = 1,
    this.prefixIconConstraints,
    this.onChanged,
    this.onSubmitted,
    this.counterText,
    this.inputFormatters,
  });
  String hintText;
  String? counterText;
  double? width;
  double? height;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController? controller;
  bool obscureText;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  int? maxLines;
  BoxConstraints? prefixIconConstraints;
  Function(String)? onChanged;
  Function(String)? onSubmitted;
  bool listening = false;
  List<TextInputFormatter>? inputFormatters;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  SpeechToText speech = SpeechToText();
  void speak() async {
    bool available = await speech.initialize(
      onStatus: (status) {
        print(status);
        if (status == "done" || status == "notListening") {
          widget.listening = false;

          setState(() {});
        } else if (status == "listening") {
          widget.listening = true;
          setState(() {});
        }
      },
      onError: (errorNotification) {},
    );
    setState(() {});
    if (available) {
      speech.listen(
        listenOptions: SpeechListenOptions(listenMode: ListenMode.dictation),
        partialResults: false,
        onResult: (result) {
          if (widget.controller != null)
            widget.controller!.text += result.recognizedWords;
        },
      );
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width?.w(context),
      height: widget.height?.h(context),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        style: Styles.BodyMediumRegular(context, ColorStyle.greyscale900),
        onSubmitted: widget.onSubmitted,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          counterText: widget.counterText,
          // contentPadding: EdgeInsets.zero,
          fillColor: ColorStyle.greyscale0,
          filled: true,
          hintText: widget.hintText,
          suffixIcon:
              widget.suffixIcon ??
              GestureDetector(
                onTap: () => speak(),
                child: Icon(
                  widget.listening ? Icons.stop : Icons.mic,
                  color: ColorStyle.primary500,
                  size: 14.t(context),
                ),
              ),
          hintStyle: Styles.BodyMediumRegular(context, ColorStyle.greyscale400),
          prefixIconConstraints: widget.prefixIconConstraints,
          prefixIcon: widget.prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorStyle.greyscale100),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorStyle.greyscale100),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorStyle.greyscale100),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorStyle.primary500, width: 1),
          ),
        ),
      ),
    );
  }
}
