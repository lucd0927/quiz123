import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:quiz123/hive/jc_hive.dart';
import 'package:quiz123/tools/app_track_status.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/yy_gj/shuju/daily_life.dart';
import 'package:quiz123/yy_gj/shuju/data.dart';
import 'package:quiz123/yy_gj/shuju/dati_model.dart';
import 'package:quiz123/yyymmm/dt_tttt/kkkk/dati_error.dart';
import 'package:quiz123/yyymmm/dt_tttt/kkkk/dati_star_zero.dart';
import 'package:quiz123/yyymmm/dt_tttt/kkkk/dati_right.dart';
import 'package:tuple/tuple.dart';

import '../../gen/assets.gen.dart';
import 'kkkk/dati_next_level.dart';

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
  static const String hCurMoney = "lzjxcvoijsiovj";
  static const String hCurRightNum = "lierilnmndfam";
  static const String hCurAllNum = "lewrhtifdknmnfa";

  static const int upgradeNum = 5;
  static const int initStarNum = 5;
  static const int datiMaxTime = 10;

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    resetAllDataA();
  }

  changeLeixing(EnumLeixinType leixingType) {
    String leixing = leixingType.name;
    curLeixing.value = leixing;
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
    curMoney = tmpMoney.obs;

    int tmpStar = box.get(hCurStar) ?? initStarNum;
    if (JCAppTrackStatus.isFirstLoginToday) {
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

  int datiLeixingIndex(EnumLeixinType leixingType) {
    String key = _leixingKey(leixingType.name);
    int index = box.get(key) ?? 0;
    return index;
  }

  int datiLeixingAllLengt(EnumLeixinType leixingType) {
    var tmpData = DaTiShuju.data;
    String curCategory = leixingType.name;
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
    if (showTryAgain) {
    } else {
      addDatiAllNum();
      addNextLeixingIndex();
    }

    if (hasClickRight) {
      _onShowUpgrade(onNext: (){
        __onNext();
      });
    } else {
      __onNext();
    }
  }

  __onNext() {
    curClickAnswer.value = "";
    _timerChange();
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

  addNextLeixingIndex() {
    int tmpAll = curLeixingIndex.value;
    tmpAll = tmpAll + 1;
    jcRizhi("=addNextLeixingIndex:$tmpAll==");
    curLeixingIndex.value = tmpAll;
    box.put(hCurLeixingIndex, tmpAll);
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

  addDatiCoin(double coin) {
    double tmpcoin = curMoney.value;
    tmpcoin = tmpcoin + coin;
    curMoney.value = tmpcoin;
    box.put(hCurMoney, tmpcoin);
  }

  addDatiAllTime() {
    int tmpAll = curAllDatiTime.value;
    tmpAll = tmpAll + 1;
    jcRizhi("=addDatiAllTime:$tmpAll==");
    curAllDatiTime.value = tmpAll;
    box.put(hCurAllTime, tmpAll);
  }

  Timer? _curCurLeixingDatiLeftTimer;

  _timerChange() {
    curShowGesture.value = false;
    curDaTiTime.value = initStarNum;
    _curCurLeixingDatiLeftTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      int cishu = timer.tick;
      addDatiAllTime();
      if (cishu >= initStarNum) {
        curDaTiTime.value = 0;
        curShowGesture.value = true;
        timer.cancel();
      } else {
        int left = initStarNum - cishu;
        if (left < 0) {
          left = 0;
        }
        curDaTiTime.value = left;
      }
    });
  }
}
