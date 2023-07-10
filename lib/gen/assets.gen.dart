/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsDbGen {
  const $AssetsDbGen();

  /// File path: assets/db/clans.json
  String get clans => 'assets/db/clans.json';

  /// File path: assets/db/vtm_assistant.db
  String get vtmAssistant => 'assets/db/vtm_assistant.db';

  /// List of all assets
  List<String> get values => [clans, vtmAssistant];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesClanLogosGen get clanLogos => const $AssetsImagesClanLogosGen();
  $AssetsImagesIconGen get icon => const $AssetsImagesIconGen();
}

class $AssetsImagesClanLogosGen {
  const $AssetsImagesClanLogosGen();

  /// File path: assets/images/clan_logos/assamite.webp
  AssetGenImage get assamite =>
      const AssetGenImage('assets/images/clan_logos/assamite.webp');

  /// File path: assets/images/clan_logos/brujah.webp
  AssetGenImage get brujah =>
      const AssetGenImage('assets/images/clan_logos/brujah.webp');

  /// File path: assets/images/clan_logos/followers_of_set.webp
  AssetGenImage get followersOfSet =>
      const AssetGenImage('assets/images/clan_logos/followers_of_set.webp');

  /// File path: assets/images/clan_logos/gangrel.webp
  AssetGenImage get gangrel =>
      const AssetGenImage('assets/images/clan_logos/gangrel.webp');

  /// File path: assets/images/clan_logos/giovanni.webp
  AssetGenImage get giovanni =>
      const AssetGenImage('assets/images/clan_logos/giovanni.webp');

  /// File path: assets/images/clan_logos/lasombra.webp
  AssetGenImage get lasombra =>
      const AssetGenImage('assets/images/clan_logos/lasombra.webp');

  /// File path: assets/images/clan_logos/malkavian.webp
  AssetGenImage get malkavian =>
      const AssetGenImage('assets/images/clan_logos/malkavian.webp');

  /// File path: assets/images/clan_logos/nosferatu.png
  AssetGenImage get nosferatu =>
      const AssetGenImage('assets/images/clan_logos/nosferatu.png');

  /// File path: assets/images/clan_logos/ravnos.webp
  AssetGenImage get ravnos =>
      const AssetGenImage('assets/images/clan_logos/ravnos.webp');

  /// File path: assets/images/clan_logos/toreador.webp
  AssetGenImage get toreador =>
      const AssetGenImage('assets/images/clan_logos/toreador.webp');

  /// File path: assets/images/clan_logos/tremere.png
  AssetGenImage get tremere =>
      const AssetGenImage('assets/images/clan_logos/tremere.png');

  /// File path: assets/images/clan_logos/tzimisce.webp
  AssetGenImage get tzimisce =>
      const AssetGenImage('assets/images/clan_logos/tzimisce.webp');

  /// File path: assets/images/clan_logos/ventrue.webp
  AssetGenImage get ventrue =>
      const AssetGenImage('assets/images/clan_logos/ventrue.webp');

  /// List of all assets
  List<AssetGenImage> get values => [
        assamite,
        brujah,
        followersOfSet,
        gangrel,
        giovanni,
        lasombra,
        malkavian,
        nosferatu,
        ravnos,
        toreador,
        tremere,
        tzimisce,
        ventrue
      ];
}

class $AssetsImagesIconGen {
  const $AssetsImagesIconGen();

  /// File path: assets/images/icon/logo-foreground.png
  AssetGenImage get logoForeground =>
      const AssetGenImage('assets/images/icon/logo-foreground.png');

  /// File path: assets/images/icon/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/icon/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [logoForeground, logo];
}

class Assets {
  Assets._();

  static const $AssetsDbGen db = $AssetsDbGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
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
