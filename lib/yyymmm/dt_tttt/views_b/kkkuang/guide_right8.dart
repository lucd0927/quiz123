import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/view/animated_scale.dart';
import 'package:quiz123/yy_gj/bbbb/shuzhishuju.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/kkkuang/money_box.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../tools/event_bus.dart';
import '../../../../wangluo/shijian_baogao.dart';
import '../../../../yy_gj/event_bus.dart';

class GuideRight8 {
  static BuildContext? guideContext;
  static Widget? guideChild;

  OverlayEntry? _overlayEntry;

  void show() {
    _overlayEntry = null;
    JCShijianBaogao.wheel_guide();
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

              child: GuideRight8View(
                guideChild: guideChild!,
                guideContext: guideContext!,
                onClose: () async {
                  close();
                  JCShijianBaogao.wheel_guide_c();
                  JCEventBus.fire(LiwuEvent(type: EnumLiwuEvent.updateRight8));
                  // HomeController.to.onClickDailyCash(showDouble: false);
                },
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlayEntry!);
  }

  void close() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class GuideRight8View extends StatefulWidget {
  const GuideRight8View({
    super.key,
    required this.guideChild,
    required this.guideContext,
    required this.onClose,
  });

  final Widget guideChild;
  final BuildContext guideContext;
  final VoidCallback onClose;

  @override
  State<GuideRight8View> createState() => _GuideRight8ViewState();
}

class _GuideRight8ViewState extends State<GuideRight8View> {
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
      color: Colors.teal.withValues(alpha: 0),
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
                  child: JcDonghuaScale(
                    maxScale: 1.5,
                    minScale: 1.0,
                    child: guideChild,
                  ),
                ),
                Positioned(
                  top: 10.h,
                  left: 0.w,
                  child: JcDonghuaScale(
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
          Positioned(top: 240.h, left: 40.w, child: step1()),
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
                        text: " 8 ",
                        // text: " 1000.00",
                        style: TextStyle(color: Color(0xff009402)),
                      ),
                      TextSpan(text: "questions to get a lucky spin!"),
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
