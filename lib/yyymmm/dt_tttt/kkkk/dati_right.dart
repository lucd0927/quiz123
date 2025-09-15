import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/view/jc_text_border.dart';

import '../../../gen/assets.gen.dart';
import '../../../jichu_kuang/jichu_kuang.dart';
import '../dt_controller.dart';

showDatiRight(
  BuildContext context, {
  required VoidCallback onBtn,
  required VoidCallback onClose,
  required double money,
}) {
  return jcKuang(
    context: context,
    child: DatiRight(
      onClose: () {
        onClose();
      },
      onFunc: () {
        onBtn();
      },
      money: money,
    ),
  );
}

class DatiRight extends StatefulWidget {
  const DatiRight({
    super.key,
    required this.onClose,
    required this.onFunc,
    required this.money,
  });

  final VoidCallback onClose;
  final VoidCallback onFunc;
  final double money;

  @override
  State<DatiRight> createState() => _DatiRightState();
}

class _DatiRightState extends State<DatiRight> {
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
      child: IndexedStack(
        index: index,
        children: [
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  // color: Colors.amber,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: 200.h),
                      Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              widget.onClose();
                            },
                            child: Container(
                              width: 20.w,
                              height: 20.w,
                              color: Colors.transparent,
                              child: Image.asset(
                                Assets.ttt.close.path,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: 40.w),
                        ],
                      ),
                      SizedBox(height: 10.w),
                      centerContent(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  centerContent() {
    return Container(
      width: 350.w,
      height: 380.w,
      // color: Colors.green,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 30.w,
            child: Center(
              child: Image.asset(
                Assets.ttt.levelBg.path,
                width: 287.w,
                height: 328.w,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Image.asset(
                Assets.ttt.datiRightTitle.path,
                width: 350.w,
                height: 88.w,
                fit: BoxFit.fill,
              ),
              Container(
                width: 154.w,
                height: 154.w,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      Assets.ttt.metalLevelBg.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Center(
                      child: Image.asset(
                        Assets.ttt.datiRightCoin.path,
                        width: 108.w,
                        height: 108.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 260.w,
                height: 40.w,
                color: Colors.amber.withValues(alpha: 0.0),
                child: Center(
                  child: Text(
                    "+${widget.money.toStringAsFixed(0)}",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xffFFFB00),
                      fontSize: 24.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0.w,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  widget.onFunc();
                },
                child: Image.asset(
                  Assets.ttt.datiRightBtn.path,
                  width: 208.w,
                  height: 60.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
