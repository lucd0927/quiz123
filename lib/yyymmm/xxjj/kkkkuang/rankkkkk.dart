import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/jichu_kuang/jichu_kuang.dart';
import 'package:quiz123/tools/num_floor.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';
import 'package:quiz123/yyymmm/xxjj/xj_ddd_controller.dart';

import 'package:tuple/tuple.dart';

import '../../../gen/assets.gen.dart';
import '../../../view/animated_count.dart';

showTixianPaimingDialog(BuildContext context, {required double withdrawMoney}) {
  return jcKuang(
    context: context,
    child: TixianPaimingWidget(
      onClose: () {},
      onBtn: () async {

      },
      withdrawMoney: withdrawMoney,
    ),
  );
}

class TixianPaimingWidget extends StatefulWidget {
  const TixianPaimingWidget({
    super.key,

    required this.onClose,
    required this.onBtn,
    required this.withdrawMoney,
  });

  final VoidCallback onClose;
  final VoidCallback onBtn;
  final double withdrawMoney;

  @override
  State<TixianPaimingWidget> createState() => _TixianPaimingWidgetState();
}

class _TixianPaimingWidgetState extends State<TixianPaimingWidget> {
  int index = 0;
  bool showStep2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 200.h),
          GetBuilder<XjDddController>(
            builder: (controller) {
              return xxxxvvv();
            },
          ),
        ],
      ),
    );
  }

  xxxxvvv() {
    double money = DtController.to.curMoney.value;
    int minWithdrawMoney = widget.withdrawMoney ~/ 1;
    double shengyu = minWithdrawMoney - money;
    if (shengyu <= 0) {
      shengyu = 0.0;
    }
    shengyu = shengyu.toAsFixedFloor(2);
    return Container(
      width: 678.w,
      height: 1037.h,
      decoration: BoxDecoration(
        color: Color(0xff7983A8),
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Stack(
            children: [
              Container(
                width: double.infinity,
                // color: Colors.amber,
                height: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Withdrawal approval",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xffffffff),
                        fontSize: 34.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 20.w,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    widget.onClose();
                  },
                  child: Image.asset(
                    Assets.ttt.close.path,
                    width: 20.h,
                    height: 20.h,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 640.w,
                height: 940.h,
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFF),
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      "paimingCongratulations".tr,
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff3B434C),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          XjDddController.to.curPayCardIdWithPop(),
                          width: 112.h,
                          height: 28.h,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 50.h,
                          child: Center(
                            child: Text(
                              "${widget.withdrawMoney}",
                              style: TextStyle(
                                color: Color(0xff30323A),
                                fontSize: 60.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 600.w, child: PbPaihangWidget()),
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                            widget.onBtn();
                          },
                          child: Container(
                            width: 353.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              color: Color(0xffFFE400),
                              borderRadius: BorderRadius.circular(16.w),
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Center(
                                  child: Text(
                                    "Skip wait".tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 42.sp,
                                      // foreground: Color(0xffD0871E),
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -20.h,
                                  right: -10.w,
                                  child: Image.asset(
                                    Assets.bbb.ad.path,
                                    width: 33.w,
                                    height: 25.w,
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
            ),
          ),
        ],
      ),
    );
  }
}

class PbPaihangWidget extends StatefulWidget {
  const PbPaihangWidget({super.key});

  @override
  State<PbPaihangWidget> createState() => _PbPaihangWidgetState();
}

class _PbPaihangWidgetState extends State<PbPaihangWidget> {
  int curPaiming = 99;
  List paidata = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    paidata = piahangshuju();
  }

  @override
  Widget build(BuildContext context) {
    Tuple4 itemTuple3 = XjDddController.to.stage_1();
    int curShuling = itemTuple3.item1;
    curPaiming = curShuling;
    int allShuling = itemTuple3.item2;

    List<Widget> itemsWidget = [];

    var linshiData = paidata;
    for (int i = 0; i < linshiData.length; i++) {
      var tmp = linshiData[i];
      String id = tmp[kWithdrawId];
      double money = tmp[kWithdraw];
      Widget item = genwidget(id: id, aaa: i, money: money);
      itemsWidget.add(item);
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$allShuling",
              style: TextStyle(
                fontSize: 24.sp,
                color: Color(0xff07BC29),
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                "${"rankdes".tr}:",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              "$curShuling",
              style: TextStyle(
                fontSize: 24.sp,
                color: Color(0xff07BC29),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.w),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.w),
          child: SizedBox(
            height: 400.h,
            child: SingleChildScrollView(
              // padding: EdgeInsets.symmetric(horizontal: 48.w),
              child: Column(
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 32.sp,
                    ),
                    child: Container(
                      color: Color(0xffE9EEFF),
                      height: 64.h,
                      child: Row(
                        children: [
                          Expanded(child: Center(child: Text("User ID".tr))),
                          Expanded(child: Center(child: Text("Account".tr))),
                          Expanded(child: Center(child: Text("Money".tr))),
                        ],
                      ),
                    ),
                  ),
                  ...itemsWidget,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  static const String kWithdraw = "cash_money";
  static const String kWithdrawId = "cash_id";

  List piahangshuju() {
    List tmp = [];

    for (int i = 0; i < 50; i++) {
      int pre = Random().nextInt(9);
      int next = Random().nextInt(90) + 10;
      var item = {
        kWithdraw: DtController.to.minWithdrawJine,
        kWithdrawId: "$pre***$next",
      };
      tmp.add(item);
    }

    return tmp;
  }

  genwidget({required int aaa, required String id, required double money}) {
    int tmpRank = aaa + 1;
    if (tmpRank == curPaiming) {
      id = "12****54";
      String cardId = XjDddController.to.sssavePayCardId;
      int length = cardId.length;
      if (length > 3) {
        String first = cardId[0];
        String last2 = cardId.substring(length - 2);
        id = "$first****$last2";
      }

      money = XjDddController.to.sssavemoney;
      return DefaultTextStyle(
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.red,
          fontSize: 32.sp,
        ),
        child: Container(
          color: Colors.red.withValues(alpha: 0.2),
          height: 64.h,
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "0${aaa + 1}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                      fontSize: 32.sp,
                    ),
                  ),
                ),
              ),
              Expanded(child: Center(child: Text(id))),
              Expanded(child: Center(child: Text("\$$money"))),
            ],
          ),
        ),
      );
    }

    return Container(
      color: aaa % 2 == 0 ? Color(0xffCFD9FF) : Color(0xffE9EEFF),
      height: 60.h,
      child: Row(
        children: [
          Expanded(child: Center(child: Text("0${aaa + 1}"))),
          Expanded(child: Center(child: Text(id))),
          Expanded(child: Center(child: Text("\$$money"))),
        ],
      ),
    );
  }
}
