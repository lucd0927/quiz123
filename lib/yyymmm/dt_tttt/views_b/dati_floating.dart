import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/tools/event_bus.dart';
import 'package:quiz123/yy_gj/bbbb/kkkkuang/money_ccc.dart';
import 'package:quiz123/yy_gj/bbbb/shuzhishuju.dart';

import '../../../gen/assets.gen.dart';
import '../../../view/jc_text_border.dart';

class DatiFloating extends StatefulWidget {
  const DatiFloating({super.key, required this.onMoney});

  final DynamicCallback onMoney;

  @override
  State<DatiFloating> createState() => _DatiFloatingState();
}

class _DatiFloatingState extends State<DatiFloating>with JCEventBusMixin {
  double money = 5.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    money = ShuzhiShuju.float_prize();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () async {
          widget.onMoney(money);
        },
        child: Container(
          width: 70.w,
          height: 70.w,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                Assets.bbb.quizFloatMoney.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),

              Positioned(
                top: -10.h,
                right: -10.w,
                child: Image.asset(
                  Assets.bbb.ad.path,
                  width: 47.h*0.8,
                  height: 37.h*0.8,
                  fit: BoxFit.fill,
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Center(
                  child: JCTextBorder(
                    text: "\$$money",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    fontColor: Color(0xff22FF26),
                    foreground: Color(0xff003305),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
