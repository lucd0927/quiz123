import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:quiz123/hive/jc_hive.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/animated_up_down.dart';

import '../../../gen/assets.gen.dart';
import '../../../view/animated_scale.dart';

enum EnumLiwuLeixing { box, wheel }

class DatiGift extends StatefulWidget {
  const DatiGift({super.key});

  @override
  State<DatiGift> createState() => _DatiGiftState();

  // distance num
  static const int xiangChaNum = 3;
}

class _DatiGiftState extends State<DatiGift> {
  late ScrollController _liwuPro;
  late ScrollController _liwuBg;
  late LinkedScrollControllerGroup _lianjieC;

  final ScrollController _scrollController = ScrollController();
  late VoidCallback scrollerListener;

  List<int> curData = [2];

  // 当前答对多少题
  int curAnswerCount = 0;

  // 多少题显示宝箱
  static const int jumpCount = DatiGift.xiangChaNum;

  final _hhhhBBB = JCHive.box;

  String keyIndexGift(int weizhi) {
    return "asdfqertwetrwe$weizhi";
  }

  String keyLastIndexClick() {
    return "fgdfherasdfsadfsdsafdfsa";
  }

  bool hasFloatBox(int index) {
    bool open = false;
    var data = _hhhhBBB.get(keyIndexGift(index)) ?? {};
    open = data['floatBox'] ?? false;

    return open;
  }

  bool hasIndexOpen(int weizhi) {
    bool sfDakai = false;
    var data = _hhhhBBB.get(keyIndexGift(weizhi)) ?? {};
    sfDakai = data['hasOpen'] ?? false;

    return sfDakai;
  }

