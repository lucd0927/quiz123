// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.332684
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text_plus/auto_size_text_plus.dart';
class JCTextBorder extends StatelessWidget {
  const JCTextBorder({
    super.key,
    required this.text,
    this.foreground,
    this.fontWeight,
    this.height,
    this.fontStyle,
    this.fontSize,
    this.strokeWidth,

    this.fontColor,
  });

  final double? height;
  final Color? foreground;
  final FontStyle? fontStyle;

  // auto patch 573
  final String text;
  final double? fontSize;

  // auto patch 591
  final double? strokeWidth;
  final Color? fontColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AutoSizeText(
          text,
          style: TextStyle(
            // fontFamily: FontFamily.made,
            fontWeight: fontWeight ?? FontWeight.w700,
            fontSize: fontSize ?? 16.sp,
            overflow: TextOverflow.visible,
            fontStyle: fontStyle,

            height: height??1,
            // backgroundColor: TBColor.ffFFFFFF,
            foreground: Paint()
              ..strokeWidth = strokeWidth ?? 2.w
              ..style = PaintingStyle.stroke
              ..color = foreground ?? Colors.black,
          ),
          textAlign: TextAlign.center,
          minFontSize: 7.sp,
          stepGranularity: 7.sp,
        ),
        AutoSizeText(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            // fontFamily: FontFamily.made,
            fontWeight: fontWeight ?? FontWeight.w600,
            fontSize: fontSize ?? 16.sp,
            overflow: TextOverflow.visible,
            color: fontColor ??  Color(0xffffffff),
            height: height??1,
            fontStyle: fontStyle,
            // color: TBColor.ff000000,
          ),
          minFontSize: 7.sp,
          stepGranularity: 7.sp,
        ),
      ],
    );
  }
}
