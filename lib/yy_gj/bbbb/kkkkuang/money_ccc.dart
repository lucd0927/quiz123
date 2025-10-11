import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/ads/jc_ads_tools.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/view/animated_count.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/yy_gj/bbbb/shuzhishuju.dart';
import 'package:quiz123/yy_gj/bbbb/vvvv/jc_btn.dart';
import 'package:quiz123/yy_gj/bbbb/vvvv/rotate.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';

import '../../../ads/jc_common_config.dart';
import '../../../gen/assets.gen.dart';
import '../../../view/animated_scale.dart';
import '../../../wangluo/shijian_baogao.dart';
import 'money_ddd.dart';

typedef DynamicCallback = void Function(dynamic data);

class MoneyCcc {
  OverlayEntry? _xuanfu;

  void show({
    required BuildContext context,
    required double money,
    required DynamicCallback onClaimDouble,
    required DynamicCallback onClaim,
    required EnumGetScene scene,
  }) {
    String adPosId = "";
    String source = scene.name;
    if (scene == EnumGetScene.wheel) {
      source = "wheel";
    } else if (scene == EnumGetScene.quiz) {
      source = "quiz";
    }
    JCShijianBaogao.coin_pop(source);
    _xuanfu = null;
    _xuanfu = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: QianKuang(
            onBtn: (data) async {
              close();
              JCShijianBaogao.coin_pop_c(source);
              bool result = await JCAdsTools().showRewardAd(adPosId: adPosId);
              if (result) {
                MoneyDdd().show(
                  context: Get.context!,
                  onClose: (data) {
                    DtController.to.addDatiCoin(data);
                    onClaimDouble(data);
                  },
                  money: data,
                );
              } else {
                onClaimDouble(data);
              }
            },
            onBtn2: (data) async {
              close();
              JCShijianBaogao.coin_pop_close(source);
              bool showI = ShuzhiShuju.intad_point();
              if (showI) {
                await JCAdsTools().showInterstitialAd(adPosId: adPosId);
              }

              if (data is num && data > 0) {
                MoneyDdd().show(
                  context: Get.context!,
                  onClose: (data) {
                    DtController.to.addDatiCoin(data);
                    onClaim(data);
                  },
                  money: data * 1.0,
                );
              } else {
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
  double money = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          money = widget.money;
        });
      }
    });
  }

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
                  RotateWidget(
                    child: Image.asset(
                      Assets.bbb.xuanguang.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Center(
                    child: JcDonghuaScale(
                      child: Image.asset(
                        Assets.bbb.money.path,
                        width: 184.w,
                        height: 100.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10.h,
                    child: Center(
                      child: JCAnimatedCount(
                        value: money,
                        duration: Duration(milliseconds: 500),
                        fractionDigits: 2,
                        prefix: "+\$",
                        textStyle: TextStyle(
                          fontSize: 38.sp,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff6BFF70),
                        ),
                      ),

                      // child: JCTextBorder(
                      //   text: "+\$${widget.money}",
                      //   fontSize: 38.sp,
                      //   fontWeight: FontWeight.w800,
                      //   fontColor: Color(0xff6BFF70),
                      // ),
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

    return JcBtn(
      text: "Claim",
      showVideo: true,
      money: money,
      onBtn: (d) {
        jcRizhi("===_btnClaim====");
        widget.onBtn(money);
      },
    );
  }
}
