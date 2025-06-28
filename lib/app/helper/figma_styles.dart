// ignore_for_file: overridden_fields, unused_element, non_constant_identifier_names

/// The all getter and classes with variables and functions statics:
/// [Styles], [Shadows], [ColorStyle], [FigmaTheme]
///
///
/// Text Style Documents:
/// * [TextStyle] are represented in an class called [Style].
/// * To access all [Style] statically, you can just access them using the [Styles] class.
/// * To color a [Style], just use the .tint([IColor]) function.
/// * [Style] may or may not have figma variables depending on the design in figma
/// * The attributes exported from figma are [fontFamily], [fontSize], [decoration], [fontStyle], [fontWeight], [height], [letterSpacing]
///
/// Shadow Documents:
/// * ONLY support DROP_SHADOW and INNER_SHADOW.
/// * [BoxShadow] are represented in an class called [Shadow].
/// * To access all [Shadow] statically, you can just access them using the [Shadows}] class.
/// * Shadows may or may not have figma variables depending on the design in figma
/// * The attributes exported from figma are [color], [offset], [blurRadius], [spreadRadius], [blurStyle]
///
/// Color Styles Documents:
/// * Support SOLID COLOR and GRADIENT LINEAR and GRADIENT RADIAL.
/// * To access all [IColor] statically, you can just access them using the [ColorStyle}] class.
/// * Colors may or may not have figma variables depending on the design in figma
///
/// *IMPORTANT*: You need a [FigmaTheme] on top of your Material so that colors, sizes, strings, booleans are rebuilt when changed.
///
/// ```dart
///  class MyApp extends StatelessWidget {
///    const MyApp({super.key});
///
///    @override
///    Widget build(BuildContext context) {
///      return const FigmaTheme(
///        child: MaterialApp(
///          title: 'Figma Demo',
///          home: MyHomePage(title: 'Figma Demo Home Page'),
///        ),
///      );
///    }
///  }
/// ```
///
///
library figma_theme;

import 'dart:ui';
import 'package:citysync/app/helper/all_imports.dart';
import 'package:flutter/material.dart';

class FigmaTheme extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const FigmaTheme({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<FigmaTheme> createState() => _FigmaThemeState();
}

class _FigmaThemeState extends State<FigmaTheme> with TickerProviderStateMixin {
  void _rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([]),
      builder: (context, _) {
        _rebuildAllChildren(context);
        return widget.child;
      },
    );
  }
}

ColorStyleDefault get ColorStyle => ColorStyleDefault._();

class ColorStyleDefault {
  ColorStyleDefault._();

