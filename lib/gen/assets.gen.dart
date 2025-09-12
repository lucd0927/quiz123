// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsTttGen {
  const $AssetsTttGen();

  /// File path: assets/ttt/level1.png
  AssetGenImage get level1 => const AssetGenImage('assets/ttt/level1.png');

  /// File path: assets/ttt/level1Big.png
  AssetGenImage get level1Big =>
      const AssetGenImage('assets/ttt/level1Big.png');

  /// File path: assets/ttt/level2.png
  AssetGenImage get level2 => const AssetGenImage('assets/ttt/level2.png');

  /// File path: assets/ttt/level2Big.png
  AssetGenImage get level2Big =>
      const AssetGenImage('assets/ttt/level2Big.png');

  /// File path: assets/ttt/level3.png
  AssetGenImage get level3 => const AssetGenImage('assets/ttt/level3.png');

  /// File path: assets/ttt/level3Big.png
  AssetGenImage get level3Big =>
      const AssetGenImage('assets/ttt/level3Big.png');

  /// File path: assets/ttt/level4.png
  AssetGenImage get level4 => const AssetGenImage('assets/ttt/level4.png');

  /// File path: assets/ttt/level4Big.png
  AssetGenImage get level4Big =>
      const AssetGenImage('assets/ttt/level4Big.png');

  /// File path: assets/ttt/level5.png
  AssetGenImage get level5 => const AssetGenImage('assets/ttt/level5.png');

  /// File path: assets/ttt/level5Big.png
  AssetGenImage get level5Big =>
      const AssetGenImage('assets/ttt/level5Big.png');

  /// File path: assets/ttt/nav_category.png
  AssetGenImage get navCategory =>
      const AssetGenImage('assets/ttt/nav_category.png');

  /// File path: assets/ttt/nav_metal.png
  AssetGenImage get navMetal => const AssetGenImage('assets/ttt/nav_metal.png');

  /// File path: assets/ttt/nav_quiz.png
  AssetGenImage get navQuiz => const AssetGenImage('assets/ttt/nav_quiz.png');

  /// File path: assets/ttt/quiz_answer_bg.png
  AssetGenImage get quizAnswerBg =>
      const AssetGenImage('assets/ttt/quiz_answer_bg.png');

  /// File path: assets/ttt/quiz_coin.png
  AssetGenImage get quizCoin => const AssetGenImage('assets/ttt/quiz_coin.png');

  /// File path: assets/ttt/quiz_level_bg.png
  AssetGenImage get quizLevelBg =>
      const AssetGenImage('assets/ttt/quiz_level_bg.png');

  /// File path: assets/ttt/quiz_question_bg.png
  AssetGenImage get quizQuestionBg =>
      const AssetGenImage('assets/ttt/quiz_question_bg.png');

  /// File path: assets/ttt/quiz_star.png
  AssetGenImage get quizStar => const AssetGenImage('assets/ttt/quiz_star.png');

  /// File path: assets/ttt/quiz_time.png
  AssetGenImage get quizTime => const AssetGenImage('assets/ttt/quiz_time.png');

  /// File path: assets/ttt/quiz_top_bg.png
  AssetGenImage get quizTopBg =>
      const AssetGenImage('assets/ttt/quiz_top_bg.png');

  /// File path: assets/ttt/quiz_top_setting.png
  AssetGenImage get quizTopSetting =>
      const AssetGenImage('assets/ttt/quiz_top_setting.png');

  /// File path: assets/ttt/setting_about.png
  AssetGenImage get settingAbout =>
      const AssetGenImage('assets/ttt/setting_about.png');

  /// File path: assets/ttt/setting_back.png
  AssetGenImage get settingBack =>
      const AssetGenImage('assets/ttt/setting_back.png');

  /// File path: assets/ttt/setting_contact.png
  AssetGenImage get settingContact =>
      const AssetGenImage('assets/ttt/setting_contact.png');

  /// File path: assets/ttt/setting_item_bg.png
  AssetGenImage get settingItemBg =>
      const AssetGenImage('assets/ttt/setting_item_bg.png');

  /// File path: assets/ttt/setting_next.png
  AssetGenImage get settingNext =>
      const AssetGenImage('assets/ttt/setting_next.png');

  /// File path: assets/ttt/setting_term.png
  AssetGenImage get settingTerm =>
      const AssetGenImage('assets/ttt/setting_term.png');

  /// File path: assets/ttt/zhuye_bg.png
  AssetGenImage get zhuyeBg => const AssetGenImage('assets/ttt/zhuye_bg.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    level1,
    level1Big,
    level2,
    level2Big,
    level3,
    level3Big,
    level4,
    level4Big,
    level5,
    level5Big,
    navCategory,
    navMetal,
    navQuiz,
    quizAnswerBg,
    quizCoin,
    quizLevelBg,
    quizQuestionBg,
    quizStar,
    quizTime,
    quizTopBg,
    quizTopSetting,
    settingAbout,
    settingBack,
    settingContact,
    settingItemBg,
    settingNext,
    settingTerm,
    zhuyeBg,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsTttGen ttt = $AssetsTttGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

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
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
