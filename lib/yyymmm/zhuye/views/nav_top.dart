import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/yy_gj/jc_luy.dart';

import '../../../gen/assets.gen.dart';

double navTopRealHeight = 120.h;

class NavTop extends StatefulWidget {
  const NavTop({super.key});

  @override
  State<NavTop> createState() => _NavTopState();
}

class _NavTopState extends State<NavTop> {
  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil().statusBarHeight;
    if (height < 10) {
      height = 50.h;
    }
    return Container(
      // height: navTopRealHeight,
      // color: Colors.amber,
      width: ScreenUtil().screenWidth,
      child: Column(
        children: [
          SizedBox(height: height),
          Container(
            height: 34.h,
            width: ScreenUtil().screenWidth,
            // color: Colors.red,
            child: Row(
              children: [
                SizedBox(width: 8.w),
                coinWidgetA(),
                SizedBox(width: 8.w),
                starWidgetA(),
                Spacer(),
                shezhiWidget(),
                SizedBox(width: 8.w),
              ],
            ),
          ),
        ],
      ),
    );
  }

  shezhiWidget() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(JcLuy.shezhi);
      },
      child: Image.asset(
        Assets.ttt.quizTopSetting.path,
        width: 34.h,
        height: 34.h,
      ),
    );
  }

  coinWidgetA() {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Color(0xffFFC850),
        border: Border.all(color: Color(0xff000000), width: 1.h),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Row(
        children: [
          Image.asset(
            Assets.ttt.quizCoin.path,
            width: 31.h,
            height: double.infinity,
          ),
          Container(
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: Color(0xff8D4700),
              // border: Border.all(color: Color(0xff000000),width: 1.h),
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: Center(child: JCTextBorder(text: "2400")),
          ),
        ],
      ),
    );
  }

  starWidgetA() {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Color(0xffFFC850),
        border: Border.all(color: Color(0xff000000), width: 1.h),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Row(
        children: [
          Image.asset(
            Assets.ttt.quizStar.path,
            width: 31.h,
            height: double.infinity,
          ),
          Container(
            height: 31.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: Color(0xff8D4700),
              // border: Border.all(color: Color(0xff000000),width: 1.h),
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: Center(child: JCTextBorder(text: "4/10")),
          ),
        ],
      ),
    );
  }
}
