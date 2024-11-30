/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/announce.svg
  SvgGenImage get announce => const SvgGenImage('assets/icons/announce.svg');

  /// File path: assets/icons/bullet.png
  AssetGenImage get bullet => const AssetGenImage('assets/icons/bullet.png');

  /// File path: assets/icons/cellphone_sound.svg
  SvgGenImage get cellphoneSound =>
      const SvgGenImage('assets/icons/cellphone_sound.svg');

  /// File path: assets/icons/copy.svg
  SvgGenImage get copy => const SvgGenImage('assets/icons/copy.svg');

  /// File path: assets/icons/down_icon.svg
  SvgGenImage get downIcon => const SvgGenImage('assets/icons/down_icon.svg');

  /// File path: assets/icons/fastlink_wifi.svg
  SvgGenImage get fastlinkWifi =>
      const SvgGenImage('assets/icons/fastlink_wifi.svg');

  /// File path: assets/icons/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/icons/notification.svg');

  /// File path: assets/icons/payment_icon.svg
  SvgGenImage get paymentIcon =>
      const SvgGenImage('assets/icons/payment_icon.svg');

  /// File path: assets/icons/phone.svg
  SvgGenImage get phone => const SvgGenImage('assets/icons/phone.svg');

  /// File path: assets/icons/share.svg
  SvgGenImage get share => const SvgGenImage('assets/icons/share.svg');

  /// File path: assets/icons/trash.png
  AssetGenImage get trash => const AssetGenImage('assets/icons/trash.png');

  /// List of all assets
  List<dynamic> get values => [
        announce,
        bullet,
        cellphoneSound,
        copy,
        downIcon,
        fastlinkWifi,
        notification,
        paymentIcon,
        phone,
        share,
        trash
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/404.png
  AssetGenImage get a404 => const AssetGenImage('assets/images/404.png');

  /// File path: assets/images/android_prompt.svg
  SvgGenImage get androidPrompt =>
      const SvgGenImage('assets/images/android_prompt.svg');

  /// File path: assets/images/announcenmt.png
  AssetGenImage get announcenmt =>
      const AssetGenImage('assets/images/announcenmt.png');

  /// File path: assets/images/bank.png
  AssetGenImage get bankPng => const AssetGenImage('assets/images/bank.png');

  /// File path: assets/images/bank.svg
  SvgGenImage get bankSvg => const SvgGenImage('assets/images/bank.svg');

  /// File path: assets/images/card.png
  AssetGenImage get cardPng => const AssetGenImage('assets/images/card.png');

  /// File path: assets/images/card.svg
  SvgGenImage get cardSvg => const SvgGenImage('assets/images/card.svg');

  /// File path: assets/images/cellphone_sound.png
  AssetGenImage get cellphoneSound =>
      const AssetGenImage('assets/images/cellphone_sound.png');

  /// File path: assets/images/fast_link_logo.png
  AssetGenImage get fastLinkLogo =>
      const AssetGenImage('assets/images/fast_link_logo.png');

  /// File path: assets/images/fast_link_logo_compact.png
  AssetGenImage get fastLinkLogoCompact =>
      const AssetGenImage('assets/images/fast_link_logo_compact.png');

  /// File path: assets/images/green_mark.png
  AssetGenImage get greenMark =>
      const AssetGenImage('assets/images/green_mark.png');

  /// File path: assets/images/hands.png
  AssetGenImage get hands => const AssetGenImage('assets/images/hands.png');

  /// File path: assets/images/high_speed.png
  AssetGenImage get highSpeed =>
      const AssetGenImage('assets/images/high_speed.png');

  /// File path: assets/images/mtn_logo.png
  AssetGenImage get mtnLogo =>
      const AssetGenImage('assets/images/mtn_logo.png');

  /// File path: assets/images/notificationB.svg
  SvgGenImage get notificationB =>
      const SvgGenImage('assets/images/notificationB.svg');

  /// File path: assets/images/password.png
  AssetGenImage get password =>
      const AssetGenImage('assets/images/password.png');

  /// File path: assets/images/phone.png
  AssetGenImage get phone => const AssetGenImage('assets/images/phone.png');

  /// File path: assets/images/plus.png
  AssetGenImage get plus => const AssetGenImage('assets/images/plus.png');

  /// File path: assets/images/super_speed.png
  AssetGenImage get superSpeed =>
      const AssetGenImage('assets/images/super_speed.png');

  /// File path: assets/images/wallet.png
  AssetGenImage get wallet => const AssetGenImage('assets/images/wallet.png');

  /// File path: assets/images/wallet_image.png
  AssetGenImage get walletImage =>
      const AssetGenImage('assets/images/wallet_image.png');

  /// File path: assets/images/write.png
  AssetGenImage get write => const AssetGenImage('assets/images/write.png');

  /// List of all assets
  List<dynamic> get values => [
        a404,
        androidPrompt,
        announcenmt,
        bankPng,
        bankSvg,
        cardPng,
        cardSvg,
        cellphoneSound,
        fastLinkLogo,
        fastLinkLogoCompact,
        greenMark,
        hands,
        highSpeed,
        mtnLogo,
        notificationB,
        password,
        phone,
        plus,
        superSpeed,
        wallet,
        walletImage,
        write
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

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
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
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
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
