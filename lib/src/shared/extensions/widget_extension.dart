import 'dart:ui';

import 'package:flutter/cupertino.dart';

extension PaddingX on Widget {
  Padding paddingAll(double value, {Key? key}) => Padding(
    key: key,
    padding: EdgeInsets.all(value),
    child: this,
  );

  Padding paddingFromViewPadding(
      ViewPadding padding,
      double devicePixelRatio, {
        Key? key,
      }) =>
      Padding(
        key: key,
        padding: EdgeInsets.fromViewPadding(padding, devicePixelRatio),
        child: this,
      );

  Padding paddingLTRB(
      double left,
      double top,
      double right,
      double bottom, {
        Key? key,
      }) =>
      Padding(
        key: key,
        padding: EdgeInsets.fromLTRB(
          left,
          top,
          right,
          bottom,
        ),
        child: this,
      );

  Padding paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(
          top: top,
          left: left,
          bottom: bottom,
          right: right,
        ),
        child: this,
      );

  Padding paddingSymmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: this,
      );

  Center toCenter() {
    return Center(
      child: this,
    );
  }
}

extension AlignExtensions on Widget {
  Align alignAtBottomCenter({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.bottomCenter,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtBottomLeft({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.bottomLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtBottomRight({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.bottomRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtCenter({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.center,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtCenterLeft({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.centerLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtCenterRight({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.centerRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtLERP(
      Alignment a,
      Alignment b,
      double t, {
        Key? key,
        double? heightFactor,
        double? widthFactor,
      }) =>
      Align(
        key: key,
        alignment: Alignment.lerp(a, b, t)!,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtTopCenter({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.topCenter,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtTopLeft({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.topLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtTopRight({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.topRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignXY(
      double x,
      double y, {
        Key? key,
        double? heightFactor,
        double? widthFactor,
      }) =>
      Align(
        key: key,
        alignment: Alignment(x, y),
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );
}

extension ExpandedExtension on Widget {
  Expanded expanded({int flex = 1}) => Expanded(
    flex: flex,
    child: this,
  );
}

extension GestureDetectorExtensions on Widget {
  Widget onDoubleTap(Function() function) => GestureDetector(
    onDoubleTap: function,
    child: this,
  );

  Widget onLongPress(Function() function) => GestureDetector(
    onLongPress: function,
    child: this,
  );

  Widget onTap(Function() function) => GestureDetector(
    onTap: function,
    child: this,
  );
}

extension PositionedExtensions on Widget {
  Positioned positionBottom({
    Key? key,
    required double bottom,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        bottom: bottom,
        width: width,
        height: height,
        child: this,
      );

  Positioned positionLR({
    Key? key,
    required double left,
    required double right,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        left: left,
        right: right,
        width: width,
        height: height,
        child: this,
      );

  Positioned positionLRTB({
    Key? key,
    required double top,
    required double bottom,
    required double left,
    required double right,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        width: width,
        height: height,
        child: this,
      );

  Positioned positionBottomCenter({
    Key? key,
    required double bottom,
    double? left = 0.0,
    double? right = 0.0,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        bottom: bottom,
        left: left,
        right: right,
        width: width,
        height: height,
        child: this,
      );

  Positioned positionTB({
    Key? key,
    required double top,
    required double bottom,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        top: top,
        bottom: bottom,
        width: width,
        height: height,
        child: this,
      );

  Positioned positionTop({
    Key? key,
    required double top,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        top: top,
        width: width,
        height: height,
        child: this,
      );
}

extension StringExtension on String {
  /// Capitalize each word inside string
  ///
  /// Example: your name => Your Name, your name => Your name
  String get capitalize =>
      split(' ').map((str) => str.capitalizeFirst).join(' ');

  /// Uppercase first letter inside string and let the others lowercase
  ///
  /// Example: your name => Your name
  String get capitalizeFirst =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  /// Checks if string contains at least one Capital Letter
  bool get hasCapitalLetter => hasMatch(r'[A-Z]');

  bool get is7Z => hasMatch(r'^.+\.7z$');

  /// Checks if string consist only Alphabet. (No Whitespace)
  bool get isAlphabetOnly => hasMatch(r'^[a-zA-Z]+$');

  /// Check if string is Alphanumeric
  bool get isAlphanumeric => hasMatch(r'^[a-zA-Z0-9]+$');

  bool get isAPK => hasMatch(r'^.+\.apk$');

  /// Check if string is a boolean
  bool get isBool => this == 'true' || this == 'false';

  bool get isCSV => hasMatch(r'^.+\.csv$');

  bool get isDOC => hasMatch(r'^.+\.doc$');

  bool get isDOCX => hasMatch(r'^.+\.docx$');

  /// Check if string is a double
  bool get isDouble => double.tryParse(this) != null;

  /// Check if string is an email
  bool get isEmail => hasMatch(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  bool get isGIF => hasMatch(r'^.+\.gif$');

  bool get isGZ => hasMatch(r'^.+\.gz$');

  /// Check if string is Hex Color
  bool get isHexColor => hasMatch(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');

  /// Check if string is an integer
  bool get isInt => int.tryParse(this) != null;

  bool get isJPEG => hasMatch(r'^.+\.jpeg$');

  bool get isJPG => hasMatch(r'^.+\.jpg$');

  /// Check if string is lowercase
  bool get isLowerCase => hasMatch(r'^[a-z]+$');

  bool get isMP3 => hasMatch(r'^.+\.mp3$');

  bool get isMP4 => hasMatch(r'^.+\.mp4$');

  bool get isMPEG => hasMatch(r'^.+\.mpeg$');

  bool get isMPG => hasMatch(r'^.+\.mpg$');

  /// Check if string is numeric
  bool get isNumeric => double.tryParse(this) != null;

  /// Checks if string consist only numeric.
  /// Numeric only doesn't accepting "." which double data type have
  bool get isNumericOnly => hasMatch(r'^\d+$');

  // all files extension
  bool get isPDF => hasMatch(r'^.+\.pdf$');

  /// Check if string is a phone number
  bool get isPhoneNumber => hasMatch(r'^[0-9\-\+\s\(\)]{10,20}$');

  bool get isPNG => hasMatch(r'^.+\.png$');

  bool get isPPT => hasMatch(r'^.+\.ppt$');

  bool get isPPTX => hasMatch(r'^.+\.pptx$');

  bool get isRAR => hasMatch(r'^.+\.rar$');

  bool get isRTF => hasMatch(r'^.+\.rtf$');

  /// Check if string is a Svg image
  bool get isSVG => isEmpty ? false : endsWith(".svg");

  bool get isTAR => hasMatch(r'^.+\.tar$');

  bool get isTXT => hasMatch(r'^.+\.txt$');

  /// Check if string is uppercase
  bool get isUpperCase => hasMatch(r'^[A-Z]+$');

  /// Check if string is URL
  bool get isURL => hasMatch(r'^http(s)?://([\w-]+.)+[\w-]+(/[\w- ./?%&=])?$');

  /// Check if string is a valid date
  bool get isValidDate => DateTime.tryParse(this) != null;

  bool get isXLS => hasMatch(r'^.+\.xls$');

  bool get isXLSX => hasMatch(r'^.+\.xlsx$');

  bool get isZIP => hasMatch(r'^.+\.zip$');

  /// Remove all whitespace inside string
  ///
  /// Example: your name => yourname
  String get removeAllWhitespace => replaceAll(' ', '');

  bool hasMatch(String pattern) => RegExp(pattern).hasMatch(this);

  String ifIsEmpty(String fallback) => isEmpty ? fallback : this;
}

extension SizeBoxExtension on double {
  Widget get heightBox => SizedBox(height: this);

  Widget get widthBox => SizedBox(width: this);
}
