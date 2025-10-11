import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/tools/package.dart';
import 'package:quiz123/tz/ios_local_tz.dart';
import 'package:quiz123/yyymmm/dt_tttt/dati_ttt.dart';
import 'package:quiz123/yyymmm/sz_page/sz_page.dart';
import 'package:quiz123/yyymmm/zhuye/zhuye_controller.dart';

import '../../gen/assets.gen.dart';
import '../../tools/rizhi.dart';
import '../dt_tttt/dt_controller.dart';
import '../fenlei/fenlei_controller.dart';
import '../fenlei/fenlei_page.dart';
import '../metal/metal_controller.dart';
import '../metal/metal_page.dart';
import '../xxjj/xj_ddd.dart';
import '../xxjj/xj_ddd_controller.dart';
import 'views/nav_bottom.dart';
import '../dt_tttt/views/nav_top.dart';

class Zhuye extends StatefulWidget {
  const Zhuye({super.key});

  @override
  State<Zhuye> createState() => _ZhuyeState();
}

class _ZhuyeState extends State<Zhuye> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(ZhuyeController());
    Get.put(DtController());
    Get.put(FenleiController());
    Get.put(MetalController());
    Get.put(XjDddController());

    JCABluoji().listen((packName){
      jcRizhi("===JCABluoji().listen==packName:$packName");
      if(packName == JCABluoji.packageB){
        ZhuyeController.to.resetIndex(ZhuyeController.quizIndexB);
        DtController.to.resetAllDataB();
        // setState(() {
        //
        // });
      }
    });

    if(Platform.isIOS){
      JCTzIossssss().init();
    }
  }

  List<Widget> pages() {
    if(JCABluoji.isPackageB()){
      return pagesBBB();
    }

    return [FenleiPage(), DtPage(), MetalPage()];
  }

  List<Widget> pagesBBB() {
    return [ DtPage(), XjDdd()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Obx(() {
          int curIndex = ZhuyeController.to.curIndex.value;

          return Stack(
            children: [
              Image.asset(
                Assets.ttt.zhuyeBg.path,
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
              ),
              Positioned.fill(
                child: Column(
                  children: [
                    JCABluoji.isPackageB() ? const SizedBox() : NavTop(),
                    Expanded(
                      child: IndexedStack(index: curIndex, children: pages()),
                    ),
                    SizedBox(height: bottomNavRealHeight),
                  ],
                ),
              ),

              Positioned(left: 0, right: 0, bottom: 0, child: JCDibuNav()),
            ],
          );
        }),
      ),
    );
  }
}
