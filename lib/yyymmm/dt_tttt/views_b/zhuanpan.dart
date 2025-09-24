import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';

class ZhuanpanOverlay {
  OverlayEntry? _xuanfu;

  void show({required BuildContext context}) {
    _xuanfu = null;
    _xuanfu = OverlayEntry(
      builder: (context) {
        return Zhuanpan(
          onClose: () {
            close();
          },
          onSpin: () {
            close();
          },
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
  final VoidCallback onSpin;

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
      child: Column(
        children: [
          SizedBox(height: 100.h,),
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

          Container(width: 282.w, height: 44.h),
          zhuanpan(context),
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
        children: [
          // _test(),
          AnimatedRotation(
            key: _zpVK,
            turns: angle,
            curve: Curves.linearToEaseOut,
            duration: Duration(milliseconds: milliseconds),
            child: Stack(
              children: [
                Image.asset(
                  Assets.bbb.zpBg.path,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ],
            ),
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

    // double tmpAngle = pi / 2.3 + pi; // 3
    // double tmpAngle = pi / 3.3 + pi; // 2
    // double tmpAngle = pi / 3.1 + pi; // 2
    // double tmpAngle = pi / 3.15 + pi; // 2
    double tmpAngle = pi / 2 + pi; // tixian bag

    List<double> tmp = [2.0, 2.2, 4.5];
    int random = Random().nextInt(3);
    double tmp2 = tmp[random];
    tmpAngle = pi / tmp2 + pi; // money
    setState(() {
      angle = tmpAngle;
    });

    await Future.delayed(Duration(milliseconds: milliseconds + 1000));
    setState(() {
      sfDianji = true;
      angle = 0;
      _zpVK = ValueKey("${DateTime.now().millisecondsSinceEpoch}");
    });

    widget.onSpin();

  }
}
