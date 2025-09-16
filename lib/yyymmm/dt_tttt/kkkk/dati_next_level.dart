import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/view/jc_text_border.dart';

import '../../../gen/assets.gen.dart';
import '../../../jichu_kuang/jichu_kuang.dart';
import '../dt_controller.dart';

showDatiNextLevel(
  BuildContext context, {
  required VoidCallback onBtn,
  required VoidCallback onClose,
}) {
  return jcKuang(
    context: context,
    child: DatiNextLevel(
      onClose: () {
        onClose();
      },
      onFunc: () {
        onBtn();
      },
    ),
  );
}

class DatiNextLevel extends StatefulWidget {
  const DatiNextLevel({super.key, required this.onClose, required this.onFunc});

  final VoidCallback onClose;
  final VoidCallback onFunc;

  @override
  State<DatiNextLevel> createState() => _DatiNextLevelState();
}

class _DatiNextLevelState extends State<DatiNextLevel> {
  int index = 0;
  bool showStep2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: IndexedStack(
        index: index,
        children: [
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  // color: Colors.amber,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: 200.h),
                      Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              widget.onClose();
                            },
                            child: Container(
                              width: 20.w,
                              height: 20.w,
                              color: Colors.transparent,
                              child: Image.asset(
                                Assets.ttt.close.path,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: 40.w),
                        ],
                      ),
                      SizedBox(height: 10.w),
                      centerContent(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  centerContent() {
    return Container(
      width: 350.w,
      height: 380.w,
      // color: Colors.green,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 30.w,
            child: Center(
              child: Image.asset(
                Assets.ttt.levelBg.path,
                width: 287.w,
                height: 328.w,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Image.asset(
                Assets.ttt.levelCongratulation.path,
                width: 350.w,
                height: 88.w,
                fit: BoxFit.fill,
              ),
              Container(
                width: 154.w,
                height: 154.w,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      Assets.ttt.metalLevelBg.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Center(
                      child: Image.asset(
                        DtController.to.levelIcon(),
                        width: 100.w,
                        height: 100.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 260.w,
                height: 40.w,
                color: Colors.amber.withValues(alpha: 0.0),
                child: answerStates(),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0.w,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  widget.onFunc();
                },
                child: Image.asset(
                  Assets.ttt.levelBtn.path,
                  width: 200.w,
                  height: 60.w,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
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
}
