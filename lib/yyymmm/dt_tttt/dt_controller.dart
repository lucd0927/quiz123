import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/ads/index.dart';
import 'package:quiz123/hive/jc_hive.dart';
import 'package:quiz123/tools/app_track_status.dart';
import 'package:quiz123/tools/package.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/yy_gj/bbbb/kkkkuang/money_ccc.dart';
import 'package:quiz123/yy_gj/bbbb/vvvv/hao_ping.dart';
import 'package:quiz123/yy_gj/shuju/daily_life.dart';
import 'package:quiz123/yy_gj/shuju/data.dart';
import 'package:quiz123/yy_gj/shuju/dati_model.dart';
import 'package:quiz123/yyymmm/dt_tttt/kkkk/dati_error.dart';
import 'package:quiz123/yyymmm/dt_tttt/kkkk/dati_star_zero.dart';
import 'package:quiz123/yyymmm/dt_tttt/kkkk/dati_right.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/animated_float.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/kkkuang/guide_right2.dart';
import 'package:quiz123/yyymmm/dt_tttt/views_b/kkkuang/old_user.dart';
import 'package:quiz123/yyymmm/xxjj/xj_ddd_controller.dart';
import 'package:quiz123/yyymmm/zhuye/views/nav_bottom.dart';

import '../../gen/assets.gen.dart';
import '../../tools/event_bus.dart';
import '../../yy_gj/bbbb/shuzhishuju.dart';
import '../../yy_gj/event_bus.dart';
import '../xxjj/kkkkuang/input_pay_card.dart';
import 'kkkk/dati_next_level.dart';
import 'views_b/dati_floating.dart';
import 'views_b/kkkuang/guide_right8.dart';
import 'views_b/kkkuang/guide_withdraw.dart';
import 'views_b/kkkuang/new_user.dart';

enum EnumLeixinType {
  animal("Animal"),
  dailyLife("DailyLife"),
  science("Science"),
  math("Math"),
  nature("Nature");

  const EnumLeixinType(this.name);

  final String name;
}

class DtController extends GetxController {
  static DtController get to => Get.find();

  static const String hLeixing = "xxxxxxxaaaa";

  static const String hCurDengji = "ekrhtkjasnkj";
  static const String hCurAllTime = "ksjtkhgkidskgn";
  static const String hCurStar = "iosdlksdfjgkldsj";

  static String get hCurMoney =>
      JCABluoji.isPackageB() ? "ahsdfkjhaksjfdhkashkfhjadsf" : "lzjxcvoijsiovj";

  static String get hCurRightNum =>
      JCABluoji.isPackageB() ? "kjeirtihigkjdsh" : "lierilnmndfam";

  static String get hCurAllNum => JCABluoji.isPackageB()
      ? "kjshdfgiojewoirjtkljsadflkaf"
      : "lewrhtifdknmnfa";

  static const int upgradeNum = 10;
  static const int initStarNum = 5;
  static int datiMaxTime = JCABluoji.isPackageB() ? 5 : 10;

  String get hCurLeixingIndex {
    return _leixingKey(curLeixing.value);
  }

  String _leixingKey(String leixingType) {
    return "leixingType_${leixingType}";
  }

  var box = JCHive.box;

  //
  var curLeixing = EnumLeixinType.dailyLife.name.obs;

  var curLeixingIndex = 0.obs;

  // all time
  var curAllDatiTime = 0.obs;

  //
  var curDaTiTime = datiMaxTime.obs;
  var curStar = initStarNum.obs;
  var curMoney = 0.0.obs;
  var curRightNum = 0.obs;
  var curAllDatiNum = 0.obs;

  // var curShengyuDatiTime = datiMaxTime.obs;
  var curClickAnswer = "".obs;
  var curShowGesture = false.obs;

  List<DatiModel> get datiDatas => _datiDatas;
  List<DatiModel> _datiDatas = [];

  DatiModel get datiModel {
    int curIndex = curLeixingIndex.value;
    int maxLength = _datiDatas.length;
    if (curIndex < maxLength) {
      return _datiDatas[curIndex];
    }
    return _datiDatas[maxLength - 1];
  }

