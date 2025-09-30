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

showTxTaskkkkWanchengDialog(
  BuildContext context, {
  required VoidCallback onBtn,
}) {
  return jcKuang(
    context: context,
    child: TxTaskkkkWancheng(
      onCashhhh: () {
        ZhuyeController.to.resetIndex(ZhuyeController.quizIndexB);
      },
      onClose: () {},
    ),
  );
}

class TxTaskkkkWancheng extends StatelessWidget {
  const TxTaskkkkWancheng({
    super.key,
    required this.onCashhhh,
    required this.onClose,
  });

  final VoidCallback onCashhhh;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    String icon = Assets.bbb.txCashout.path;
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
                            Assets.bbb.txWc.path,
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

                                Text.rich(
                                  TextSpan(
                                    text:
                                        "Your withdrawal amount has been issued and will arrive in",
                                    children: [
                                      TextSpan(
                                        text: " 3-5 ",
                                        style: TextStyle(
                                          color: Color(0xff26FF29),
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "working days. Please check your account",
                                      ),
                                    ],
                                  ),
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    height: 1.2,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
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
                              Assets.bbb.btnIknow.path,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
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
}
