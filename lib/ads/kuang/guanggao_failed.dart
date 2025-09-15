import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../jichu_kuang/jichu_kuang.dart';

showAdFailedDialog(
  BuildContext context, {
  required VoidCallback onFunc,
  required VoidCallback onFunc2,
}) {
  return jcKuang(
    context: context,
    child: GuangGaoFailView(
      onClose: () {
        onFunc2();
      },
      onBtn: () {
        onFunc();
      },
    ),
  );
}

class GuangGaoFailView extends StatefulWidget {
  const GuangGaoFailView({super.key, required this.onClose, required this.onBtn});

  final VoidCallback onClose;
  final VoidCallback onBtn;

  @override
  State<GuangGaoFailView> createState() => _GuangGaoFailViewState();
}

class _GuangGaoFailViewState extends State<GuangGaoFailView> {
  int index = 0;

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
                      content(),
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

  content() {
    return Container(
      width: 678.w,
      height: 771.h,
      decoration: BoxDecoration(
        color: Color(0xff992D2E),
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
                      "Ad loading failed",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xffffffff),
                        fontSize: 42.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 40.w,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    widget.onClose();
                  },
                  child: Icon(Icons.close, size: 40.h, color: Colors.white),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 640.w,
                height: 660.h,
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFF),
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 150.h),
                    Stack(
                      children: [
                        Icon(Icons.add_chart_outlined,size: 288.h,),
                      ],
                    ),

                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            widget.onBtn();
                          },
                          child: Container(
                            width: 353.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF85823),
                              borderRadius: BorderRadius.circular(16.w),
                              border: Border.all(
                                color: Color(0xffD04A1E),
                                width: 2.w,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    "Try Again",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 42.sp,
                                      // foreground: Color(0xffD0871E),
                                      color: Color(0xffffffff),
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
            ),
          ),
        ],
      ),
    );
  }
}