  IColor get primary500 => const IColor._fromARGB(255, 7, 119, 52);
  IColor get primary50 => const IColor._fromARGB(255, 231, 254, 240);
  IColor get primary950 => const IColor._fromARGB(255, 1, 24, 10);
  IColor get primary100 => const IColor._fromARGB(255, 207, 252, 225);
  IColor get primary200 => const IColor._fromARGB(255, 159, 249, 195);
  IColor get primary300 => const IColor._fromARGB(255, 110, 247, 165);
  IColor get primary400 => const IColor._fromARGB(255, 62, 244, 135);
  IColor get primary600 => const IColor._fromARGB(255, 11, 193, 84);
  IColor get primary700 => const IColor._fromARGB(255, 8, 145, 63);
  IColor get primary800 => const IColor._fromARGB(255, 6, 96, 42);
  IColor get primary900 => const IColor._fromARGB(255, 3, 48, 21);
  IColor get border500 => const IColor._fromARGB(255, 131, 187, 154);
  IColor get border50 => const IColor._fromARGB(255, 239, 246, 242);
  IColor get border950 => const IColor._fromARGB(255, 9, 16, 12);
  IColor get border100 => const IColor._fromARGB(255, 222, 237, 228);
  IColor get border200 => const IColor._fromARGB(255, 189, 219, 201);
  IColor get border300 => const IColor._fromARGB(255, 156, 201, 174);
  IColor get border400 => const IColor._fromARGB(255, 123, 183, 147);
  IColor get border600 => const IColor._fromARGB(255, 72, 132, 96);
  IColor get border700 => const IColor._fromARGB(255, 54, 99, 72);
  IColor get border800 => const IColor._fromARGB(255, 36, 66, 48);
  IColor get border900 => const IColor._fromARGB(255, 18, 33, 24);
  IColor get surface500 => const IColor._fromARGB(255, 243, 248, 245);
  IColor get surface50 => const IColor._fromARGB(255, 239, 246, 242);
  IColor get surface950 => const IColor._fromARGB(255, 9, 16, 12);
  IColor get surface100 => const IColor._fromARGB(255, 223, 236, 228);
  IColor get surface200 => const IColor._fromARGB(255, 191, 217, 201);
  IColor get surface300 => const IColor._fromARGB(255, 158, 199, 174);
  IColor get surface400 => const IColor._fromARGB(255, 126, 180, 148);
  IColor get surface600 => const IColor._fromARGB(255, 75, 129, 97);
  IColor get surface700 => const IColor._fromARGB(255, 56, 97, 72);
  IColor get surface800 => const IColor._fromARGB(255, 38, 64, 48);
  IColor get surface900 => const IColor._fromARGB(255, 19, 32, 24);
  IColor get hover500 => const IColor._fromARGB(255, 5, 79, 35);
  IColor get hover50 => const IColor._fromARGB(255, 231, 253, 240);
  IColor get hover950 => const IColor._fromARGB(255, 2, 24, 11);
  IColor get hover100 => const IColor._fromARGB(255, 207, 252, 225);
  IColor get hover200 => const IColor._fromARGB(255, 159, 249, 195);
  IColor get hover300 => const IColor._fromARGB(255, 111, 246, 165);
  IColor get hover400 => const IColor._fromARGB(255, 63, 243, 135);
  IColor get hover600 => const IColor._fromARGB(255, 12, 192, 84);
  IColor get hover700 => const IColor._fromARGB(255, 9, 144, 63);
  IColor get hover800 => const IColor._fromARGB(255, 6, 96, 42);
  IColor get hover900 => const IColor._fromARGB(255, 3, 48, 21);
  IColor get pressed500 => const IColor._fromARGB(255, 2, 40, 17);
  IColor get pressed50 => const IColor._fromARGB(255, 231, 254, 240);
  IColor get pressed950 => const IColor._fromARGB(255, 1, 24, 10);
  IColor get pressed100 => const IColor._fromARGB(255, 206, 253, 225);
  IColor get pressed200 => const IColor._fromARGB(255, 158, 250, 195);
  IColor get pressed300 => const IColor._fromARGB(255, 109, 248, 165);
  IColor get pressed400 => const IColor._fromARGB(255, 61, 245, 135);
  IColor get pressed600 => const IColor._fromARGB(255, 10, 194, 84);
  IColor get pressed700 => const IColor._fromARGB(255, 7, 146, 63);
  IColor get pressed800 => const IColor._fromARGB(255, 5, 97, 42);
  IColor get pressed900 => const IColor._fromARGB(255, 2, 49, 21);
  IColor get neutralBlack500 => const IColor._fromARGB(255, 20, 20, 20);
  IColor get neutralBlack50 => const IColor._fromARGB(255, 242, 242, 242);
  IColor get neutralWhite => const IColor._fromARGB(255, 255, 255, 255);
  IColor get neutralBlack950 => const IColor._fromARGB(255, 13, 13, 13);
  IColor get neutralBlack100 => const IColor._fromARGB(255, 230, 230, 230);
  IColor get neutralBlack200 => const IColor._fromARGB(255, 204, 204, 204);
  IColor get neutralBlack300 => const IColor._fromARGB(255, 179, 179, 179);
  IColor get neutralBlack400 => const IColor._fromARGB(255, 153, 153, 153);
  IColor get neutralBlack600 => const IColor._fromARGB(255, 102, 102, 102);
  IColor get neutralBlack700 => const IColor._fromARGB(255, 77, 77, 77);
  IColor get neutralBlack800 => const IColor._fromARGB(255, 51, 51, 51);
  IColor get neutralBlack900 => const IColor._fromARGB(255, 26, 26, 26);
  IColor get neutralGrey500 => const IColor._fromARGB(255, 81, 81, 81);
  IColor get neutralGrey50 => const IColor._fromARGB(255, 242, 242, 242);
  IColor get neutralGrey950 => const IColor._fromARGB(255, 13, 13, 13);
  IColor get neutralGrey100 => const IColor._fromARGB(255, 230, 230, 230);
  IColor get neutralGrey200 => const IColor._fromARGB(255, 204, 204, 204);
  IColor get neutralGrey300 => const IColor._fromARGB(255, 179, 179, 179);
  IColor get neutralGrey400 => const IColor._fromARGB(255, 153, 153, 153);
  IColor get neutralGrey600 => const IColor._fromARGB(255, 102, 102, 102);
  IColor get neutralGrey700 => const IColor._fromARGB(255, 77, 77, 77);
  IColor get neutralGrey800 => const IColor._fromARGB(255, 51, 51, 51);
  IColor get neutralGrey900 => const IColor._fromARGB(255, 26, 26, 26);
  IColor get neutralGrey2500 => const IColor._fromARGB(255, 131, 131, 131);
  IColor get neutralGrey250 => const IColor._fromARGB(255, 242, 242, 242);
  IColor get neutralGrey2950 => const IColor._fromARGB(255, 13, 13, 13);
  IColor get neutralGrey2100 => const IColor._fromARGB(255, 230, 230, 230);
  IColor get neutralGrey2200 => const IColor._fromARGB(255, 204, 204, 204);
  IColor get neutralGrey2300 => const IColor._fromARGB(255, 179, 179, 179);
  IColor get neutralGrey2400 => const IColor._fromARGB(255, 153, 153, 153);
  IColor get neutralGrey2600 => const IColor._fromARGB(255, 102, 102, 102);
  IColor get neutralGrey2700 => const IColor._fromARGB(255, 77, 77, 77);
  IColor get neutralGrey2800 => const IColor._fromARGB(255, 51, 51, 51);
  IColor get neutralGrey2900 => const IColor._fromARGB(255, 26, 26, 26);
  IColor get greyscale900 => const IColor._fromARGB(255, 13, 13, 18);
  IColor get greyscale800 => const IColor._fromARGB(255, 26, 27, 37);
  IColor get greyscale700 => const IColor._fromARGB(255, 39, 40, 53);
  IColor get greyscale600 => const IColor._fromARGB(255, 54, 57, 74);
  IColor get greyscale500 => const IColor._fromARGB(255, 102, 109, 128);
  IColor get greyscale400 => const IColor._fromARGB(255, 129, 136, 152);
  IColor get greyscale300 => const IColor._fromARGB(255, 164, 172, 185);
  IColor get greyscale200 => const IColor._fromARGB(255, 193, 199, 208);
  IColor get greyscale100 => const IColor._fromARGB(255, 223, 225, 231);
  IColor get greyscale50 => const IColor._fromARGB(255, 236, 239, 243);
  IColor get greyscale25 => const IColor._fromARGB(255, 246, 248, 250);
  IColor get greyscale0 => const IColor._fromARGB(255, 255, 255, 255);
  IColor get alertError300 => const IColor._fromARGB(255, 113, 14, 33);
  IColor get alertError200 => const IColor._fromARGB(255, 150, 19, 44);
  IColor get alertError100 => const IColor._fromARGB(255, 223, 28, 65);
  IColor get alertError50 => const IColor._fromARGB(255, 237, 130, 150);
  IColor get alertError25 => const IColor._fromARGB(255, 250, 219, 225);
  IColor get alertError0 => const IColor._fromARGB(255, 255, 240, 243);
  IColor get alertWarning300 => const IColor._fromARGB(255, 92, 61, 31);
  IColor get alertWarning200 => const IColor._fromARGB(255, 150, 100, 34);
  IColor get alertWarning100 => const IColor._fromARGB(255, 255, 190, 76);
  IColor get alertWarning50 => const IColor._fromARGB(255, 252, 218, 131);
  IColor get alertWarning25 => const IColor._fromARGB(255, 250, 237, 204);
  IColor get alertWarning0 => const IColor._fromARGB(255, 255, 246, 224);
  IColor get alertSuccess300 => const IColor._fromARGB(255, 24, 78, 68);
  IColor get alertSuccess200 => const IColor._fromARGB(255, 40, 128, 111);
  IColor get alertSuccess100 => const IColor._fromARGB(255, 64, 196, 170);
  IColor get alertSuccess50 => const IColor._fromARGB(255, 158, 225, 212);
  IColor get alertSuccess25 => const IColor._fromARGB(255, 221, 243, 239);
  IColor get alertSuccess0 => const IColor._fromARGB(255, 239, 254, 250);
  IColor get additionalSky300 => const IColor._fromARGB(255, 12, 78, 110);
  IColor get additionalSky200 => const IColor._fromARGB(255, 17, 107, 151);
  IColor get additionalSky100 => const IColor._fromARGB(255, 51, 207, 255);
  IColor get additionalSky25 => const IColor._fromARGB(255, 209, 240, 250);
  IColor get additionalSky0 => const IColor._fromARGB(255, 240, 251, 255);
}

