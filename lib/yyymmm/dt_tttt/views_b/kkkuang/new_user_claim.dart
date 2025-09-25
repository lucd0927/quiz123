import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/view/animated_scale.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/yy_gj/bbbb/kkkkuang/money_ccc.dart';
import 'package:quiz123/yy_gj/bbbb/vvvv/jc_btn.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../jichu_kuang/jichu_kuang.dart';
import '../../../../yy_gj/bbbb/kkkkuang/money_ddd.dart';
import '../../../../yy_gj/bbbb/vvvv/rotate.dart';

showNewUserClaimDialog(
  BuildContext context, {
  required VoidCallback onBtn,
  required double money,
}) {
  return jcKuang(
    context: context,
    child: NewUserClaim(
      onBtn: (prize) {
        MoneyDdd().show(
          context: context,
          onClose: (data) {
            DtController.to.addDatiCoin(prize);
            onBtn();
          },
          money: prize * 1.0,
        );
      },
      onBtn2: (prize) {
        MoneyDdd().show(
          context: context,
          onClose: (data) {
            DtController.to.addDatiCoin(prize);
            onBtn();
          },
          money: prize * 1.0,
        );
      },
      money: money,
    ),
  );
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
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
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
                    child: Image.asset(
                      Assets.bbb.newOpen.path,
                      width: 257.w,
                      height: 195.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),

          JcBtn(
            text: "Double Claim",
            showVideo: true,
            onBtn: (d) {
              Navigator.pop(context);
              onBtn(money * 2);
            },
          ),

          SizedBox(height: 10.w),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              onBtn2(money);
            },
            child: JCTextBorder(text: "\$$money"),
          ),
        ],
      ),
    );
  }
}
