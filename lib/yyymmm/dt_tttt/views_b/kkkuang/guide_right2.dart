import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/tools/event_bus.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/view/animated_scale.dart';
import 'package:quiz123/yy_gj/bbbb/shuzhishuju.dart';
import 'package:quiz123/yy_gj/event_bus.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/kkkuang/money_box.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../yy_gj/bbbb/vvvv/shake.dart';

class GuideRight2 {
  static BuildContext? guideContext;
  static Widget? guideChild;

  OverlayEntry? _overlayEntry;

  void show() {
    jcRizhi("==GuideRight2=show==");
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              // close();
            },
            child: Container(
              color: Colors.black.withValues(alpha: 0.8),

              child: GuideRight2View(
                guideChild: guideChild!,
                guideContext: guideContext!,
                onClose: () async {
                  close();
                  // double money = ShuzhiShuju.box_prize();
                  // MoneyBox().show(
                  //   context: context,
                  //   money: money,
                  //   onClaimDouble: (value) {
                  //     JCEventBus.fire(
                  //       LiwuEvent(type: EnumLiwuEvent.updateRight2),
                  //     );
                  //   },
                  //   onClaim: (value) {},
                  // );

                  JCEventBus.fire(LiwuEvent(type: EnumLiwuEvent.updateRight2));
                  // HomeController.to.onClickDailyCash(showDouble: false);
                },
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(guideContext!).insert(_overlayEntry!);
  }

  void close() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class GuideRight2View extends StatefulWidget {
  const GuideRight2View({
    super.key,
    required this.guideChild,
    required this.guideContext,
    required this.onClose,
  });

  final Widget guideChild;
  final BuildContext guideContext;
  final VoidCallback onClose;

  @override
  State<GuideRight2View> createState() => _GuideRight2ViewState();
}

class _GuideRight2ViewState extends State<GuideRight2View> {
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RenderBox box = widget.guideContext.findRenderObject() as RenderBox;
    var size = box.size;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: IndexedStack(
        index: index,
        children: [
          GestureDetector(
            onTap: () {
              widget.onClose();
            },
            child: GuideWidget(
              guideChild: widget.guideChild,
              guideContext: widget.guideContext,
            ),
          ),
        ],
      ),
    );
  }
}

class GuideWidget extends StatelessWidget {
  const GuideWidget({
    super.key,
    required this.guideChild,
    required this.guideContext,
  });

  final Widget guideChild;
  final BuildContext guideContext;

  @override
  Widget build(BuildContext context) {
    RenderBox box = guideContext.findRenderObject() as RenderBox;

    var topLeftPosition = box.localToGlobal(Offset.zero);
    return Container(
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: topLeftPosition.dx,
            top: topLeftPosition.dy,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IgnorePointer(
                  child: ShakeWidget(
                    mode: ShakeMode.rotate,
                    offset: 8,
                    child: guideChild,
                  ),
                ),
                Positioned(
                  top: 10.h,
                  left: 0.w,
                  child: JcAnimatedScale(
                    child: Image.asset(
                      Assets.ttt.gesture.path,
                      width: 95.w,
                      height: 87.w,
                    ),
                  ),
                ),

                Positioned(top: 100.h, left: 0, child: step1()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget step1() {
    return Container(
      width: 289.w,
      height: 87.w,
      child: Stack(
        children: [
          Image.asset(
            Assets.bbb.guideTips.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 10.w,
            right: 10.w,
            top: 10.h,
            bottom: 10.h,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.green.withValues(alpha: 0.0),
              child: Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Pass',
                    children: [
                      TextSpan(
                        text: " 2 ",
                        // text: " 1000.00",
                        style: TextStyle(color: Color(0xff009402)),
                      ),
                      TextSpan(
                        text: "questions to get a treasure chest reward",
                      ),
                    ],
                  ),
                  style: TextStyle(
                    color: Color(0xff770000),
                    fontSize: 20.sp,
                    // height: 1,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
