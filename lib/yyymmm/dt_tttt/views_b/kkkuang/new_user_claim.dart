import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/ads/adsid.dart';
import 'package:quiz123/ads/jc_ads_tools.dart';
import 'package:quiz123/view/animated_scale.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/yy_gj/bbbb/kkkkuang/money_ccc.dart';
import 'package:quiz123/yy_gj/bbbb/vvvv/jc_btn.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../jichu_kuang/jichu_kuang.dart';
import '../../../../yy_gj/bbbb/kkkkuang/money_ddd.dart';
import '../../../../yy_gj/bbbb/vvvv/rotate.dart';
import '../../../../yy_gj/bbbb/vvvv/shake.dart';

showNewUserClaimDialog(
  BuildContext context, {
  required DynamicCallback onBtn,
  required DynamicCallback onBtn2,
  required double money,
}) {
  NewUserClaimOverlay().show(context: context, onBtn: onBtn, onBtn2: onBtn2, money: money);
  return;
  return jcKuang(
    context: context,
    child: NewUserClaim(
      onBtn: (prize) async {
        bool result = await JCAdsTools().showRewardAd(
          adPosId: JCAdsPosId.kwsbc_newuser_rv,
        );
        if (!result) {
          prize = money;
        }
        MoneyDdd().show(
          context: context,
          onClose: (data) {
            DtController.to.addDatiCoin(prize);
            onBtn(data);
          },
          money: prize * 1.0,
        );
      },
      onBtn2: (prize) {
        MoneyDdd().show(
          context: context,
          onClose: (data) {
            DtController.to.addDatiCoin(prize);
            onBtn2(data);
          },
          money: prize * 1.0,
        );
      },
      money: money,
    ),
  );
}

class NewUserClaimOverlay {
  OverlayEntry? _xuanfu;

  void show({
    required BuildContext context,
    required DynamicCallback onBtn,
    required DynamicCallback onBtn2,
    required double money,
  }) {
    _xuanfu = null;
    _xuanfu = OverlayEntry(
      builder: (context) {
        return NewUserClaim(
          onBtn: (prize) async {
            close();
            bool result = await JCAdsTools().showRewardAd(
              adPosId: JCAdsPosId.kwsbc_newuser_rv,
            );
            if (!result) {
              prize = money;
            }
            MoneyDdd().show(
              context: Get.context!,
              onClose: (data) {
                DtController.to.addDatiCoin(prize);
                onBtn(data);
              },
              money: prize * 1.0,
            );
          },
          onBtn2: (prize) {
            close();
            MoneyDdd().show(
              context: Get.context!,
              onClose: (data) {
                DtController.to.addDatiCoin(prize);
                onBtn2(data);
              },
              money: prize * 1.0,
            );
          },
          money: money,
        );
      },
    );
    Overlay.of(context).insert(_xuanfu!);
  }

  void close() {
    _xuanfu?.remove();
    _xuanfu = null;
  }
}

class NewUserClaim extends StatelessWidget {
  const NewUserClaim({
    super.key,
    required this.onBtn,
    required this.onBtn2,
    required this.money,
  });

  final DynamicCallback onBtn;
  final DynamicCallback onBtn2;
  final double money;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Colors.black.withValues(alpha: 0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                Assets.bbb.newTitle.path,
                width: 328.w,
                height: 28.w,
              ),
            ),
            Container(
              width: 340.w,
              height: 340.w,
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

                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: ShakeWidget(
                        mode: ShakeMode.rotate,
                        // offset: 8,
                        child: Image.asset(
                          Assets.bbb.newOpen.path,
                          width: 257.w,
                          height: 195.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20.h,
                    child: Center(
                      child: JCTextBorder(
                        text: "+\$${money}",
                        fontSize: 38.sp,
                        fontWeight: FontWeight.w800,
                        fontColor: Color(0xff6BFF70),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            JcBtn(
              text: "Double Claim",
              showVideo: true,
              onBtn: (d) {
                // Navigator.pop(context);
                onBtn(money * 2);
              },
            ),

            SizedBox(height: 10.h),
            InkWell(
              onTap: () {
                // Navigator.pop(context);
                onBtn2(money);
              },
              child: JCTextBorder(text: "\$$money"),
            ),
          ],
        ),
      ),
    );
  }
}
