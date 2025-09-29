import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/view/animated_scale.dart';
import 'package:quiz123/yy_gj/bbbb/kkkkuang/money_ddd.dart';
import 'package:quiz123/yy_gj/bbbb/shuzhishuju.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';
import 'package:quiz123/yyymmm/zhuye/zhuye_controller.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../jichu_kuang/jichu_kuang.dart';
import '../../../../yy_gj/bbbb/vvvv/rotate.dart';
import 'new_user_claim.dart';

showGuideWithdrawDialog(
  BuildContext context, {
  required VoidCallback onBtn,
  required double money,
}) {
  return jcKuang(
    context: context,
    child: GuideWithdraw(
      onOpen: () {
        MoneyDdd().show(
          context: context,
          money: money,
          showMoneyHero: false,
          onClose: (d) {
            DtController.to.addDatiCoin(money);
            ZhuyeController.to.resetIndex(ZhuyeController.cashIndexB);
            onBtn();
          },
        );
      },
      money: money,
    ),
  );
}

class GuideWithdraw extends StatelessWidget {
  const GuideWithdraw({super.key, required this.onOpen, required this.money});

  final VoidCallback onOpen;
  final double money;

  @override
  Widget build(BuildContext context) {
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
            width: 375.w,
            height: 375.w,
            child: Stack(
              children: [
                Center(
                  child: RotateWidget(
                    child: Image.asset(
                      Assets.bbb.xuanguang.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          Assets.bbb.quiz1Jinqiandai.path,
                          width: 256.w,
                          height: 203.w,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 200.w,
                        child: Center(
                          child: Text(
                            "+\$${money}",
                            style: TextStyle(
                              fontSize: 39.sp,
                              color: Color(0xff36841C),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10.w,
                  child: Center(
                    child: Container(
                      width: 263.w,
                      height: 49.w,
                      decoration: BoxDecoration(
                        color: Color(0xffFFF1C9),
                        borderRadius: BorderRadius.circular(8.w),
                        border: Border.all(
                          color: Color(0xffAA5D03),
                          width: 2.w,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "My Cash:",
                            style: TextStyle(
                              fontSize: 19.sp,
                              color: Color(0xff6B0000),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "\$${money}",
                            style: TextStyle(
                              fontSize: 19.sp,
                              color: Color(0xff36841C),
                              fontWeight: FontWeight.w900,
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
          SizedBox(height: 20.w),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              onOpen();
            },
            child: Container(
              width: 190.w,
              height: 65.w,
              child: Image.asset(
                Assets.bbb.quiz1Btn.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
