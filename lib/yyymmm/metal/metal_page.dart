import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/view/jc_text_border.dart';

import '../../gen/assets.gen.dart';

class MetalPage extends StatefulWidget {
  const MetalPage({super.key});

  @override
  State<MetalPage> createState() => _MetalPageState();
}

class _MetalPageState extends State<MetalPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          topLevel(),

          SizedBox(height: 20.h),
          answerStates(),
          SizedBox(height: 10.h),
          levelStates(),
        ],
      ),
    );
  }

  topLevel() {
    return Center(
      child: Container(
        width: 152.h,
        height: 152.h,
        child: Stack(
          children: [
            Image.asset(
              Assets.ttt.metalLevelBg.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),

            Center(
              child: Image.asset(
                Assets.ttt.level1Big.path,
                width: 88.h,
                height: 88.h,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  Assets.ttt.level1.path,
                  width: double.infinity,
                  height: 24.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  answerStates() {
    return Row(
      children: [
        Image.asset(Assets.ttt.metalRight.path, width: 34.h, height: 34.h),
        JCTextBorder(text: "50/50"),
        Spacer(),
        Image.asset(Assets.ttt.metalError.path, width: 34.h, height: 34.h),
        JCTextBorder(text: "50/50"),
        Spacer(),
        Image.asset(Assets.ttt.metalTime.path, width: 34.h, height: 34.h),
        JCTextBorder(text: "50s"),
      ],
    );
  }

  levelStates() {
    return Container(
      width: double.infinity,
      height: 286.h,
      decoration: BoxDecoration(
        color: Color(0xff535875),
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    Assets.ttt.level1Big.path,
                    width: 72.h,
                    height: 57.h,
                  ),
                  Image.asset(
                    Assets.ttt.level1.path,
                    width: 72.h,
                    height: 24.h,
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    Assets.ttt.level1Big.path,
                    width: 72.h,
                    height: 57.h,
                  ),
                  Image.asset(
                    Assets.ttt.level1.path,
                    width: 72.h,
                    height: 24.h,
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    Assets.ttt.level1Big.path,
                    width: 72.h,
                    height: 57.h,
                  ),
                  Image.asset(
                    Assets.ttt.level1.path,
                    width: 72.h,
                    height: 24.h,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    Assets.ttt.level1Big.path,
                    width: 72.h,
                    height: 57.h,
                  ),
                  Image.asset(
                    Assets.ttt.level1.path,
                    width: 72.h,
                    height: 24.h,
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    Assets.ttt.level1Big.path,
                    width: 72.h,
                    height: 57.h,
                  ),
                  Image.asset(
                    Assets.ttt.level1.path,
                    width: 72.h,
                    height: 24.h,
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    Assets.ttt.level1Big.path,
                    width: 72.h,
                    height: 57.h,
                  ),
                  Image.asset(
                    Assets.ttt.level1.path,
                    width: 72.h,
                    height: 24.h,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
