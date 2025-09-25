import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/view/animated_scale.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/yy_gj/bbbb/vvvv/hhhero.dart';
import 'package:quiz123/yy_gj/bbbb/vvvv/lihua.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';

import '../../../gen/assets.gen.dart';
import '../vvvv/rotate.dart';
import 'money_ccc.dart';

class MoneyDdd {
  OverlayEntry? _xuanfu;

  void show({
    required BuildContext context,
    required double money,
    required DynamicCallback onClose,
    bool showMoneyHero = true,
  }) {
    _xuanfu = null;
    _xuanfu = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: QianKuangDdd(
            onBtn: (data) {
              close();
              if (showMoneyHero) {
                double scale = 2.3;
                quizmoney.showWithSize(
                  heroChild: Image.asset(
                    Assets.bbb.quizMoney.path,
                    width: 57.w,
                    height: 36.w,
                  ),
                  childSize: Size(57.w * scale, 36.w * scale),
                );
              }

              onClose(money);
            },

            money: money,
          ),
        );
      },
    );
    Overlay.of(context).insert(_xuanfu!);
  }

  void close() {
    _xuanfu?.remove();
    _xuanfu = null;
  }
}

class QianKuangDdd extends StatefulWidget {
  const QianKuangDdd({super.key, required this.onBtn, required this.money});

  final DynamicCallback onBtn;

  final double money;

  @override
  State<QianKuangDdd> createState() => _QianKuangDddState();
}

class _QianKuangDddState extends State<QianKuangDdd> {
  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timer = Timer(Duration(milliseconds: 2000), () {
      timer.cancel();
      widget.onBtn(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        timer.cancel();
        widget.onBtn(null);
      },
      child: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Colors.black.withValues(alpha: 0.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 276.w,
                    height: 302.w,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(24.w),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Congratulations!",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 24.sp,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        Container(
                          width: 220.w,
                          height: 220.w,
                          child: Stack(
                            children: [
                              RotateWidget(
                                child: Image.asset(
                                  Assets.bbb.xuanguang.path,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Center(
                                child: JcAnimatedScale(
                                  child: Image.asset(
                                    Assets.bbb.money.path,
                                    width: 166.w,
                                    height: 80.w,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 10.h,
                                child: Center(
                                  child: JCTextBorder(
                                    text: "+\$${widget.money}",
                                    fontSize: 38.sp,
                                    fontWeight: FontWeight.w800,
                                    fontColor: Color(0xff6BFF70),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 200.h,
              child: SizedBox(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                child: SpinePigLihua(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
