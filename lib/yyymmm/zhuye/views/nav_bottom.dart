import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/yyymmm/zhuye/zhuye.dart';
import 'package:quiz123/yyymmm/zhuye/zhuye_controller.dart';

import '../../../gen/assets.gen.dart';
import '../../../tools/package.dart';

double bottomTopHeight = 0.h;
double bottomNavHeight = 94.h;
double bottomSafeHeight = ScreenUtil().bottomBarHeight;
double bottomNavRealHeight = bottomNavHeight + bottomSafeHeight;

class JCDibuNav extends StatefulWidget {
  const JCDibuNav({super.key});

  @override
  State<JCDibuNav> createState() => _JCDibuNavState();
}

class _JCDibuNavState extends State<JCDibuNav> {
  double screenWidth = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screenWidth = ScreenUtil().screenWidth;
  }

  List<Widget> bg = [
    Image.asset(
      Assets.ttt.navCategory.path,
      width: ScreenUtil().screenWidth,
      height: bottomNavHeight,
      fit: BoxFit.fill,
      gaplessPlayback: true,
    ),
    Image.asset(
      Assets.ttt.navQuiz.path,
      width: ScreenUtil().screenWidth,
      height: bottomNavHeight,
      fit: BoxFit.fill,
      gaplessPlayback: true,
    ),
    Image.asset(
      Assets.ttt.navMetal.path,
      width: ScreenUtil().screenWidth,
      height: bottomNavHeight,
      fit: BoxFit.fill,
      gaplessPlayback: true,
    ),
  ];
  List<Widget> bg_b = [
    Image.asset(
      Assets.bbb.navQuiz.path,
      width: ScreenUtil().screenWidth,
      height: bottomNavHeight,
      fit: BoxFit.fill,
      gaplessPlayback: true,
    ),
    Image.asset(
      Assets.bbb.navCash.path,
      width: ScreenUtil().screenWidth,
      height: bottomNavHeight,
      fit: BoxFit.fill,
      gaplessPlayback: true,
    ),
    // Image.asset(
    //   Assets.bbb.mainSetting.path,
    //   width: ScreenUtil().screenWidth,
    //   height: bottomNavHeight,
    //   fit: BoxFit.fill,
    //   gaplessPlayback: true,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: bottomNavRealHeight,
      child: Column(
        children: [
          Obx(() {
            return Container(
              width: ScreenUtil().screenWidth,
              height: bottomNavHeight,
              child: Stack(
                children: [
                  IndexedStack(
                    index: ZhuyeController.to.curIndex.value,
                    children: JCABluoji.isPackageB() ? bg_b : bg,
                  ),
                  Row(
                    children: JCABluoji.isPackageB()
                        ? [
                            _itemView(index: ZhuyeController.quizIndexB),
                            _itemView(index: ZhuyeController.cashIndexB),
                          ]
                        : [
                            _itemView(index: ZhuyeController.categoryIndex),
                            _itemView(index: ZhuyeController.quizIndex),
                            _itemView(index: ZhuyeController.metalIndex),
                          ],
                  ),
                ],
              ),
            );
          }),
          Container(
            width: ScreenUtil().screenWidth,
            height: bottomNavRealHeight - bottomNavHeight,
            color: Color(0xffFBAE3C),
          ),
        ],
      ),
    );
  }

  _itemView({required int index}) {
    int length = JCABluoji.isPackageB()?2:3;
    double maxWidth = screenWidth / length;
    final int curIndex = ZhuyeController.to.curIndex.value;
    bool select = index == curIndex;

    return GestureDetector(
      onTap: () {
        ZhuyeController.to.resetIndex(index);
      },
      child: Container(color: Colors.red.withValues(alpha: 0), width: maxWidth),
    );
  }
}
