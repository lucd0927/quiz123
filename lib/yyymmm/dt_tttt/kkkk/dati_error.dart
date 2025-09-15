import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/view/jc_text_border.dart';

import '../../../gen/assets.gen.dart';
import '../../../jichu_kuang/jichu_kuang.dart';
import '../dt_controller.dart';

showDatiError(
  BuildContext context, {
  required VoidCallback onBtn,
  required VoidCallback onClose,

}) {
  return jcKuang(
    context: context,
    child: DatiError(
      onClose: () {
        onClose();
      },
      onFunc: () {
        onBtn();
      },

    ),
  );
}

class DatiError extends StatefulWidget {
  const DatiError({
    super.key,
    required this.onClose,
    required this.onFunc,

  });

  final VoidCallback onClose;
  final VoidCallback onFunc;


  @override
  State<DatiError> createState() => _DatiErrorState();
}

class _DatiErrorState extends State<DatiError> {
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
      height: 300.w,
      // color: Colors.green,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 30.w,
            child: Center(
              child: Image.asset(
                Assets.ttt.datiErrorBg.path,
                width: 287.w,
                height: 232.w,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Image.asset(
                Assets.ttt.datiErrorTitle.path,
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

                    Center(
                      child: Image.asset(
                        Assets.ttt.datiErrorEmoji.path,
                        width: 108.w,
                        height: 108.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
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
                  Assets.ttt.datiErrorBtn.path,
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
