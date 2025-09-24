import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';

import '../../../gen/assets.gen.dart';
import 'money_ddd.dart';

typedef DynamicCallback = void Function(dynamic data);

class MoneyCcc {
  OverlayEntry? _xuanfu;

  void show({
    required BuildContext context,
    required double money,
    required DynamicCallback onClaimDouble,
    required DynamicCallback onClaim,
  }) {
    _xuanfu = null;
    _xuanfu = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: QianKuang(
            onBtn: (data) {
              close();

              MoneyDdd().show(
                context: context,
                onClose: (data) {
                  DtController.to.addDatiCoin(data);
                  onClaimDouble(data);
                },
                money: data,
              );


            },
            onBtn2: (data) {
              close();
              if(data is num && data > 0){

                MoneyDdd().show(
                  context: context,
                  onClose: (data) {
                    DtController.to.addDatiCoin(data);
                    onClaim(data);
                  },
                  money: data*1.0,
                );
              }else{
                DtController.to.addDatiCoin(data);
                onClaim(data);
              }

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

class QianKuang extends StatefulWidget {
  const QianKuang({
    super.key,
    required this.onBtn,
    required this.onBtn2,
    required this.money,
  });

  final DynamicCallback onBtn;
  final DynamicCallback onBtn2;
  final double money;

  @override
  State<QianKuang> createState() => _QianKuangState();
}

class _QianKuangState extends State<QianKuang> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withValues(alpha: 0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              Assets.bbb.congratulations.path,
              width: 325.w,
              height: 36.w,
            ),
          ),
          // SizedBox(height: 20.w,),
          Center(
            child: Container(
              width: 270.w,
              height: 270.w,
              child: Stack(
                children: [
                  Image.asset(
                    Assets.bbb.xuanguang.path,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Center(
                    child: Image.asset(
                      Assets.bbb.money.path,
                      width: 184.w,
                      height: 100.w,
                      fit: BoxFit.contain,
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
          ),
          SizedBox(height: 40.w),
          _btnClaim(),
          SizedBox(height: 10.w),
          InkWell(
            onTap: () {
              widget.onBtn2(widget.money);
            },
            child: SizedBox(
              width: 100.w,
              child: Center(
                child: JCTextBorder(
                  text: "\$${widget.money}",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _btnClaim() {
    double money = widget.money * 2;
    return GestureDetector(
      onTap: () {
        jcRizhi("===_btnClaim====");
        widget.onBtn(money);
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
                    text: "Claim",
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w900,
                    foreground: Color(0xff891700),
                  ),
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
