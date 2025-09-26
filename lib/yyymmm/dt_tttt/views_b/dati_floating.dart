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
          width: 62.w,
          height: 62.w,
          child: Stack(
            children: [
              Image.asset(
                Assets.bbb.quizFloatMoney.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
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
