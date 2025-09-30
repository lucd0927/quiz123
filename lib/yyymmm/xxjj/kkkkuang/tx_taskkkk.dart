import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/tools/num_floor.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/view/animated_scale.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/yy_gj/bbbb/shuzhishuju.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/kkkuang/old_user_check.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/kkkuang/old_user_spin_check.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/zhuanpan.dart';
import 'package:quiz123/yyymmm/xxjj/xj_ddd_controller.dart';
import 'package:quiz123/yyymmm/zhuye/zhuye_controller.dart';
import 'package:tuple/tuple.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../jichu_kuang/jichu_kuang.dart';
import '../../../view/jc_jindutiao.dart';

showTxTaskkkkDialog(BuildContext context, {required VoidCallback onBtn}) {
  return jcKuang(
    context: context,
    child: TxTaskkkk(onCashhhh: () {
      ZhuyeController.to.resetIndex(ZhuyeController.quizIndexB);
    }, onClose: () {}),
  );
}

class TxTaskkkk extends StatelessWidget {
  const TxTaskkkk({super.key, required this.onCashhhh, required this.onClose});

  final VoidCallback onCashhhh;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    String tmpNNNStage = XjDddController.to.now_stage();
    String icon = Assets.bbb.txCashout.path;
    if (tmpNNNStage == "stage_1") {
      icon = Assets.bbb.txCashout.path;
    } else if (tmpNNNStage == "stage_3") {
      icon = Assets.bbb.txOnelastTitle.path;
    }
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  onClose();
                },
                child: Image.asset(
                  Assets.bbb.close.path,
                  width: 20.w,
                  height: 20.w,
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
          Container(
            width: double.infinity,
            height: 360.h,
            color: Colors.green.withValues(alpha: 0.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 40.h,
                  child: Center(
                    child: Container(
                      width: 287.h,
                      height: 289.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            Assets.bbb.txOnelastBg.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Positioned.fill(
                            left: 10.w,
                            right: 10.w,
                            child: Column(
                              children: [
                                SizedBox(height: 152.h),
                                Container(
                                  width: double.infinity,
                                  height: 81.h,
                                  color: Colors.green.withValues(alpha: 0.0),
                                  child: _centerView(),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 34.h,
                            child: Center(
                              child: Container(
                                width: 179.h,
                                height: 99.h,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      XjDddController.to.curPayCardIdWithPop(),
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0.h,
                                      child: Center(
                                        child: Container(
                                          height: 42.h,
                                          color: Colors.teal.withValues(
                                            alpha: 0.0,
                                          ),
                                          child: Center(
                                            child: JCTextBorder(
                                              text:
                                                  "\$${XjDddController.to.sssavemoney.toStringAsFixed(0)}",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  top: -4.h,
                  child: Center(
                    child: Image.asset(
                      icon,
                      width: 364.w,
                      height: 88.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0.h,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        onCashhhh();
                      },
                      child: Container(
                        width: 213.h,
                        height: 66.h,
                        color: Colors.teal.withValues(alpha: 0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              Assets.bbb.btnCashout2.path,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              right: 10.w,
                              top: 10.h,
                              child: IgnorePointer(
                                child: JcAnimatedScale(
                                  child: Image.asset(
                                    Assets.ttt.gesture.path,
                                    width: 95.h,
                                    height: 87.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _centerView({
    double? width,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    return GetBuilder<XjDddController>(
      builder: (c) {
        int curCount = 0;
        int allCount = 20;
        List<String> texts = ["", ""];
        String now_stage = XjDddController.to.now_stage();
        if (now_stage == "stage_1") {
          Tuple4 itemTuple3 = XjDddController.to.stage_1();
          curCount = itemTuple3.item1;
          allCount = itemTuple3.item2;
          texts = itemTuple3.item3;
        } else if (now_stage == "stage_3") {
          Tuple4 itemTuple3 = XjDddController.to.stage_2();
          curCount = itemTuple3.item1;
          allCount = itemTuple3.item2;
          texts = itemTuple3.item3;
        }
        String des = texts[0];
        String des2 = "$curCount";
        String des3 = texts[1];
        String des4 = "$curCount/$allCount";
        double progress = 0;
        progress = curCount / allCount;

        progress = progress.toAsFixedFloor(2);
        jcRizhi("==now_stage:$now_stage=progress:$progress==");
        double tmpWidth = width ?? 240.w;
        return Container(
          width: tmpWidth,
          // color: Colors.red,
          // margin: EdgeInsets.only(top: 8.h, bottom: 0.h),
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: tmpWidth,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    JCTextBorder(
                      text: des,
                      fontSize: 14.sp,
                      fontColor: Color(0xffDCE8FF),
                      foreground: Colors.black,
                      height: 1,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: JCTextBorder(
                        text: des4,
                        fontColor: Color(0xff26FF29),
                        foreground: Colors.black,
                        fontSize: 14.sp,

                        height: 1,
                      ),
                    ),

                    JCTextBorder(
                      text: des3,
                      fontColor: Color(0xffDCE8FF),
                      foreground: Colors.black,
                      fontSize: 14.sp,

                      height: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              JCJingdutiao(
                width: tmpWidth,
                height: 12.w,
                innerHeight: 10.w,
                text: "",
                bgColor: Color(0xff390000),
                progress: progress,
                border: Border.all(color: Color(0xff000000)),
                gradientColors: [
                  Color(0xffFDF009),
                  Color(0xffFDF009),
                  Color(0xffFDF009),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
