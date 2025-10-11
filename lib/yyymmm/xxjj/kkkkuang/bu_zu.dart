import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/tools/num_floor.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/yy_gj/bbbb/kkkkuang/money_ccc.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';
import 'package:quiz123/yyymmm/xxjj/xj_ddd_controller.dart';
import 'package:quiz123/yyymmm/zhuye/zhuye_controller.dart';

import '../../../gen/assets.gen.dart';
import '../../../jichu_kuang/jichu_kuang.dart';
import '../../../wangluo/shijian_baogao.dart';

showBuzuCard(
  BuildContext context, {
  required VoidCallback onBtn,
  required VoidCallback onClose,
}) {
  JCShijianBaogao.cash_not_pop();
  return jcKuang(
    context: context,
    child: BuzuCard(
      onClose: () {
        JCShijianBaogao.cash_not_pop_c();
      },
      onSubmit: (data) {
        JCShijianBaogao.cash_not_pop_c();
        ZhuyeController.to.resetIndex(ZhuyeController.quizIndexB);
      },
    ),
  );
}

class BuzuCard extends StatefulWidget {
  const BuzuCard({super.key, required this.onClose, required this.onSubmit});

  final VoidCallback onClose;
  final DynamicCallback onSubmit;

  @override
  State<BuzuCard> createState() => _BuzuCardState();
}

class _BuzuCardState extends State<BuzuCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      double money = DtController.to.curMoney.value.toAsFixedFloor(2);
      double nextmoney = DtController.to.minWithdrawJine - money;
      if (nextmoney <= 0) {
        nextmoney = 0.0;
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  widget.onClose();
                },
                child: Image.asset(
                  Assets.ttt.close.path,
                  width: 20.h,
                  height: 20.h,
                ),
              ),
              SizedBox(width: 30.w),
            ],
          ),
          SizedBox(height: 20.h),
          Container(
            width: 324.w,
            height: 250.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffD9F4DA), Color(0xffffffff)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 50.h,
                  child: Center(
                    child: Text(
                      "Cash Out",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text.rich(
                      TextSpan(
                        text: "Your current balance is ",
                        children: [
                          TextSpan(
                            text: "\$$money",
                            style: TextStyle(color: Color(0xffDD4509)),
                          ),
                          TextSpan(text: ", Collect "),
                          TextSpan(
                            text: "\$${nextmoney.toStringAsFixed(2)}",
                            style: TextStyle(color: Color(0xffDD4509)),
                          ),
                          TextSpan(
                            text:
                                " and you can withdraw cash！Go and Get more Cash！",
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(child: _btnSubmit()),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      );
    });
  }

  _btnSubmit() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        widget.onSubmit(null);
      },
      child: Container(
        width: 294.w,
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xff007F00),
          borderRadius: BorderRadius.circular(6.w),
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.02),
            width: 1.w,
          ),
        ),

        child: Text(
          "Submit",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