  setWeizhiJson({
    required int index,
    required bool hasOpen,
    required double money,
    bool floatBox = false,
  }) {
    _hhhhBBB.put(keyIndexGift(index), {
      "hasOpen": hasOpen,
      "money": money,
      "floatBox": floatBox,
    });

    _hhhhBBB.put(keyLastIndexClick(), index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollerListener = () {};
    _scrollController.addListener(scrollerListener);

    _lianjieC = LinkedScrollControllerGroup();
    _liwuPro = _lianjieC.addAndGet();
    _liwuBg = _lianjieC.addAndGet();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      int tmpRightNum = _innerRightCount;
      int index = (tmpRightNum / jumpCount).toInt();

      Future.delayed(Duration(milliseconds: 1000), () {
        gundongTo(index);
      });
    });
    shengchengShuju();
  }

  int get _innerRightCount => DtController.to.curRightNum.value;

  bool showCase = false;

  void shengchengShuju() {
    List<int> tmpData = [];
    int startValue = 0;
    if (curData.isNotEmpty) {
      startValue = curData.last;
    }
    for (int i = 0; i < 100; i++) {
      int a = startValue + (i + 1) * 3;
      tmpData.add(a);
    }
    curData.addAll(tmpData);
  }

  gundongTo(int weizhi) async {
    double width = weizhi * _itemWidth;
    int time = 2000;
    if (weizhi > 0) {
      width = width + 6.w;
      if (weizhi == 2) {
        time = 1000;
      }
    }

    await _lianjieC.animateTo(
      width,
      duration: Duration(milliseconds: time),
      curve: Curves.linear,
    );
  }

  double _itemWidth = 0;
  bool clickGift = false;

  int curMaxIndex() {
    int curAnswerCount = _innerRightCount;
    int curIndex = 0;
    int index0 = 2;
    if (curAnswerCount <= index0) {
      curIndex = 0;
    } else {
      int tmpGongjin = 3;
      int startIndex = curAnswerCount - index0;

      curIndex = startIndex ~/ tmpGongjin;
      curIndex = curIndex;
    }

    return curIndex;
  }

  double giftHeight = 80.h;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      double allWidth = 330.w;
      double itemWidth = (allWidth - 32.w) / 4;
      _itemWidth = itemWidth;
      List<Widget> progressWidgets = [];
      List<Widget> giftWidgets = [];
      curAnswerCount = _innerRightCount;
      int curIndex = curMaxIndex();
      jcRizhi(
        "=====_GiftProgressState====curRightAnswerCount:$curAnswerCount curIndex:$curIndex",
      );
      for (int i = 0; i < curData.length; i++) {
        bool hasFirst = false;
        bool hasLast = false;

        double tmpProgress = 0;
        if (i == 0) {
          hasFirst = true;
        } else if ((i + 1) == curData.length) {
          hasLast = true;
        }

        int count = curData[i];
        EnumLiwuLeixing category = EnumLiwuLeixing.box;
        int tmpCategory = (count - 2) % 9;
        jcRizhi("=====tmpCategory:$tmpCategory count:$count");
        if (tmpCategory == 6) {
          category = EnumLiwuLeixing.wheel;
        } else {
          category = EnumLiwuLeixing.box;
        }
        // 0 3 6  9 12 15 18 21 24
        // 2 5 8 11 14 17 20 23 26

        bool hasLastOpened = false;
        if (curAnswerCount >= count) {
          tmpProgress = 1;
          hasLastOpened = curIndex == i;
        } else {
          int next = count - curAnswerCount;
          if (next >= jumpCount || curAnswerCount == 0) {
            tmpProgress = 0;
          } else {
            // hasLast = true;
            tmpProgress = 1 - next / jumpCount - 0.2;
          }
        }

        Widget progress = liwuProView(
          width: itemWidth,
          hasFirst: hasFirst,
          hasLast: hasLast,
          progress: tmpProgress,
        );

        Widget gift = liwuBgView(
          width: itemWidth,
          giftCategory: category,
          hasLastOpened: hasLastOpened,
          count: count,
          index: i,
        );

        progressWidgets.add(progress);
        giftWidgets.add(gift);
      }
      return Container(
        width: double.infinity,
        height: giftHeight + 20.h,
        color: Colors.green.withValues(alpha: 0.0),
        child: Stack(
          children: [
            Positioned(
              top: 10.h,
              right: 10.w,
              left: 10.w,
              bottom: 0.h,
              child: Image.asset(
                Assets.ttt.quizLevelBg.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0.h,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    // color: Color(0xff5B688D),
                    // borderRadius: BorderRadius.circular(8.w),
                    // border: Border.all(color: Color(0xff101228), width: 1.w),
                    // image: DecorationImage(image: AssetImage( Assets.ttt.quizLevelBg.path,),fit: BoxFit.fill)
                  ),
                  width: allWidth,
                  // height: giftHeight,
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      ListView(
                        scrollDirection: Axis.horizontal,
                        controller: _liwuPro,
                        // clipBehavior: Clip.none,
                        // padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
                        children: [...progressWidgets],
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        controller: _liwuBg,
                        // clipBehavior: Clip.none,
                        children: [...giftWidgets],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  liwuProView({
    required double width,
    bool hasFirst = false,
    bool hasLast = false,
    required double progress,
  }) {
    double tmpProgress = progress;
    double height = double.infinity;
    double outHeight = 15.h;
    double innerHeight = 10.h;
    double borderRadius = innerHeight;
    double leftDistance = (outHeight - innerHeight) / 2;
    double top = 48.h;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: width,
          height: height,
          // decoration: BoxDecoration(color: Colors.black),
        ),
        Positioned(
          top: top,
          child: Container(
            width: width,
            height: outHeight,
            padding: EdgeInsets.only(
              left: hasFirst ? leftDistance : 0,
              right: hasLast ? leftDistance : 0,
            ),
            decoration: BoxDecoration(
              color: Color(0xff253668),
              borderRadius: hasLast
                  ? BorderRadius.only(
                      topRight: Radius.circular(borderRadius),
                      bottomRight: Radius.circular(borderRadius),
                    )
                  : (hasFirst
                        ? BorderRadius.only(
                            topLeft: Radius.circular(borderRadius),
                            bottomLeft: Radius.circular(borderRadius),
                          )
                        : BorderRadius.zero),
            ),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    width: width * tmpProgress,
                    height: innerHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffA0FFD6), Color(0xff00CA11)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: hasLast
                          ? BorderRadius.only(
                              topRight: Radius.circular(borderRadius),
                              bottomRight: Radius.circular(borderRadius),
                            )
                          : (hasFirst
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(borderRadius),
                                    bottomLeft: Radius.circular(borderRadius),
                                  )
                                : BorderRadius.zero),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // giftCategory: 1 转盘，2 金蛋，3 可以打开的

  liwuBgView({
    required double width,
    bool hasLastOpened = false, // 是否是进度条已经打开的最后一个
    required EnumLiwuLeixing giftCategory,
    required int count,
    required int index,
  }) {
    // 是否已经打开
    bool hasOpened = hasIndexOpen(index);
    bool floatBox = hasFloatBox(index);
    double height = giftHeight;
    String bottomText = "${index + 1}";
    bottomText = "$count";
    Widget answerCountItem = JCTextBorder(
      text: bottomText,
      fontWeight: FontWeight.w700,
      fontSize: 12.sp,
    );
    jcRizhi("==giftCategory:$giftCategory==index:$index=");
    bool heziLeixing = giftCategory == EnumLiwuLeixing.box;
    String icon = heziLeixing
        ? Assets.bbb.quizGiftBox.path
        : Assets.bbb.quizGiftWheel.path;
    // 能否打开
    bool canOpen = curAnswerCount >= count;
    if (canOpen && hasOpened) {
      icon = heziLeixing
          ? Assets.bbb.quizGiftBox2.path
          : Assets.bbb.quizGiftWheel2.path;
    }

    Widget gift = Image.asset(icon, width: 37.h, height: 37.h);
    Widget tmpImage = Stack(
      clipBehavior: Clip.none,
      children: [
        gift,

        Positioned(
          bottom: -14.h,
          right: 0,
          left: 0,
          child: Center(child: answerCountItem),
        ),
      ],
    );

    Widget gesture = IgnorePointer(
      child: JcAnimatedScale(
        minScale: 0.8,
        maxScale: 1,
        child: Image.asset(Assets.ttt.gesture.path, width: 70.w, height: 70.w),
      ),
    );
    // ggPrint("==_GiftProgressState=count:$count===index:$index=canOpen:$canOpen===hasLastOpened:$hasLastOpened=clickGift:$clickGift=hasOpened:$hasOpened");
    return Center(
      child: GestureDetector(
        onTap: () {
          _onBox(canClick: canOpen, index: index);
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              // color: index % 2 == 0 ?Colors.red.withValues(alpha: 0.4):Colors.green.withValues(alpha: 0.4),
              width: width,
              height: height,
              // decoration: BoxDecoration(color: Colors.red),
            ),
            if (canOpen && !hasOpened)
              Positioned(
                right: -14.w,
                top: 12.h,
                child: Image.asset(
                  Assets.bbb.quizXuanguang.path,
                  width: 60.w,
                  height: 60.h,
                ),
              ),
            Positioned(top: 26.h, right: -4.w, child: tmpImage),
            if (canOpen && !clickGift && !hasOpened)
              Positioned(bottom: -12.h, right: -40.w, child: gesture),
            if (canOpen && !hasOpened)
              Positioned(
                right: -18.w,
                top: -5.h,
                child: Container(
                  width: 64.w,
                  height: 26.h,

                  child: AnimatedUpDown(
                    child: Container(
                      width: 64.w,
                      height: 26.h,
                      // color: Colors.green,
                      child: Stack(
                        children: [
                          Image.asset(
                            Assets.bbb.quizGiftBoxTips.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Center(
                            child: Text(
                              "Max \$29",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                color: Color(0xffA63617),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (hasOpened)
              Positioned(
                top: 22.h,
                right: -8.w,
                child: Image.asset(
                  Assets.bbb.quizGiftOpen.path,
                  width: 15.h,
                  height: 15.h,
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
    _scrollController.removeListener(scrollerListener);
    _scrollController.dispose();

    _liwuPro.dispose();
    _liwuBg.dispose();
  }

  // giftCategory: 1 可以打开的，2 广告，3 普通礼物
  _onBox({required bool canClick, required int index}) {
    jcRizhi("===canClick:$canClick==index:$index");
    setWeizhiJson(index: index, hasOpen: true, money: 0);
    setState(() {});
  }

  // giftC
}
