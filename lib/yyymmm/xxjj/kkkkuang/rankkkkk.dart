import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/jichu_kuang/jichu_kuang.dart';
import 'package:quiz123/tools/num_floor.dart';
import 'package:quiz123/view/jc_ts_kuang.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';
import 'package:quiz123/yyymmm/xxjj/kkkkuang/tx_taskkkk.dart';
import 'package:quiz123/yyymmm/xxjj/xj_ddd_controller.dart';

import 'package:tuple/tuple.dart';

import '../../../gen/assets.gen.dart';
import '../../../tools/rizhi.dart';
import '../../../view/animated_count.dart';
import '../../../view/animated_scale.dart';
import '../../../view/jc_jindutiao.dart';
import '../../../view/jc_text_border.dart';

showTxRankkkk(BuildContext context, {required double withdrawMoney}) {
  return jcKuang(
    context: context,
    child: TixianPaimingWidget(
      onClose: () {
      },
      onCashhhh: () async {
        XjDddController.to.jiluTxStageRenwuJindu(type: EnumXjjjjLx.rankkkkk);
        Tuple4 tmpTuple4 = XjDddController.to.stage_2();
        int curRRRR = tmpTuple4.item1;
        jcTsDialog(text: "Your current rank: $curRRRR");

        if(curRRRR <= 1){
          Navigator.pop(Get.context!);
          Future.delayed(Duration(milliseconds: 300),(){
            showTxTaskkkkDialog(Get.context!, onBtn: (){});
          });
        }

      },
    ),
  );
}

class TixianPaimingWidget extends StatelessWidget {
  const TixianPaimingWidget({
    super.key,
    required this.onCashhhh,
    required this.onClose,
  });

  final VoidCallback onCashhhh;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    String tmpNNNStage = XjDddController.to.now_stage();
    String icon = Assets.bbb.txRank.path;
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
            height: 530.h,
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
                      height: 458.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            Assets.bbb.txBg.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Positioned.fill(
                            left: 10.w,
                            right: 10.w,
                            child: Column(
                              children: [
                                SizedBox(height: 40.h),
                                Center(
                                  child: Text(
                                    "Congratulations, You are in the withdrawal approval queue.",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffffffff),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Center(
                                  child: Container(
                                    width: 112.h,
                                    height: 62.h,
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          XjDddController.to
                                              .curPayCardIdWithPop(),
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0.h,
                                          child: Center(
                                            child: Container(
                                              height: 26.h,
                                              color: Colors.teal.withValues(
                                                alpha: 0.0,
                                              ),
                                              child: Center(
                                                child: JCTextBorder(
                                                  text:
                                                      "\$${XjDddController.to.sssavemoney.toStringAsFixed(0)}",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                GetBuilder<XjDddController>(
                                  builder: (controller) {
                                    return PbPaihangWidget();
                                  },
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
                  top: 4.h,
                  child: Center(
                    child: Image.asset(
                      icon,
                      width: 364.w,
                      height: 88.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0.h,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        onCashhhh();
                      },
                      child: Container(
                        width: 213.h,
                        height: 66.h,
                        color: Colors.teal.withValues(alpha: 0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              Assets.bbb.btnSkipwait.path,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              right: -10.w,
                              top: -10.h,
                              child: Image.asset(
                                Assets.bbb.ad.path,
                                width: 47.w,
                                height: 37.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: 20.h,
                              right: 0.w,
                              child: JcAnimatedScale(
                                child: Image.asset(
                                  Assets.ttt.gesture.path,
                                  width: 95.w,
                                  height: 87.w,
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
    Tuple4 itemTuple3 = XjDddController.to.stage_2();
    int curShuling = itemTuple3.item1;
    curPaiming = curShuling;
    int allShuling = itemTuple3.item2;

    List<Widget> itemsWidget = [];

    var linshiData = paidata;
    for (int i = 0; i < linshiData.length; i++) {
      var tmp = linshiData[i];
      String id = tmp[kWithdrawId];
      double money = tmp[kWithdraw];
      Widget item = ashfaskjfhk(
        Sdfgfsghdfh: id,
        ertsdgdf: i,
        hgfjgktrwtry: money,
      );
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
                fontSize: 12.sp,
                color: Color(0xff47FF53),
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Text(
                " in queue,Your Current rank: ",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              "$curShuling",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xff47FF53),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.w),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.w),
          child: SizedBox(
            height: 220.h,
            child: SingleChildScrollView(
              // padding: EdgeInsets.symmetric(horizontal: 48.w),
              child: Column(
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                    child: Container(
                      color: Color(0xffF2ECDB),
                      height: 32.h,
                      child: Row(
                        children: [
                          Expanded(child: Center(child: Text("User ID"))),
                          Expanded(child: Center(child: Text("Account"))),
                          Expanded(child: Center(child: Text("Money"))),
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

  ashfaskjfhk({
    required int ertsdgdf,
    required String Sdfgfsghdfh,
    required double hgfjgktrwtry,
  }) {
    int tmpRank = ertsdgdf + 1;
    if (tmpRank == curPaiming) {
      Sdfgfsghdfh = "12****54";
      String cardId = XjDddController.to.sssavePayCardId;
      int length = cardId.length;
      if (length > 3) {
        String asdfasfd = cardId[0];
        String htyuetu = cardId.substring(length - 2);
        Sdfgfsghdfh = "$asdfasfd****$htyuetu";
      }

      hgfjgktrwtry = XjDddController.to.sssavemoney;
      return DefaultTextStyle(
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Color(0xffF70E0E),
          fontSize: 14.sp,
        ),
        child: Container(
          color:Color(0xffF7D8CC).withValues(alpha: 1),
          height: 32.h,
          child: Row(
            children: [
              Expanded(child: Center(child: Text("0${ertsdgdf + 1}"))),
              Expanded(child: Center(child: Text(Sdfgfsghdfh))),
              Expanded(child: Center(child: Text("\$$hgfjgktrwtry"))),
            ],
          ),
        ),
      );
    }

    return Container(
      color: ertsdgdf % 2 == 0 ? Color(0xffFBF7EE) : Color(0xffF2ECDB),
      height: 32.h,
      child: Row(
        children: [
          Expanded(child: Center(child: Text("0${ertsdgdf + 1}"))),
          Expanded(child: Center(child: Text(Sdfgfsghdfh))),
          Expanded(child: Center(child: Text("\$$hgfjgktrwtry"))),
        ],
      ),
    );
  }
}
