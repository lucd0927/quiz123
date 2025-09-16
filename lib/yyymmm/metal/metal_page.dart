import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/view/jc_text_jianbian_border.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';

import '../../gen/assets.gen.dart';

class MetalPage extends StatefulWidget {
  const MetalPage({super.key});

  @override
  State<MetalPage> createState() => _MetalPageState();
}

class _MetalPageState extends State<MetalPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          topLevel(),

          SizedBox(height: 20.h),
          answerStates(),
          SizedBox(height: 10.h),
          levelStates(),
        ],
      ),
    );
  }

  topLevel() {
    String icon = DtController.to.levelIcon();
    return Center(
      child: Container(
        width: 152.h,
        height: 152.h,
        child: Stack(
          children: [
            Image.asset(
              Assets.ttt.metalLevelBg.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),

            Center(
              child: Image.asset(
                icon,
                width: 88.h,
                height: 88.h,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: JCTextJianbianBorder(
                  text: "Level ${DtController.to.curLevel()}",
                  // foreground: Color(0xff801E11),
                  // fontColor: Color(0xffFFE100),
                  fontSize: 22.sp,
                  strokeColor: Color(0xff801E11),
                  fontWeight: FontWeight.w700,
                  showShadow: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  answerStates() {
    int all = DtController.to.curAllDatiNum.value;
    int right = DtController.to.curRightNum.value;
    int error = all - right;
    int time = DtController.to.curAllDatiTime.value;
    return Row(
      children: [
        Image.asset(Assets.ttt.metalRight.path, width: 34.h, height: 34.h),
        JCTextBorder(text: "$right/$all"),
        Spacer(),
        Image.asset(Assets.ttt.metalError.path, width: 34.h, height: 34.h),
        JCTextBorder(text: "$error/$all"),
        Spacer(),
        Image.asset(Assets.ttt.metalTime.path, width: 34.h, height: 34.h),
        JCTextBorder(text: "${time}s"),
      ],
    );
  }

  levelStates() {
    int curLevel = DtController.to.curLevel();

    String icon1 = curLevel == 1
        ? Assets.ttt.level1Big.path
        : Assets.ttt.level1BigGrey.path;
    String icon2 = curLevel == 2
        ? Assets.ttt.level2Big.path
        : Assets.ttt.level2BigGrey.path;
    String icon3 = curLevel == 3
        ? Assets.ttt.level3Big.path
        : Assets.ttt.level3BigGrey.path;
    String icon4 = curLevel == 4
        ? Assets.ttt.level4Big.path
        : Assets.ttt.level4BigGrey.path;
    String icon5 = curLevel >= 5
        ? Assets.ttt.level5Big.path
        : Assets.ttt.level5BigGrey.path;

    return Container(
      width: double.infinity,
      height: 286.h,
      decoration: BoxDecoration(
        color: Color(0xff535875),
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              levelStatesItem(icon: icon1, level: 1),
              levelStatesItem(icon: icon2, level: 2),
              levelStatesItem(icon: icon3, level: 3),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              levelStatesItem(icon: icon4, level: 4),
              levelStatesItem(icon: icon5, level: 5),
              SizedBox(width: 72.h),
            ],
          ),
        ],
      ),
    );
  }

  levelStatesItem({required String icon, required int level}) {
    int curLevel = DtController.to.curLevel();
    bool hasSelect = curLevel == level;
    if (curLevel >= 5 && level >= 5) {
      hasSelect = true;
    }
    var gradient = hasSelect
        ? LinearGradient(
            colors: [
              Color(0xffFFF565),
              Color(0xffFFE0A7),
              Color(0xffFFFE10),
              Color(0xffFFF9AA),
              Color(0xffFDDE51),
            ],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          )
        : LinearGradient(
            colors: [Color(0xff989EC1), Color(0xff989EC1)],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          );
    return Column(
      children: [
        Image.asset(icon, width: 72.h, height: 57.h),
        Center(
          child: JCTextJianbianBorder(
            text: "Level $level",
            // foreground: Color(0xff801E11),
            // fontColor: Color(0xffFFE100),
            fontSize: 18.sp,
            strokeColor: hasSelect ? Color(0xff801E11) : Color(0xff040A2F),
            fontWeight: FontWeight.w700,
            showShadow: true,
            gradient: gradient,
          ),
        ),
      ],
    );
  }
}
