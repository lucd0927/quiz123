import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../jichu_kuang/jichu_kuang.dart';
import '../../gen/assets.gen.dart';

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
  const GuangGaoFailView({
    super.key,
    required this.onClose,
    required this.onBtn,
  });

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
      width: 340.w,
      height: 375.h,

      child: Column(
        children: [
          SizedBox(height: 10.h),
          Container(
            width: double.infinity,
            color: Colors.indigo.withValues(alpha: 0),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 165.h,
                    // color: Colors.amber,
                    height: 171.h,
                    child: Image.asset(
                      Assets.bbb.adfailed.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 20.w,
                  // bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      widget.onClose();
                    },
                    child: Icon(
                      Icons.close,
                      size: 20.h,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.h,
              bottom: 20.h,
              left: 20.w,
              right: 20.w,
            ),
            child: Text(
              "Ads are loading, please try again later",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                widget.onBtn();
              },
              child: Container(
                width: 190.h,
                height: 65.h,
                color: Colors.green.withValues(alpha: 0.0),
                child: Center(
                  child: Image.asset(
                    Assets.bbb.btnTry.path,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
