import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/ads/index.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/view/animated_scale.dart';
import 'package:quiz123/wangluo/shijian_baogao.dart';
import 'package:quiz123/yy_gj/bbbb/kkkkuang/money_ccc.dart';

import 'package:quiz123/yyymmm/dt_tttt/views_b/zhuanpan.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../jichu_kuang/jichu_kuang.dart';
import '../../../../yy_gj/bbbb/kkkkuang/money_ddd.dart';
import '../../../../yy_gj/bbbb/shuzhishuju.dart';
import '../../dt_controller.dart';

showOldUserSpinAndCheckDialog(
  BuildContext context, {
  required VoidCallback onBtn,
  required double spinMoney,
}) {
  JCShijianBaogao.daily_pop("wheel");
  double money = ShuzhiShuju.check_prize();
  return jcKuang(
    context: context,
    child: OldUserSpinAndCheck(
      onDouble: (dddmoney) async{
        JCShijianBaogao.daily_pop_c("wheel");
        jcRizhi("=OldUserSpinAndCheck=dddmoney:$dddmoney===");
        bool result = await JCAdsTools().showRewardAd(adPosId: JCAdsPosId.kwsbc_olduser_wheel_rv);
        if(result){
          MoneyDdd().show(
            context: context,
            onClose: (data) {
              jcRizhi("==data:$data===");
              DtController.to.addDatiCoin(dddmoney);
            },
            money: dddmoney,
          );
        }

      },
      onClose: () {
        JCShijianBaogao.daily_pop_c("wheel");
      },
      spinMoney: spinMoney,
      checkMoney: money,
      onClaim: (data) async{
        JCShijianBaogao.daily_pop_c("wheel");
        bool showI = ShuzhiShuju.intad_point();
        if(showI){
          await JCAdsTools().showInterstitialAd(adPosId: JCAdsPosId.kwsbc_olduser_wheel_int);
        }
        jcRizhi("=OldUserSpinAndCheck=onClaim:$data=showI:$showI==");
        MoneyDdd().show(
          context: context,
          onClose: (data) {
            DtController.to.addDatiCoin(data);
          },
          money: data,
        );
      },
    ),
  );
}

class OldUserSpinAndCheck extends StatelessWidget {
  const OldUserSpinAndCheck({
    super.key,
    required this.onDouble,
    required this.onClose,
    required this.spinMoney,
    required this.checkMoney,
    required this.onClaim,
  });

  final double spinMoney;
  final double checkMoney;
  final DynamicCallback onDouble;
  final DynamicCallback onClaim;
  final VoidCallback onClose;

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
            height: 420.h,
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
                      height: 328.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            Assets.bbb.dailyBg.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Positioned.fill(
                            left: 10.w,
                            right: 10.w,
                            child: Column(
                              children: [
                                SizedBox(height: 170.h),
                                Container(
                                  width: double.infinity,
                                  height: 98.h,
                                  color: Colors.green.withValues(alpha: 0.0),
                                  child: _centerView(),
                                ),
                              ],
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
                  top: -34.h,
                  child: Center(
                    child: Image.asset(
                      Assets.bbb.dailyTop.path,
                      width: 364.w,
                      height: 126.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10.h,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        double tmp = spinMoney + checkMoney;
                        onDouble(tmp * 2);
                      },
                      child: Container(
                        width: 213.h,
                        height: 66.h,
                        color: Colors.transparent,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              Assets.bbb.dailyBtn.path,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              right: 10.w,
                              top: 10.h,
                              child: IgnorePointer(
                                child: JcDonghuaScale(
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
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              double money = spinMoney + checkMoney;
              onClaim(money);
            },
            child: Text(
              "Claim",
              style: TextStyle(fontSize: 14.sp, color: Color(0xffffffff)),
            ),
          ),
        ],
      ),
    );
  }

  _centerView() {
    return Row(
      children: [
        Spacer(),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              Assets.bbb.dailyZp.path,
              width: 65.h,
              height: 65.h,
              fit: BoxFit.fill,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: -10.h,
              child: Center(
                child: Text(
                  "+\$${spinMoney}",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.sp,
                    color: Color(0xff3BFF62),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Image.asset(
            Assets.bbb.dailyAdd.path,
            width: 25.h,
            height: 25.h,
            fit: BoxFit.fill,
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              Assets.bbb.dailyCheck.path,
              width: 65.h,
              height: 65.h,
              fit: BoxFit.fill,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: -10.h,
              child: Center(
                child: Text(
                  "+\$${checkMoney}",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.sp,
                    color: Color(0xff3BFF62),
                  ),
                ),
              ),
            ),
          ],
        ),
        Spacer(),
      ],
    );
  }
}
