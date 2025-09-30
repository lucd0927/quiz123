import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:quiz123/tools/num_floor.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/yy_gj/bbbb/shuzhishuju.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';
import 'package:quiz123/yyymmm/xxjj/xj_ddd_controller.dart';
import 'package:tuple/tuple.dart';

import '../../gen/assets.gen.dart';
import '../../tools/rizhi.dart';
import '../../view/jc_jindutiao.dart';

class XjDdd extends StatefulWidget {
  const XjDdd({super.key});

  @override
  State<XjDdd> createState() => _XjDddState();
}

class _XjDddState extends State<XjDdd> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          SizedBox(height: 52.h),
          tttopTabView(),
          SizedBox(height: 20.h),
          Expanded(child: bbbbottomChildView()),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            color: Color(0xff202438).withValues(alpha: 0.7),
            child: Text(
              "Tips：Cash will arrive in your account within 24 hours as soon as possible",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                color: Color(0xffD1DDFF),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    });
  }

  tttopTabView() {
    return Container(
      width: double.infinity,
      height: 116.h,
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      decoration: BoxDecoration(color: Color(0xff202438)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            tttopItemView(payType: EnumPayType.paypal),
            tttopItemView(payType: EnumPayType.cashapp),
            tttopItemView(payType: EnumPayType.pagbank),
            tttopItemView(payType: EnumPayType.amazon),
            tttopItemView(payType: EnumPayType.gpay),
            tttopItemView(payType: EnumPayType.webmoney),
            tttopItemView(payType: EnumPayType.mastercard),
          ],
        ),
      ),
    );
  }

  tttopItemView({required EnumPayType payType}) {
    String tmpPayCard = XjDddController.to.curPayCard.value;
    bool tmpSelect = payType.name == tmpPayCard;
    double height = tmpSelect ? 97.h : 86.h;
    String iconName = XjDddController.to.topPayIcon(payType: payType);
    return GestureDetector(
      onTap: () {
        XjDddController.to.curPayCard.value = payType.name;
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: height,
        margin: EdgeInsets.only(right: 10.w),
        child: Container(
          width: 313.w,
          height: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                iconName,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
                gaplessPlayback: true,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: double.infinity,
                  height: 22.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff262941).withValues(alpha: 0),
                        Color(0xff272A42).withValues(alpha: 0.58),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 20.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Balance",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff1B1B1B),
                      ),
                    ),
                    Text(
                      "\$${DtController.to.curMoney.value.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff027000),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bbbbottomChildView() {
    List<double> moneys = ShuzhiShuju.eq_range();

    List<Widget> itemssss = [];
    for (var money in moneys) {
      Widget item = bbbbottomChildViewItem(money: money);
      itemssss.add(item);
    }

    return SingleChildScrollView(child: Column(children: [...itemssss]));
  }

  bbbbottomChildViewItem({required double money}) {
    String iconName = XjDddController.to.curPayCardIdWithBottom();

    double progress = DtController.to.curMoney.value / money;
    if (progress > 1) {
      progress = 1;
    }
    bool showJinnnn = XjDddController.to.showJindu(money: money);
    if (showJinnnn) {
      return _txJinduItem(money: money);
    }
    return Container(
      width: 355.w,
      height: 97.w,
      margin: EdgeInsets.only(bottom: 16.w),
      child: Stack(
        children: [
          Image.asset(
            iconName,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            gaplessPlayback: true,
          ),

          Positioned(
            left: 100.w,
            top: 0,
            bottom: 0,
            child: Center(
              child: JCTextBorder(
                text: "\$${money.toStringAsFixed(0)}",
                fontWeight: FontWeight.w900,
                fontSize: 25.sp,
              ),
            ),
          ),
          Positioned(
            right: 10.w,
            top: 0,
            bottom: 6.w,
            child: GestureDetector(
              onTap: () {
                XjDddController.to.onTxFun(money: money);
              },
              child: Container(
                width: 120.w,
                color: Colors.green.withValues(alpha: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.bbb.btnCashout.path,
                      width: 97.w,
                      height: 36.w,
                      gaplessPlayback: true,
                    ),
                    SizedBox(height: 10.w),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        JCJingdutiao(
                          height: 11.h,
                          innerHeight: 10.h,
                          gradientColors: [
                            Color(0xffFF6B09),
                            Color(0xffFF6B09),
                            Color(0xffFF6B09),
                          ],
                          bgColor: Color(0xffD9DCE5),
                          text: "${(progress * 100).toStringAsFixed(0)}%",
                          width: 110.w,
                          progress: progress,
                          txtColor: Colors.black.withValues(alpha: 0.1),
                        ),
                        Positioned(
                          left: -10.w,
                          top: -4.h,
                          child: Image.asset(
                            Assets.bbb.money.path,
                            width: 36.w,
                            height: 22.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _txJinduItem({required double money}) {
    int curCount = 0;
    int allCount = 20;
    List<String> texts = ["", ""];
    String icon = Assets.bbb.txQqquiz.path;
    String now_stage = XjDddController.to.now_stage();
    if (now_stage == "stage_1") {
      Tuple4 itemTuple3 = XjDddController.to.stage_1();
      curCount = itemTuple3.item1;
      allCount = itemTuple3.item2;
      texts = itemTuple3.item3;
    } else if (now_stage == "stage_3") {
      Tuple4 itemTuple3 = XjDddController.to.stage_2();
      curCount = itemTuple3.item1;
      allCount = itemTuple3.item2;
      texts = itemTuple3.item3;
    }
    String des = texts[0];
    String des2 = "$curCount";
    String des3 = texts[1];
    String des4 = "$curCount/$allCount";
    double progress = 0;
    progress = curCount / allCount;

    progress = progress.toAsFixedFloor(2);
    jcRizhi("==now_stage:$now_stage=progress:$progress==");
    double tmpWidth = 180.w;
    return Container(
      width: 355.w,
      height: 112.w,
      margin: EdgeInsets.only(bottom: 16.w),
      child: Stack(
        children: [
          Image.asset(
            Assets.bbb.xjBottomSuccess.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            gaplessPlayback: true,
          ),

          Positioned(
            left: 10.w,
            top: 0,
            bottom: 0,
            child: Container(
              color: Colors.indigo.withValues(alpha: 0.0),
              width: 200.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 42.h,

                    child: Row(
                      children: [
                        Image.asset(icon, width: 42.h, height: 42.h),
                        SizedBox(width: 8.w),
                        JCTextBorder(
                          text: "\$${money.toStringAsFixed(0)}",
                          fontWeight: FontWeight.w900,
                          fontSize: 25.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  SizedBox(
                    width: tmpWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                              text: des,
                              children: [
                                TextSpan(
                                  text: " $des4 ",
                                  style: TextStyle(color: Color(0xffDA3B0A)),
                                ),
                                TextSpan(text: des3),
                              ],
                            ),
                            style: TextStyle(
                              fontSize: 11.sp,
                              height: 1,
                              color: Color(0xff242104),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  JCJingdutiao(
                    width: tmpWidth,
                    height: 12.w,
                    innerHeight: 10.w,
                    text: "",
                    bgColor: Color(0xff390000),
                    progress: progress,
                    border: Border.all(color: Color(0xff000000)),
                    gradientColors: [
                      Color(0xffFF6B09),
                      Color(0xffFF6B09),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 10.w,
            top: 0,
            bottom: 6.w,
            child: GestureDetector(
              onTap: () {
                XjDddController.to.onTxFun(money: money);
              },
              child: Container(
                width: 120.w,
                color: Colors.green.withValues(alpha: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.bbb.xjProcessing.path,
                      width: 97.w,
                      height: 36.w,
                      gaplessPlayback: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
