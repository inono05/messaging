import 'package:flutter/material.dart';
import '../shared.dart';

enum _TextSizeStyle { h0, h1, h2, h3, h4, h5, h6 }

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.title,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.fontVariation = const [FontVariation('wght', 400.0)],
    this.fontStyle = FontStyle.normal,
    this.textScaleFactor,
    this.textOverflow,
  }) : _textSizeStyle = _TextSizeStyle.h3;

  const AppText.h0({
    super.key,
    required this.title,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.fontVariation = const [FontVariation('wght', 400.0)],
    this.fontStyle = FontStyle.normal,
    this.textScaleFactor,
    this.textOverflow,
  }) : _textSizeStyle = _TextSizeStyle.h0;

  const AppText.h1({
    super.key,
    required this.title,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.fontVariation = const [FontVariation('wght', 400.0)],
    this.fontStyle = FontStyle.normal,
    this.textScaleFactor,
    this.textOverflow,
  }) : _textSizeStyle = _TextSizeStyle.h1;

  const AppText.h2({
    super.key,
    required this.title,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.fontVariation = const [FontVariation('wght', 400.0)],
    this.fontStyle = FontStyle.normal,
    this.textScaleFactor,
    this.textOverflow,
  }) : _textSizeStyle = _TextSizeStyle.h2;

  const AppText.h4({
    super.key,
    required this.title,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.fontVariation = const [FontVariation('wght', 400.0)],
    this.fontStyle = FontStyle.normal,
    this.textScaleFactor,
    this.textOverflow,
  }) : _textSizeStyle = _TextSizeStyle.h4;

  const AppText.h5({
    super.key,
    required this.title,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.fontVariation = const [FontVariation('wght', 400.0)],
    this.fontStyle = FontStyle.normal,
    this.textScaleFactor,
    this.textOverflow,
  }) : _textSizeStyle = _TextSizeStyle.h5;

  const AppText.h6({
    super.key,
    required this.title,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.fontVariation = const [FontVariation('wght', 400.0)],
    this.fontStyle = FontStyle.normal,
    this.textScaleFactor,
    this.textOverflow,
  }) : _textSizeStyle = _TextSizeStyle.h6;

  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final List<FontVariation>? fontVariation;
  final FontStyle fontStyle;
  final _TextSizeStyle _textSizeStyle;
  final double? textScaleFactor;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    late TextStyle textStyle;
    switch (_textSizeStyle) {
      case _TextSizeStyle.h6:
        textStyle = context.tLarge!.copyWith(
          color: color ?? context.tertiary,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontVariations: fontVariation,
          fontStyle: fontStyle,
        );
        break;
      case _TextSizeStyle.h5:
        textStyle = context.hSmall!.copyWith(
          color: color ?? context.tertiary,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontVariations: fontVariation,
          fontStyle: fontStyle,
        );
        break;
      case _TextSizeStyle.h4:
        textStyle = context.hMedium!.copyWith(
          color: color ?? context.tertiary,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontVariations: fontVariation,
          fontStyle: fontStyle,
        );
        break;
      case _TextSizeStyle.h3:
        textStyle = context.hLarge!.copyWith(
          color: color ?? context.tertiary,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontVariations: fontVariation,
          fontStyle: fontStyle,
        );
        break;
      case _TextSizeStyle.h2:
        textStyle = context.dSmall!.copyWith(
          color: color ?? context.tertiary,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontVariations: fontVariation,
          fontStyle: fontStyle,
        );
        break;
      case _TextSizeStyle.h1:
        textStyle = context.dMedium!.copyWith(
          color: color ?? context.tertiary,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontVariations: fontVariation,
          fontStyle: fontStyle,
        );
        break;
      case _TextSizeStyle.h0:
        textStyle = context.dLarge!.copyWith(
          color: color ?? context.tertiary,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontVariations: fontVariation,
          fontStyle: fontStyle,
        );
        break;
    }
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLines ?? 1,
      softWrap: true,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: textStyle,
      textScaler: TextScaler.linear(textScaleFactor ?? 1.2),
    );
  }
}
