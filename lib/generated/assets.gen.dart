// dart format width=120

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Upayza_icon.png
  AssetGenImage get upayzaIcon => const AssetGenImage('assets/images/Upayza_icon.png');

  /// File path: assets/images/Visa.png
  AssetGenImage get visa => const AssetGenImage('assets/images/Visa.png');

  /// File path: assets/images/bubble.svg
  SvgGenImage get bubble => const SvgGenImage('assets/images/bubble.svg');

  /// File path: assets/images/e-mali.jpeg
  AssetGenImage get eMali => const AssetGenImage('assets/images/e-mali.jpeg');

  /// File path: assets/images/fr-flag.gif
  AssetGenImage get frFlag => const AssetGenImage('assets/images/fr-flag.gif');

  /// File path: assets/images/icon_error.png
  AssetGenImage get iconError => const AssetGenImage('assets/images/icon_error.png');

  /// File path: assets/images/icon_info.png
  AssetGenImage get iconInfo => const AssetGenImage('assets/images/icon_info.png');

  /// File path: assets/images/icon_success.png
  AssetGenImage get iconSuccess => const AssetGenImage('assets/images/icon_success.png');

  /// File path: assets/images/koodo.png
  AssetGenImage get koodo => const AssetGenImage('assets/images/koodo.png');

  /// File path: assets/images/language.svg
  SvgGenImage get language => const SvgGenImage('assets/images/language.svg');

  /// File path: assets/images/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/images/logo.svg');

  /// File path: assets/images/mastercard.png
  AssetGenImage get mastercard => const AssetGenImage('assets/images/mastercard.png');

  /// File path: assets/images/momo.png
  AssetGenImage get momo => const AssetGenImage('assets/images/momo.png');

  /// File path: assets/images/moov.png
  AssetGenImage get moov => const AssetGenImage('assets/images/moov.png');

  /// File path: assets/images/om.png
  AssetGenImage get om => const AssetGenImage('assets/images/om.png');

  /// File path: assets/images/sp-flag.gif
  AssetGenImage get spFlag => const AssetGenImage('assets/images/sp-flag.gif');

  /// File path: assets/images/splashUi.svg
  SvgGenImage get splashUi => const SvgGenImage('assets/images/splashUi.svg');

  /// File path: assets/images/uk-flag.gif
  AssetGenImage get ukFlag => const AssetGenImage('assets/images/uk-flag.gif');

  /// File path: assets/images/upayza.png
  AssetGenImage get upayza => const AssetGenImage('assets/images/upayza.png');

  /// File path: assets/images/virgin.png
  AssetGenImage get virgin => const AssetGenImage('assets/images/virgin.png');

  /// List of all assets
  List<dynamic> get values => [
    upayzaIcon,
    visa,
    bubble,
    eMali,
    frFlag,
    iconError,
    iconInfo,
    iconSuccess,
    koodo,
    language,
    logo,
    mastercard,
    momo,
    moov,
    om,
    spFlag,
    splashUi,
    ukFlag,
    upayza,
    virgin,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}, this.animation});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({required this.isAnimation, required this.duration, required this.frames});

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(_assetName, assetBundle: bundle, packageName: package);
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