  int levelNum() {
    int tmpRightNum = curRightNum.value;
    int tmpA = tmpRightNum % upgradeNum;
    return tmpA;
  }

  int curLevel() {
    int tmpRightNum = curRightNum.value;
    int tmpA = tmpRightNum ~/ upgradeNum;
    if (tmpA == 0) {}
    return tmpA + 1;
  }

  String levelIcon() {
    String icon = Assets.ttt.level1Big.path;
    int tmplevel = curLevel();
    if (tmplevel == 1) {
      icon = Assets.ttt.level1Big.path;
    } else if (tmplevel == 2) {
      icon = Assets.ttt.level2Big.path;
    } else if (tmplevel == 3) {
      icon = Assets.ttt.level3Big.path;
    } else if (tmplevel == 4) {
      icon = Assets.ttt.level4Big.path;
    } else {
      icon = Assets.ttt.level5Big.path;
    }
    return icon;
  }

  bool _hasLoadInit = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    resetAllDataA();
    initB();
    _hasLoadInit = true;
  }

  resetAllDataB() {
    resetAllDataA();
    initB();
    _hasLoadInit = true;
  }

  changeLeixing(EnumLeixinType leixingType) {
    String leixing = leixingType.name;
    _changeLeixing(leixing);
  }

  _changeLeixing(String leixing) {
    curLeixing.value = leixing;
    curClickAnswer.value = "";
    box.put(hLeixing, leixing);
    resetAllDataA();
  }

  resetAllDataA() {
    _initDataA();

    String leixing = box.get(hLeixing) ?? EnumLeixinType.dailyLife.name;
    curLeixing = leixing.obs;

    // int dengji = box.get(hCurDengji) ?? 1;
    // curLevel = dengji.obs;

    int tmpLeixingIndex = box.get(hCurLeixingIndex) ?? 0;
    curLeixingIndex = tmpLeixingIndex.obs;

    int tmpDatiTime = box.get(hCurAllTime) ?? 0;
    curAllDatiTime = tmpDatiTime.obs;

    double tmpMoney = box.get(hCurMoney) ?? 0.0;
    jcRizhi("==curMoney==tmpMoney:$tmpMoney=hCurMoney:$hCurMoney");
    curMoney = tmpMoney.obs;

    int tmpStar = box.get(hCurStar) ?? initStarNum;
    if (JCAppTrackStatus.isFirstLoginToday && !_hasLoadInit) {
      if (tmpStar < initStarNum) {
        tmpStar = initStarNum;
      }
    }
    curStar = tmpStar.obs;

    int tmpallnum = box.get(hCurAllNum) ?? 0;
    curAllDatiNum = tmpallnum.obs;

    int tmprightnum = box.get(hCurRightNum) ?? 0;
    curRightNum = tmprightnum.obs;

    _timerChange();
  }

  int? datiLeixingIndex(EnumLeixinType leixingType) {
    String key = _leixingKey(leixingType.name);
    int? index = box.get(key);
    return index;
  }

  int datiLeixingAllLengt(EnumLeixinType leixingType) {
    return _huoquLeixingData(leixingType.name);
  }

  _huoquLeixingData(String key) {
    var tmpData = DaTiShuju.data;
    String curCategory = key;
    var categoryData = tmpData[curCategory];
    if (categoryData is List) {
      return categoryData.length;
    }
    return 1;
  }

  _initDataA() {
    var tmpData = DaTiShuju.data;
    String curCategory = curLeixing.value;
    var categoryData = tmpData[curCategory];
    List<DatiModel> tmpDatiModels = [];
    if (categoryData is List) {
      for (int i = 0; i < categoryData.length; i++) {
        var data = categoryData[i];

        DatiModel tmp = DatiModel.fromJson(data);
        tmpDatiModels.add(tmp);
      }
    }
    _datiDatas = tmpDatiModels;
    jcRizhi("=====tmpDatiModels:${tmpDatiModels.length}  ");
  }

  onDianji({required String click, required String right}) async {
    if (JCABluoji.isPackageB()) {
      onDianjiB(click: click, right: right);
      return;
    }

    jcRizhi("=====click:$click  right:$right");
    String tmpClick = curClickAnswer.value;
    if (tmpClick.isNotEmpty) {
      return;
    }

    int tmpstar = curStar.value;
    if (tmpstar <= 0) {
      showDatiStarZero(Get.context!, onBtn: () {}, onClose: () {});
      return;
    }
    curClickAnswer.value = click;
    curShowGesture.value = false;
    _curCurLeixingDatiLeftTimer?.cancel();
    await Future.delayed(Duration(milliseconds: 2000));
    // showDatiNextLevel(Get.context!, onBtn: (){}, onClose: (){});

    if (click == right) {
      double tmpcoin = _getCoin() * 1.0;

      showDatiRight(
        Get.context!,
        onBtn: () {
          addDatiCoin(tmpcoin);
          _onNext(hasClickRight: true);
        },
        onClose: () {
          _onNext(hasClickRight: true);
        },
        money: tmpcoin,
      );
    } else {
      showDatiError(
        Get.context!,
        onBtn: () {
          subStar();
          _onNext(showTryAgain: true, hasClickRight: false);
        },
        onClose: () {
          subStar();
          _onNext(hasClickRight: false);
        },
      );
    }
  }

  _onShowUpgrade({required VoidCallback onNext}) {
    int num = addDatiRightNum();
    int level = num % upgradeNum;
    if (level == 0) {
      showDatiNextLevel(
        Get.context!,
        onBtn: () {
          onNext();
        },
        onClose: () {
          onNext();
        },
      );
    } else {
      onNext();
    }
  }

  _onNext({bool showTryAgain = false, required bool hasClickRight}) {
    jcRizhi("===_onNext==");
    if (showTryAgain) {
    } else {
      addDatiAllNum();
      bool hasNextLeixing = addNextLeixingIndex();
      jcRizhi("=__onNext=hasNextLeixing:$hasNextLeixing=");
      if (hasNextLeixing) {
        String nextLeixing = DaTiShuju.xiayigeLeixing(curLeixing.value);
        jcRizhi("=__onNext=nextLeixing:$nextLeixing=");
        _changeLeixing(nextLeixing);
        return;
      }
    }
    if (hasClickRight) {
      if (JCABluoji.isPackageB()) {
        addDatiRightNum();
        XjDddController.to.jiluTxStageRenwuJindu(type: EnumXjjjjLx.dtQuizzzz);
        JCEventBus.fire(LiwuEvent(type: EnumLiwuEvent.scroll));
        __onNext(showTryAgain: showTryAgain);
      } else {
        _onShowUpgrade(
          onNext: () {
            __onNext(showTryAgain: showTryAgain);
          },
        );
      }
    } else {
      __onNext(showTryAgain: showTryAgain);
    }
  }

  __onNext({required bool showTryAgain}) {
    curClickAnswer.value = "";
    _timerChange();

    jumpToAppStore();

  }

  subStar() {
    int tmpAll = curStar.value;
    tmpAll = tmpAll - 1;
    jcRizhi("=subStar:$tmpAll==");

    if (tmpAll < 0) {
      showDatiStarZero(Get.context!, onBtn: () {}, onClose: () {});
    }

    if (tmpAll <= 0) {
      tmpAll = 0;
    }
    curStar.value = tmpAll;
    box.put(hCurStar, tmpAll);

    return tmpAll;
  }

  bool addNextLeixingIndex() {
    bool hasNextLeixing = false;
    int tmpAll = curLeixingIndex.value;
    tmpAll = tmpAll + 1;
    String tmpCurLeixing = curLeixing.value;
    int tmpAllaaa = _huoquLeixingData(tmpCurLeixing);

    jcRizhi("==tmpLeixingIndex:$tmpAll===tmpAllaaa:$tmpAllaaa=");

    if (tmpAll >= tmpAllaaa) {
      tmpAll = tmpAllaaa - 1;
      hasNextLeixing = true;
    }
    jcRizhi("=addNextLeixingIndex2:$tmpAll==tmpAllaaa：$tmpAllaaa");
    curLeixingIndex.value = tmpAll;
    box.put(hCurLeixingIndex, tmpAll);
    return hasNextLeixing;
  }

  addDatiAllNum() {
    int tmpAll = curAllDatiNum.value;
    tmpAll = tmpAll + 1;
    jcRizhi("=addDatiAllNum:$tmpAll==");
    curAllDatiNum.value = tmpAll;
    box.put(hCurAllNum, tmpAll);
  }

  int addDatiRightNum() {
    int tmpAll = curRightNum.value;
    tmpAll = tmpAll + 1;
    jcRizhi("=addDatiRightNum:$tmpAll==");
    curRightNum.value = tmpAll;
    box.put(hCurRightNum, tmpAll);
    return tmpAll;
  }

  int _getCoin() {
    int random = Random().nextInt(1000);
    return random + 1000;
  }

  subDatiCoin(double coin) {
    double tmpcoin = curMoney.value;
    tmpcoin = tmpcoin - coin;
    if (tmpcoin <= 0) {
      tmpcoin = 0;
    }
    curMoney.value = tmpcoin;
    box.put(hCurMoney, tmpcoin);
  }

  addDatiCoin(double coin) {
    double tmpcoin = curMoney.value;
    tmpcoin = tmpcoin + coin;
    curMoney.value = tmpcoin;
    box.put(hCurMoney, tmpcoin);

    if (JCABluoji.isPackageB() && tmpcoin >= minWithdrawJine) {
      if (XjDddController.to.hasSsssavePayCardId()) {
      } else {
        double money = minWithdrawJine;
        showInputPayCard(
          Get.context!,
          onBtn: () {},
          onClose: () {},
          money: money,
        );
      }
    }
  }

  addDatiAllTime() {
    int tmpAll = curAllDatiTime.value;
    tmpAll = tmpAll + 1;
    // jcRizhi("=addDatiAllTime:$tmpAll==");
    curAllDatiTime.value = tmpAll;
    box.put(hCurAllTime, tmpAll);
  }

  Timer? _curCurLeixingDatiLeftTimer;

  _timerChange() {
    _curCurLeixingDatiLeftTimer?.cancel();
    curShowGesture.value = false;
    curDaTiTime.value = datiMaxTime;
    _curCurLeixingDatiLeftTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      int cishu = timer.tick;
      addDatiAllTime();
      if (cishu >= datiMaxTime) {
        curDaTiTime.value = 0;
        curShowGesture.value = true;
        timer.cancel();
      } else {
        int left = datiMaxTime - cishu;
        if (left < 0) {
          left = 0;
        }
        curDaTiTime.value = left;
      }
    });
  }

  ///--------------------------------------------bbbbbb---------------------------------------------
  static const String hkNewUser = "asdfagsdrtru";
  static const String hkFirstFloating = "ksdfjdshjksdhf";
  static const String hkWithdrawGuide = "ireoijflkdjlkdfjslkjg";
  static const String hkGuideRight2 = "oiweruuoiewruo";
  static const String hkGuideRight8 = "opidlknslkn";
  static const String hkTodayAnswerNum = "sljldsjglisdjfglisjdflkjsdf";
  static const String hkCommitGoodReview = "afhklsdjslgjlkdsfjkl";

  toAppStoreCommitReview(){
    box.put(hkCommitGoodReview, true);
  }

  jumpToAppStore(){
    bool hasCommit = box.get(hkCommitGoodReview)??false;
    jcRizhi("=====jumpToAppStore=hasCommit:$hasCommit=");
    if(hasCommit){
      return;
    }

    int num = box.get(hkTodayAnswerNum)??0;
    if(JCAppTrackStatus.isFirstLoginToday){
      num = 0;
      box.put(hkTodayAnswerNum, num);
    }
    jcRizhi("=====jumpToAppStore=hasCommit:$hasCommit=num：$num");
    if(num == 3 || num == 5 ){
      // todo:
      show5StarHp(Get.context!);
    }
    int value = num+1;
    box.put(hkTodayAnswerNum, value);
  }

  bool todayAnswer3() {
    int count = box.get(hkTodayAnswerNum) ?? 0;
    return count == 3;
  }

  bool todayAnswer5() {
    int count = box.get(hkTodayAnswerNum) ?? 0;
    return count == 5;
  }

  initB() {
    if (JCABluoji.isPackageB()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        var tmpNewUser = box.get(hkNewUser);
        jcRizhi("==tmpNewUser:$tmpNewUser===");
        if (tmpNewUser == null) {
          Future.delayed(Duration(milliseconds: 200), () {
            showNewUserDialog(
              Get.context!,
              onBtn: (v) {
                jcRizhi("==tmpNewUser:save 1===");
                box.put(hkNewUser, 1);
              },
            );
          });
        } else {
          if (JCAppTrackStatus.isFirstLoginToday) {
            showOldUserDialog(Get.context!, onBtn: () {});
          }
        }
      });
    }
  }

  @override
  onReady() {}

  QXuanfu _qXuanfu = QXuanfu();

  showXaunfu() {
    _qXuanfu.close();

    double tmpXuanfu = ShuzhiShuju.float_prize();

    _qXuanfu.show(
      context: Get.context!,
      child: DatiFloating(
        onMoney: (data) async {
          _qXuanfu.close();
          var firstFloat = box.get(hkFirstFloating);
          bool result = true;
          if (firstFloat == null) {
            result = true;
            box.put(hkFirstFloating, 1);
          } else {
            result = await JCAdsTools().showRewardAd(
              adPosId: JCAdsPosId.kwsbc_bubble_rv,
            );
          }
          jcRizhi("=showXaunfu===result:$result=");
          if (result) {
            XjDddController.to.jiluTxStageRenwuJindu(type: EnumXjjjjLx.qipaoo);
            MoneyCcc().show(
              context: Get.context!,
              money: tmpXuanfu,
              onClaimDouble: (dd) async {
                await Future.delayed(Duration(milliseconds: 10000));
                showXaunfu();
              },
              onClaim: (data) async {
                await Future.delayed(Duration(milliseconds: 10000));
                showXaunfu();
              },
            );
          } else {
            showXaunfu();
          }

          // onShowMoneyCcc(
          //   money: tmpXuanfu,
          //   onEnd: () async {
          //     await Future.delayed(Duration(milliseconds: 2000));
          //     showXaunfu();
          //   },
          // );
        },
      ),
    );
  }

  double minWithdrawJine = ShuzhiShuju.eq_range()[0];

  onDianjiB({required String click, required String right}) async {
    jcRizhi("=====click:$click  right:$right");
    String tmpClick = curClickAnswer.value;
    if (tmpClick.isNotEmpty) {
      return;
    }

    curClickAnswer.value = click;
    curShowGesture.value = false;
    _curCurLeixingDatiLeftTimer?.cancel();
    bool hasR = click == right;
    await Future.delayed(Duration(milliseconds: hasR ? 800 : 1200));
    // showDatiNextLevel(Get.context!, onBtn: (){}, onClose: (){});

    if (hasR) {
      double tmpcoin = ShuzhiShuju.quiz_prize();
      var sfTixiGuide = box.get(hkWithdrawGuide);

      // sfTixiGuide = null;
      if (sfTixiGuide != null) {
        onShowMoneyCcc(money: tmpcoin);
      } else {
        onShowWithdrawGuide();
      }
    } else {
      _onNext(hasClickRight: false);
    }
  }

  onShowWithdrawGuide() {
    double tmpcoin = ShuzhiShuju.quiz_prize();
    showGuideWithdrawDialog(
      Get.context!,
      onBtn: () {
        box.put(hkWithdrawGuide, 1);
        _onNext(hasClickRight: true);
      },
      money: tmpcoin,
    );
  }

  onShowMoneyCcc({required double money, VoidCallback? onEnd}) {
    MoneyCcc().show(
      context: Get.context!,
      money: money,
      onClaimDouble: (data) {
        _onNext(hasClickRight: true);

        _guide();
        onEnd?.call();
      },
      onClaim: (data) {
        _onNext(hasClickRight: true);
        _guide();
        onEnd?.call();
      },
    );
  }

  _guide() {
    int curNum = curRightNum.value;
    if (curNum == 2) {
      Future.delayed(Duration(milliseconds: 1000), () {
        GuideRight2().show();
      });
    } else if (curNum == 8) {
      Future.delayed(Duration(milliseconds: 1000), () {
        GuideRight8().show();
      });
    }
  }

  hasGuideRight2() {
    return box.get(hkGuideRight2) != null;
  }

  hasGuideRight8() {
    return box.get(hkGuideRight8) != null;
  }
}
