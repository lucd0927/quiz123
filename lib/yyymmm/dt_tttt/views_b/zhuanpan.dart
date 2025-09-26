import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/yy_gj/bbbb/kkkkuang/money_ccc.dart';
import 'package:quiz123/yy_gj/bbbb/shuzhishuju.dart';
import 'package:quiz123/yy_gj/bbbb/vvvv/jc_btn.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';

import '../../../gen/assets.gen.dart';
import '../../../yy_gj/bbbb/vvvv/rotate.dart';

enum EnumZhuanpanTTTT { old, gift_zp }

class ZhuanpanOverlay {
  OverlayEntry? _xuanfu;

  void show({
    required BuildContext context,
    required DynamicCallback onSpin,
    VoidCallback? onClose,
  }) {
    _xuanfu = null;
    _xuanfu = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Zhuanpan(
            onClose: () {
              close();
              onClose?.call();
            },
            onSpin: (money) {
              close();
              onSpin(money);
            },
          ),
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

class Zhuanpan extends StatefulWidget {
  const Zhuanpan({super.key, required this.onClose, required this.onSpin});

  final VoidCallback onClose;
  final DynamicCallback onSpin;

  @override
  State<Zhuanpan> createState() => _ZhuanpanState();
}

class _ZhuanpanState extends State<Zhuanpan> {
  double angle = 0;

  // double money = 10;

  int milliseconds = 3000;
  bool sfDianji = true;
  ValueKey _zpVK = ValueKey("_ZhuanpanState");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withValues(alpha: 0.8),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 100.h),
                Container(
                  width: double.infinity,
                  height: 97.h,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          // color: Colors.red,
                          child: Image.asset(
                            Assets.bbb.zpLucky.path,
                            width: 188.h,
                            height: 97.h,
                          ),
                        ),
                      ),

                      Positioned(
                        right: 16.w,
                        child: GestureDetector(
                          onTap: () {
                            widget.onClose();
                          },
                          child: Image.asset(
                            Assets.bbb.close.path,
                            width: 20.w,
                            height: 20.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.w),
                Container(
                  width: 282.w,
                  height: 44.h,
                  child: Image.asset(Assets.bbb.zpWithdraw2000.path),
                ),
                SizedBox(height: 20.w),

                zhuanpan(context),
                SizedBox(height: 20.w),
                JcBtn(
                  text: "Spin",
                  showVideo: false,
                  onBtn: (d) {
                    _onSpin();
                  },
                ),
              ],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0.w,
            child: Image.asset(
              Assets.bbb.zpBttom.path,
              width: 375.w,
              height: 78.w,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  Widget zhuanpan(BuildContext context) {
    return Container(
      width: 336.w,
      height: 336.w,
      color: Colors.amber.withValues(alpha: 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // _test(),
          Positioned(
            left: -80.w,
            right: -80.w,
            top: -80.h,
            bottom: -80.h,
            child: Image.asset(
              Assets.bbb.xuanguang.path,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          AnimatedRotation(
            key: _zpVK,
            turns: angle,
            curve: Curves.linearToEaseOut,
            duration: Duration(milliseconds: milliseconds),
            child: Stack(
              children: [
                Image.asset(
                  Assets.bbb.zpMoneyDetail.path,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ],
            ),
          ),
          Image.asset(
            Assets.bbb.zpCycle.path,
            width: double.infinity,
            height: double.infinity,
          ),

          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: GestureDetector(
                onTap: _onSpin,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: 71.w,
                      height: 85.w,
                      // color: Colors.amber,
                      child: Stack(
                        children: [
                          Image.asset(
                            Assets.bbb.zpZhizhen.path,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ],
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

  _onSpin() async {
    if (!sfDianji) {
      return;
    }
    sfDianji = false;

    // double tmpAngle = pi / 2.5 + pi; // 20
    // double tmpAngle = pi / 3.5 + pi; // 80
    // double tmpAngle = pi / 3.2 + pi; // 20 zuihao
    // double tmpAngle = pi / 3.6 + pi; // 80 zuihao
    // double tmpAngle = pi / 3.7 + pi; // 80
    // double tmpAngle = pi / 4.05 + pi; // 5
    // double tmpAngle = pi / 4.1 + pi; // 5
    // double tmpAngle = pi / 4.2 + pi; // 5   zuihao
    // double tmpAngle = pi / 5.1 + pi; // 10 zuihao
    double tmpAngle = pi / 4.2 + pi; // 50 zuihao

    double money = ShuzhiShuju.wheel_point();
    double point_5 = ShuzhiShuju.point_5();
    double point_10 = ShuzhiShuju.point_10();
    double point_20 = ShuzhiShuju.point_20();
    double point_50 = ShuzhiShuju.point_50();
    double point_80 = ShuzhiShuju.point_80();

    if (money == point_5) {
      tmpAngle = pi / 4.2 + pi; // 5
    } else if (money == point_10) {
      tmpAngle = pi / 5.1 + pi; // 10 zuihao
    } else if (money == point_20) {
      tmpAngle = pi / 3.2 + pi; // 20 zuihao
    } else if (money == point_50) {
      tmpAngle = pi / 9.1 + pi; // 50 zuihao
    } else if (money == point_80) {
      tmpAngle = pi / 3.6 + pi; // 80 zuihao
    }
    jcRizhi("=zp=money:$money====");
    setState(() {
      angle = tmpAngle;
    });

    await Future.delayed(Duration(milliseconds: milliseconds + 1500));
    setState(() {
      sfDianji = true;
      angle = 0;
      _zpVK = ValueKey("${DateTime.now().millisecondsSinceEpoch}");
    });

    widget.onSpin(money);
  }
}
