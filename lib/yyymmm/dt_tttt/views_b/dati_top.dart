import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/view/animated_count.dart';
import 'package:quiz123/view/jc_text_border.dart';

import '../../../gen/assets.gen.dart';

class DatiTop extends StatefulWidget {
  const DatiTop({super.key});

  @override
  State<DatiTop> createState() => _DatiTopState();
}

class _DatiTopState extends State<DatiTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58.h,
      child: Row(
        children: [
          Container(
            width: 214.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Color(0xffFFC850),
              border: Border.all(color: Color(0xff000000), width: 1.h),
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Row(
                    children: [
                      SizedBox(width: 30.w),
                      Container(
                        width: 100.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: Color(0xff8D4700),
                          border: Border.all(
                            color: Color(0xff000000),
                            width: 1.h,
                          ),
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        child: Center(
                          child: JCAnimatedCount(
                            value: 1000.00,
                            fractionDigits: 2,
                            prefix: "\$",
                            textStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 75.w,
                        height: 28.h,
                        child: Stack(
                          children: [
                            Image.asset(
                              Assets.bbb.quizBtn.path,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Center(
                              child: JCTextBorder(
                                text: "Withdraw",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 4.w),
                    ],
                  ),
                ),
                Positioned(
                  left: -30.w,
                  child: Image.asset(
                    Assets.bbb.quizMoney.path,
                    width: 57.w,
                    height: 36.w,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          _right(),
        ],
      ),
    );
  }

  _right() {
    double left = 100.01;
    double minWithdraw = 1000;
    return Container(
      width: 120.w,
      height: 60.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.bbb.quizTips.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 10.w,
            right: 8.w,
            top: 8.h,
            bottom: 8.h,
            child: Center(
              child: Container(
                color: Colors.green.withValues(alpha: 0.0),
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'Earn',
                      children: [
                        TextSpan(
                          text: " \$${left}",
                          // text: " 1000.00",
                          style: TextStyle(color: Color(0xffFF003D)),
                        ),
                        TextSpan(text: " MoreTo \nWithdraw "),
                        TextSpan(
                          text: "\$${minWithdraw.toStringAsFixed(0)}",
                          style: TextStyle(color: Color(0xffFF003D)),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      color: Color(0xff351900),
                      fontSize: 9.sp,
                      height: 1.8,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