class Style extends TextStyle {
  const Style._({
    super.inherit = true,
    super.color,
    super.backgroundColor,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.fontVariations,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    super.fontFamilyFallback,
    super.overflow,
    super.fontFamily,
  });

  Style tint(IColor? color) => Style._style(copyWith(color: color));

  static FontWeight _parseVariableWeight(double parse) {
    if (parse <= 100) {
      return FontWeight.w100;
    } else if (parse <= 200) {
      return FontWeight.w200;
    } else if (parse <= 300) {
      return FontWeight.w300;
    } else if (parse <= 400) {
      return FontWeight.w400;
    } else if (parse <= 500) {
      return FontWeight.w500;
    } else if (parse <= 600) {
      return FontWeight.w600;
    } else if (parse <= 700) {
      return FontWeight.w700;
    } else if (parse <= 800) {
      return FontWeight.w800;
    } else {
      return FontWeight.w900;
    }
  }

  static FontStyle _parseStringStyle(String parse) {
    return parse.contains("italic") ? FontStyle.italic : FontStyle.normal;
  }

  factory Style._style(TextStyle textStyle) {
    return Style._(
      inherit: textStyle.inherit,
      color: textStyle.color,
      backgroundColor: textStyle.backgroundColor,
      fontSize: textStyle.fontSize,
      fontWeight: textStyle.fontWeight,
      fontStyle: textStyle.fontStyle,
      letterSpacing: textStyle.letterSpacing,
      wordSpacing: textStyle.wordSpacing,
      textBaseline: textStyle.textBaseline,
      height: textStyle.height,
      leadingDistribution: textStyle.leadingDistribution,
      locale: textStyle.locale,
      foreground: textStyle.foreground,
      background: textStyle.background,
      shadows: textStyle.shadows,
      fontFeatures: textStyle.fontFeatures,
      fontVariations: textStyle.fontVariations,
      decoration: textStyle.decoration,
      decorationColor: textStyle.decorationColor,
      decorationStyle: textStyle.decorationStyle,
      decorationThickness: textStyle.decorationThickness,
      debugLabel: textStyle.debugLabel,
      fontFamily: textStyle.fontFamily,
      fontFamilyFallback: textStyle.fontFamilyFallback,
      overflow: textStyle.overflow,
    );
  }
}

