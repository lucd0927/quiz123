import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/tools/package.dart';
import 'package:quiz123/view/animated_scale.dart';
import 'package:quiz123/view/jc_jindutiao.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/view/jc_text_jianbian_border.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/dati_gift.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/dati_top.dart';

import '../../gen/assets.gen.dart';
import '../../yy_gj/shuju/dati_model.dart';

class DtPage extends StatefulWidget {
  const DtPage({super.key});

  @override
  State<DtPage> createState() => _DtPageState();
}

class _DtPageState extends State<DtPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _floatViewB();
    });
  }

  _floatViewB() {
    if (JCABluoji.isPackageB()) {
      DtController.to.showXaunfu();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool b = JCABluoji.isPackageB();
    if (b) {
      return viewB();
    }
    return viewA();
  }

  Widget viewB() {
    return Obx(() {
      return Column(
        children: [
          SizedBox(height: 42.h),
          Row(
            children: [
              SizedBox(width: 40.w),
              Expanded(child: DatiTop()),
            ],
          ),
          // SizedBox(height: 10.h),
          DatiGift(),
          // SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: datiView(),
          ),
          SizedBox(height: 5.h),
          Expanded(child: answerWidget()),
          // SizedBox(height: 10.h),
        ],
      );
    });
  }

  Widget viewA() {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            levelView(),
            SizedBox(height: 10.h),
            datiView(),
            SizedBox(height: 10.h),
            Expanded(child: answerWidget()),
            // SizedBox(height: 10.h),
          ],
        ),
      );
    });
  }

  answerWidget() {
    DatiModel tmpDatiModel = DtController.to.datiModel;
    String a = tmpDatiModel.a ?? "";
    String b = tmpDatiModel.b ?? "";
    return Column(
      children: [
        answerView(answer: "A", answerContent: a),
        SizedBox(height: 10.h),
        answerView(answer: "B", answerContent: b),
      ],
    );
  }

  levelView() {
    return Container(
      width: double.infinity,
      height: 72.h,

      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            Assets.ttt.quizLevelBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 12.h,
            top: 0,
            child: Container(
              color: Colors.green.withValues(alpha: 0.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35.h,
                      // color: Colors.amber,
                      child: Row(
                        children: [
                          JCTextBorder(
                            text: "Level ${DtController.to.curLevel()}",
                            foreground: Color(0xff801E11),
                            fontColor: Color(0xffFFE100),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        JCJingdutiao(
                          height: 11.h,
                          innerHeight: 6.h,
                          gradientColors: [
                            Color(0xffA0FFD6),
                            Color(0xff00CA11),
                            Color(0xffA0FFD6),
                          ],
                          bgColor: Color(0xff253668),
                          text:
                              "${DtController.to.levelNum()}/${DtController.upgradeNum}",
                          width: 308.w,
                          progress:
                              DtController.to.levelNum() /
                              DtController.upgradeNum,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: -8.h,
            right: -4.w,
            child: Container(
              width: 32.h,
              height: 32.h,
              child: Stack(
                children: [
                  Image.asset(
                    Assets.ttt.quizTime.path,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Center(
                    child: Obx(() {
                      return JCTextBorder(
                        text: "${DtController.to.curDaTiTime.value}s",
                        foreground: Color(0xff5A0000),
                        fontSize: 12.sp,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _titleView() {
    if (JCABluoji.isPackageB()) {
      return Container(
        width: double.infinity,
        height: 66.h,
        color: Colors.green.withValues(alpha: 0.0),
        child: Column(
          children: [
            SizedBox(height: 12.h,),
            Center(
              child: JCTextJianbianBorder(
                text: DtController.to.curLeixing.value,
                fontSize: 22.sp,
                strokeColor: Color(0xff801E11),
                fontWeight: FontWeight.w700,
                showShadow: true,
              ),
            ),
            SizedBox(height: 5.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                children: [
                  JCTextBorder(
                    text: "Level ${DtController.to.curLevel()}",
                    fontSize: 18.sp,

                    fontWeight: FontWeight.w700,
                  ),
                  Spacer(),
                  Text(
                    "Question:",
                    style: TextStyle(
                      color: Color(0xff873400),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "${DtController.to.levelNum()}",
                    style: TextStyle(
                      color: Color(0xffCD00DB),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "/${DtController.upgradeNum}",
                    style: TextStyle(
                      color: Color(0xff873400),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 66.h,
      color: Colors.green.withValues(alpha: 0.4),
      child: Center(
        child: JCTextJianbianBorder(
          text: DtController.to.curLeixing.value,
          fontSize: 22.sp,
          strokeColor: Color(0xff801E11),
          fontWeight: FontWeight.w700,
          showShadow: true,
        ),
      ),
    );
  }

  datiView() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 320.h,
          child: Stack(
            children: [
              Image.asset(
                Assets.ttt.quizQuestionBg.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Column(
                children: [
                  _titleView(),

                  Container(
                    width: double.infinity,
                    height: 210.h,
                    color: Colors.green.withValues(alpha: 0.0),
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 16.h,
                    ),
                    child: Center(
                      child: AutoSizeText(
                        "${DtController.to.datiModel.question}",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Color(0xff6A0000),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  answerView({required String answer, required String answerContent}) {
    DatiModel tmpDatiModel = DtController.to.datiModel;
    String rightAnswer = tmpDatiModel.answer?.toUpperCase() ?? "9999";
    String clickAnswer = DtController.to.curClickAnswer.value;
    bool showIcon = answer == clickAnswer;

    bool selectRight = rightAnswer == answer;
    String answerIcon = selectRight
        ? Assets.ttt.quizDaanRight.path
        : Assets.ttt.quizDaanError.path;

    bool showG = DtController.to.curShowGesture.value;
    String icon = Assets.ttt.quizAnswerBg.path;
    if (showIcon) {
      icon = selectRight
          ? Assets.ttt.quizDaanRightBg.path
          : Assets.ttt.quizDaanErrorBg.path;
    }
    return GestureDetector(
      onTap: () {
        DtController.to.onDianji(
          click: answer,
          right: rightAnswer.toUpperCase(),
        );
      },
      child: Container(
        width: 298.w,
        height: 74.h,

        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              icon,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              gaplessPlayback: true,
            ),
            Positioned(
              left: 15.w,
              // right: 0,
              top: 0,
              bottom: 10.h,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: JCTextBorder(
                    text: "$answer",
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    foreground: Color(0xff7E1D00),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.w,
              right: 30.w,
              top: 0,
              bottom: 10.h,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: JCTextBorder(
                    text: "$answerContent",
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    foreground: Color(0xff7E1D00),
                  ),
                ),
              ),
            ),

            if (showIcon)
              Positioned(
                top: 0,
                bottom: 10.h,
                right: 20.w,
                child: Image.asset(answerIcon, width: 24.w, height: 24.w),
              ),

            if (showG && selectRight)
              Positioned(
                top: 10.h,
                // bottom: 0,
                right: 0.w,
                child: JcAnimatedScale(
                  child: Image.asset(
                    Assets.ttt.gesture.path,
                    width: 70.w,
                    height: 70.w,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
