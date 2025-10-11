import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:quiz123/jichu_kuang/jichu_kuang.dart';
import 'package:quiz123/tools/ios_store.dart';
import 'package:quiz123/view/animated_scale.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';

import '../../../gen/assets.gen.dart';

showFeedback(BuildContext context) {
  return jcKuang(
    context: context,
    child: Material(color: Colors.transparent, child: Fankui()),
  );
}

class Fankui extends StatelessWidget{
  const Fankui({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  Assets.bbb.close.path,
                  width: 20.h,
                  height: 20.h,
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 321.w,
              height: 240.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffD9F4DA), Color(0xffffffff)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(8.w),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Image.asset(Assets.bbb.hpOk.path, width: 96.h, height: 96.h),
                    SizedBox(height: 28.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(text: "Thanks For Your Feedback"),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            color: Color(0xff510d0d),
                          ),
                        ),
                        // SizedBox(width: 4.w),
                        // Image.asset(
                        //   Assets.bbb.money.path,
                        //   width: 20.h,
                        //   height: 20.h,
                        // ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 229.w,
                            height: 40.h,
                            decoration: BoxDecoration(color: Color(0xff1cae1c),borderRadius: BorderRadius.circular(8.w)),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0.w,
                            right: 0.w,
                            left: 0,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 4.w),
                                  JCTextBorder(
                                    text: "Ok",
                                    foreground: Color(0xff1cae1c),
                                  ),
                                  SizedBox(width: 4.w),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ],
    );
  }
}

show5StarHp(BuildContext context) {
  return jcKuang(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.8),
    child: Material(color: Colors.transparent, child: Give5Hp()),
  );
}

class Give5Hp extends StatefulWidget {
  const Give5Hp({super.key});

  @override
  State<Give5Hp> createState() => _Give5HpState();
}

class _Give5HpState extends State<Give5Hp> {
  bool showGesture = true;
  double star = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  Assets.bbb.close.path,
                  width: 20.h,
                  height: 20.h,
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
        Container(
          width: 324.w,
          height: 379.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffD9F4DA), Color(0xffffffff)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                "Give Us Good Review",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(height: 30.h),
              Image.asset(Assets.bbb.hpLogo.path, width: 110.h, height: 110.h),
              SizedBox(height: 28.h),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    color: Colors.red.withValues(alpha: 0),
                    child: RatingBar(
                      initialRating: star,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                        full: _image(Assets.bbb.hp5F.path),
                        half: _image(Assets.bbb.hp5F.path),
                        empty: _image(Assets.bbb.hp5Un.path),
                      ),
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: (rating) {
                        debugPrint("rating:$rating");
                        star = rating;
                        setState(() {
                          showGesture = false;
                        });
                        onGiveStar(context);
                      },
                    ),
                  ),
                  if (showGesture)
                    Positioned(
                      right: -30.w,
                      child: IgnorePointer(
                        child: JcDonghuaScale(
                          child: Image.asset(
                            Assets.ttt.gesture.path,
                            width: 95.h * 0.7,
                            height: 87.h * 0.7,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 14.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Complete Reviews Earn",
                      children: [
                        TextSpan(
                          text: " \$5",
                          style: TextStyle(color: Color(0xff007500)),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: Color(0xff4A4A4A),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Image.asset(Assets.bbb.money.path, width: 30.h, height: 30.h),
                ],
              ),
              SizedBox(height: 14.h),
              InkWell(
                onTap: () {
                  star =5.0;
                  onGiveStar(context);
                },
                child: Stack(
                  children: [
                    Container(
                      width: 229.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                        color: Color(0xff007F00),
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0.w,
                      right: 0.w,
                      left: 0,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 4.w),
                            JCTextBorder(
                              text: "Give 5 stars",
                              foreground: Color(0xff197a28),
                              fontSize: 16.sp,
                            ),
                            SizedBox(width: 4.w),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  onGiveStar(BuildContext context) async{
    Navigator.pop(context);
    DtController.to.toAppStoreCommitReview();
    if(star <= 4){
      await Future.delayed(Duration(milliseconds: 300));
      showFeedback(Get.context!);
    }else{
      DtController.to.addDatiCoin(5.0);
      IosStore.to();
    }


  }

  Widget _image(String asset) {
    return Image.asset(asset, height: 46.h, width: 46.h);
  }
}
