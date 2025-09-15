import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/view/jc_text_border.dart';

import '../../../gen/assets.gen.dart';
import '../../../jichu_kuang/jichu_kuang.dart';

showDatiErro(
  BuildContext context, {
  required VoidCallback onBtn,
  required VoidCallback onClose,
}) {
  return jcKuang(
    context: context,
    child: DatiErro(
      onClose: () {
        onClose();
      },
      onFunc: () {
        onBtn();
      },
    ),
  );
}

class DatiErro extends StatefulWidget {
  const DatiErro({super.key, required this.onClose, required this.onFunc});

  final VoidCallback onClose;
  final VoidCallback onFunc;

  @override
  State<DatiErro> createState() => _DatiErroState();
}

class _DatiErroState extends State<DatiErro> {
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
                Assets.ttt.starBg.path,
                width: 287.w,
                height: 328.w,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Image.asset(
                Assets.ttt.starSorry.path,
                width: 350.w,
                height: 88.w,
                fit: BoxFit.fill,
              ),
              Container(
                width: 99.w,
                height: 90.w,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      Assets.ttt.starStar.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 5.w,
                      child: JCTextBorder(
                        text: "0",
                        fontWeight: FontWeight.w700,
                        fontSize: 39.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.w),
              Container(
                width: 270.w,
                height: 116.w,
                color: Colors.amber.withValues(alpha: 0.0),
                child: Center(
                  child: Text(
                    "Sorry,The number of answers today has been exhausted. Please come back to challenge again tomorrow.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
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
                  Assets.ttt.starOk.path,
                  width: 200.w,
                  height: 60.w,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
