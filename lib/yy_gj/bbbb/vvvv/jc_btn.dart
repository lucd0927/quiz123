import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/yy_gj/bbbb/kkkkuang/money_ccc.dart';

import '../../../gen/assets.gen.dart';
import '../../../view/jc_text_border.dart';

class JcBtn extends StatelessWidget {
  const JcBtn({
    super.key,
    required this.text,
    required this.showVideo,
    required this.onBtn,
    this.money,
  });

  final String text;
  final double? money;
  final bool showVideo;
  final DynamicCallback onBtn;

  @override
  Widget build(BuildContext context) {
    return _btnClaim();
  }

  _btnClaim() {
    return GestureDetector(
      onTap: () {
        onBtn(money);
      },
      child: Container(
        width: 190.w,
        height: 65.w,
        color: Colors.transparent,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              Assets.bbb.btn.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  JCTextBorder(
                    text: text,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w900,
                    foreground: Color(0xff891700),
                  ),
                  if (money != null)
                    JCTextBorder(
                      text: " \$${money}",
                      fontSize: 22.sp,
                      fontColor: Color(0xff6BFF70),
                      fontWeight: FontWeight.w900,
                      foreground: Color(0xff891700),
                    ),
                ],
              ),
            ),
            if (showVideo)
              Positioned(
                right: -16.w,
                top: -12.h,
                child: Image.asset(
                  Assets.bbb.ad.path,
                  width: 47.w,
                  height: 37.w,
                  fit: BoxFit.fill,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