StylesDefault get Styles => StylesDefault._();

class StylesDefault {
  const StylesDefault._();

  static const _parent = TextStyle(
    debugLabel: '',
    leadingDistribution: TextLeadingDistribution.even,
  );

  Style Heading48pxRegular(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      color: color,
      fontSize: 48.t(context),
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading48pxBold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      color: color,
      fontFamily: "Manrope",
      fontSize: 48.t(context),
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading48pxMedium(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      color: color,
      fontFamily: "Manrope",
      fontSize: 48.t(context),
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading48pxSemibold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      color: color,
      fontFamily: "Manrope",
      fontSize: 48.t(context),
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading48pxLight(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 48.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading48pxExtrabold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 48.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading40pxRegular(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 40.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading40pxBold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 40.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading40pxExtrabold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 40.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading40pxLight(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 40.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading40pxMedium(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 40.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading40pxSemibold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 40.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading33pxRegular(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 33.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading33pxBold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 33.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading28pxRegular(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 28.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading28pxBold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 28.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading28pxMedium(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 28.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading28pxSemibold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 28.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading28pxLight(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 28.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading23pxRegular(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 23.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading23pxBold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 23.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading23pxMedium(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 23.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading23pxSemibold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 23.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading23pxLight(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 23.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading19pxRegular(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 19.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading19pxBold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 19.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading19pxMedium(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 19.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading19pxSemibold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 19.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Heading19pxLight(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 19.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body16pxRegular(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 16.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body16pxBold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 16.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body16pxSemibold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 16.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style BodyMediumRegular(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 16.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body16pxLight(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 16.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body16pxExtrabold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 16.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body13pxRegular(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 13.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body13pxBold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 13.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body13pxSemibold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 13.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body13pxMedium(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 13.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body13pxExtrabold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 13.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style BodyXSmallRegular(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 12.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body12pxBold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 12.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style BodyXSmallSemibold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 12.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body12pxMedium(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 12.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body12pxExtrabold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 12.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body11pxRegular(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 11.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body11pxBold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 11.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body11pxSemibold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 11.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body11pxMedium(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 11.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
    ),
  );

  Style Body11pxExtrabold(BuildContext context, Color color) => Style._style(
    _parent.copyWith(
      fontFamily: "Manrope",
      fontSize: 11.t(context),
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 0,
    ),
  );
}

class Shadow extends BoxShadow {
  const Shadow._({
    super.color,
    super.offset,
    super.blurRadius,
    super.spreadRadius = 0.0,
    super.blurStyle,
  });
}

ShadowsDefault get Shadows => ShadowsDefault._();

class ShadowsDefault {
  const ShadowsDefault._();
}

class IColor extends Color {
  const IColor._(int value) : super(value);
  const IColor._fromARGB(int a, int r, int g, int b)
    : super.fromARGB(a, r, g, b);
}

class INumber {
  final double value;
  const INumber._(this.value);
}

class IString {
  final String value;
  const IString._(this.value);
}

class IBool {
  final bool value;
  const IBool._(this.value);
}

extension _LerpDouble on double {
  double _lerp(double b, double t) {
    return lerpDouble(this, b, t) ?? this;
  }
}

extension _LerpColor on Color {
  Color _lerp(Color b, double t) {
    return Color.lerp(this, b, t) ?? this;
  }
}

extension _LerpString on String {
  String _lerp(String b, double t) {
    return t < 0.5 ? b : this;
  }
}

extension _LerpBoolean on bool {
  bool _lerp(bool b, double t) {
    return t < 0.5 ? b : this;
  }
}

final class Figma {
  static StylesDefault get styles => Styles;
  static ShadowsDefault get shadows => Shadows;
  static ColorStyleDefault get colorStyle => ColorStyle;
  // static FigmaThemeDefault get figmaTheme => FigmaTheme;
}
