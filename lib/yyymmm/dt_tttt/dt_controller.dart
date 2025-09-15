import 'package:get/get.dart';
import 'package:quiz123/hive/jc_hive.dart';
import 'package:quiz123/tools/app_track_status.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/yy_gj/shuju/daily_life.dart';
import 'package:quiz123/yy_gj/shuju/data.dart';
import 'package:quiz123/yy_gj/shuju/dati_model.dart';
import 'package:quiz123/yyymmm/dt_tttt/kkkk/dati_erro.dart';
import 'package:tuple/tuple.dart';

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

  static const int upgradeNum = 10;
  static const int initStarNum = 5;
  static const int datiMaxTime = 10;

  String get hCurLeixingIndex {
    return "xxafagsdfg_${curLeixing.value}";
  }

  var box = JCHive.box;

  //
  var curLeixing = EnumLeixinType.dailyLife.name.obs;
  var curLevel = 1.obs;
  var curLeixingIndex = 0.obs;
  var curAllDatiTime = 0.obs;
  var curDaTiTime = 0.obs;
  var curStar = initStarNum.obs;
  var curMoney = 0.0.obs;
  var curRightNum = 0.obs;
  var curAllDatiNum = 0.obs;
  var curShengyuDatiTime = datiMaxTime.obs;
  var curClickAnswer = "".obs;
  var curShowGesture = false.obs;

  List<DatiModel> get datiDatas => _datiDatas;
  List<DatiModel> _datiDatas = [];

  DatiModel get datiModel {
    int curIndex = curLeixingIndex.value;
    int maxLength = _datiDatas.length;
    jcRizhi("=curIndex:$curIndex==maxLength:$maxLength=");
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initDataA();

    String leixing = box.get(hLeixing) ?? EnumLeixinType.dailyLife.name;
    curLeixing = leixing.obs;

    int dengji = box.get(hCurDengji) ?? 1;
    curLevel = dengji.obs;

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

  onDianji({required String click, required String right}) {
    jcRizhi("=====click:$click  right:$right");
    curClickAnswer.value = click;

    showDatiNextLevel(Get.context!, onBtn: (){}, onClose: (){});

  }
}
