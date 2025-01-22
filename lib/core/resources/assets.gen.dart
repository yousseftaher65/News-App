/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/dark
  $AssetsImagesDarkGen get dark => const $AssetsImagesDarkGen();

  /// Directory path: assets/images/light
  $AssetsImagesLightGen get light => const $AssetsImagesLightGen();
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar.json
  String get ar => 'assets/translations/ar.json';

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

class $AssetsImagesDarkGen {
  const $AssetsImagesDarkGen();

  /// File path: assets/images/dark/businessDark.png
  AssetGenImage get businessDark =>
      const AssetGenImage('assets/images/dark/businessDark.png');

  /// File path: assets/images/dark/entertainmentDark.png
  AssetGenImage get entertainmentDark =>
      const AssetGenImage('assets/images/dark/entertainmentDark.png');

  /// File path: assets/images/dark/generalDark.png
  AssetGenImage get generalDark =>
      const AssetGenImage('assets/images/dark/generalDark.png');

  /// File path: assets/images/dark/healthDark.png
  AssetGenImage get healthDark =>
      const AssetGenImage('assets/images/dark/healthDark.png');

  /// File path: assets/images/dark/scienceDark.png
  AssetGenImage get scienceDark =>
      const AssetGenImage('assets/images/dark/scienceDark.png');

  /// File path: assets/images/dark/splashDark.png
  AssetGenImage get splashDark =>
      const AssetGenImage('assets/images/dark/splashDark.png');

  /// File path: assets/images/dark/sportsDark.png
  AssetGenImage get sportsDark =>
      const AssetGenImage('assets/images/dark/sportsDark.png');

  /// File path: assets/images/dark/technologyDark.png
  AssetGenImage get technologyDark =>
      const AssetGenImage('assets/images/dark/technologyDark.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        businessDark,
        entertainmentDark,
        generalDark,
        healthDark,
        scienceDark,
        splashDark,
        sportsDark,
        technologyDark
      ];
}

class $AssetsImagesLightGen {
  const $AssetsImagesLightGen();

  /// File path: assets/images/light/businessLight.png
  AssetGenImage get businessLight =>
      const AssetGenImage('assets/images/light/businessLight.png');

  /// File path: assets/images/light/entertainmentLight.png
  AssetGenImage get entertainmentLight =>
      const AssetGenImage('assets/images/light/entertainmentLight.png');

  /// File path: assets/images/light/generalLight.png
  AssetGenImage get generalLight =>
      const AssetGenImage('assets/images/light/generalLight.png');

  /// File path: assets/images/light/healthLight.png
  AssetGenImage get healthLight =>
      const AssetGenImage('assets/images/light/healthLight.png');

  /// File path: assets/images/light/scienceLight.png
  AssetGenImage get scienceLight =>
      const AssetGenImage('assets/images/light/scienceLight.png');

  /// File path: assets/images/light/splashLight.png
  AssetGenImage get splashLight =>
      const AssetGenImage('assets/images/light/splashLight.png');

  /// File path: assets/images/light/sportsLight.png
  AssetGenImage get sportsLight =>
      const AssetGenImage('assets/images/light/sportsLight.png');

  /// File path: assets/images/light/technologyLight.png
  AssetGenImage get technologyLight =>
      const AssetGenImage('assets/images/light/technologyLight.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        businessLight,
        entertainmentLight,
        generalLight,
        healthLight,
        scienceLight,
        splashLight,
        sportsLight,
        technologyLight
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
