import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/ads/index.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/view/animated_scale.dart';
import 'package:quiz123/yy_gj/bbbb/shuzhishuju.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/kkkuang/old_user_check.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/kkkuang/old_user_spin_check.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/zhuanpan.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../jichu_kuang/jichu_kuang.dart';

showOldUserDialog(BuildContext context, {required VoidCallback onBtn}) {
  return jcKuang(
    context: context,
    child: OldUser(
      onOpen: () {
        ZhuanpanOverlay().show(
          context: Get.context!,
          onSpin: (money) async{
            jcRizhi("==showOldUserSpinAndCheckDialog=money:$money===");
            bool showI = ShuzhiShuju.intad_point();
            if(showI){
              await JCAdsTools().showInterstitialAd(adPosId: JCAdsPosId.kwsbc_olduser_wheelspin_int);
            }
            await Future.delayed(Duration(milliseconds: 300),);
            showOldUserSpinAndCheckDialog(
              context,
              onBtn: () {},
              spinMoney: money,
            );
          },
          onClose: () {
            showOldUserCheckDialog(context, onBtn: () {});
          },
          zpTTT: EnumZhuanpanTTTT.old,
        );
      },
      onClose: () async{
        await Future.delayed(Duration(milliseconds: 300),);
        showOldUserCheckDialog(context, onBtn: () {});
      },
    ),
  );
}

class OldUser extends StatelessWidget {
  const OldUser({super.key, required this.onOpen, required this.onClose});

  final VoidCallback onOpen;
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
                        onOpen();
                      },
                      child: Container(
                        width: 213.h,
                        height: 66.h,
                        color: Colors.transparent,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              Assets.bbb.btnSpin.path,
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

  _centerView() {
    return Row(
      children: [
        Image.asset(
          Assets.bbb.dailyZp.path,
          width: 65.h,
          height: 65.h,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 5.w),
        Flexible(
          child: Text(
            "Spin the wheel daily for prize!",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16.sp,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ],
    );
  }
}
