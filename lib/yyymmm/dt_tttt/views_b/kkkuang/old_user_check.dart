import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/ads/adsid.dart';
import 'package:quiz123/ads/jc_ads_tools.dart';
import 'package:quiz123/view/animated_scale.dart';
import 'package:quiz123/yy_gj/bbbb/kkkkuang/money_ccc.dart';
import 'package:quiz123/yy_gj/bbbb/shuzhishuju.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/zhuanpan.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../jichu_kuang/jichu_kuang.dart';
import '../../../../yy_gj/bbbb/kkkkuang/money_ddd.dart';

showOldUserCheckDialog(BuildContext context, {required VoidCallback onBtn}) {
  double money = ShuzhiShuju.check_prize();
  return jcKuang(
    context: context,
    child: OldUserCheck(
      onDouble: (money) async{
        bool result = await JCAdsTools().showRewardAd(adPosId: JCAdsPosId.kwsbc_olduser_signin_rv);
        if(result){
          MoneyDdd().show(
            context: context,
            onClose: (data) {
              DtController.to.addDatiCoin(data);
            },
            money: money,
          );
        }

      },
      onClose: () {},
      money: money,
      onClaim: (data) async{
        bool showI = ShuzhiShuju.intad_point();
        if(showI){
          bool result = await JCAdsTools().showRewardAd(adPosId: JCAdsPosId.kwsbc_olduser_signin_int);
        }

        MoneyDdd().show(
          context: context,
          onClose: (data) {
            DtController.to.addDatiCoin(data);
          },
          money: money,
        );
      },
    ),
  );
}

class OldUserCheck extends StatelessWidget {
  const OldUserCheck({
    super.key,
    required this.onDouble,
    required this.onClose,
    required this.money,
    required this.onClaim,
  });

  final DynamicCallback onDouble;
  final DynamicCallback onClaim;
  final VoidCallback onClose;
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
                        onDouble(money * 2);
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
        SizedBox(width: 5.w),
        Image.asset(
          Assets.bbb.dailyCheck.path,
          width: 61.h,
          height: 75.h,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 36.h,
                // color: Colors.green,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  "daily check reward",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.sp,
                    color: Color(0xffffffff),
                  ),
                  minFontSize: 7.w,
                  stepGranularity: 7.w,
                ),
              ),
              AutoSizeText(
                "+\$${money}",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16.sp,
                  color: Color(0xff3BFF62),
                ),
                minFontSize: 7.w,
                stepGranularity: 7.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
