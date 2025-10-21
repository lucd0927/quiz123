// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.327393
import 'dart:async';
import 'dart:io';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';

import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:quiz123/ads/guiyin/adjust.dart';
import 'package:quiz123/ads/guiyin/af.dart';
import 'package:quiz123/ads/jc_ads_tools.dart';
import 'package:quiz123/tools/jc_fbase.dart';
import 'package:quiz123/wangluo/shijian_baogao.dart';

import 'package:rxdart/rxdart.dart';

import '../ads/jc_wind_controller.dart';
import '../hive/jc_hive.dart';
import '../wangluo/wangluo.dart';

import 'rizhi.dart';

class JCABluoji {
  static final JCABluoji _instance = JCABluoji._();

  // auto patch 642
  factory JCABluoji() {
    return _instance;
  }

  JCABluoji._();

  static const String cloakBData = "chromium";
  static const String cloakAData = "sprung";
  static const String afDataOrganic = "Organic";

  static const String kHivePackage = "kjdsdsfjkghj";
  static const String packageA = "ppppppA";
  static const String packageB = "ppppppB";

  static String get clockData => _cloakData;

  // static String _clockData = "";

  static bool showH5() {
    jcRizhi("$TGA====showH5=_cloakData:$_cloakData==cloakBData:$cloakBData");
    return _cloakData == cloakBData;
  }

  static String _name = packageA;

  // 哪个包  A包还是B包 默认A包
  static String get name => _name;
  final subject = BehaviorSubject<String>();

  static bool isPackageB() {
    return packageB == name;
  }

  var box = JCHive.box;

  void sendAAA({required String cloakData, required String afData}) {
    bool entryBBB =
        cloakData == cloakBData &&
        (afData.isNotEmpty && afData != afDataOrganic);
    jcRizhi(
      "$TGA=ABPackage send: cloakData:$cloakData  ====afData:$afData entryBBB:$entryBBB",
    );

    var data = box.get(kHivePackage);

    if (entryBBB) {
      if (data == packageB) {
        _name = packageB;
        return;
      }
      _name = packageB;

      box.put(kHivePackage, packageB);
      JCWindController.initNumberUnit();

      initCompleter?.complete(true);
      initCompleter = null;
      subject.add(_name);
    } else {
      _name = packageA;
      box.put(kHivePackage, packageA);
      initCompleter?.complete(false);
      initCompleter = null;
      subject.add(_name);
    }
  }

  void dispose() {
    subject.close();
  }

  void listen(void Function(String packageName) update) {
    subject.stream.listen((String a) {
      jcRizhi("$TGA=ABPackage: update packageName:$a");
      update(a);
    });
  }

  // 正常模式 B包 oft
  // 命中黑名单 A包   brash
  static String _cloakData = cloakAData;

  // Organic network里是否包含【Organic】字段，如果包含则为自然量用户，并且展示为A包
  String _appsFlyerData = afDataOrganic;

  static const String kkGuiyin = "sdfjkdshfgkj";

  hasSaveGuiyinData(){

  }

  guiyin(String source) {
    if (isPackageB()) {
      return;
    }
    box.put(kkGuiyin, source);
    String qs_af_on123 = JCFbase().by(name: "qs_adjust_on");
    jcRizhi("$TGA==guiyin=pre==qs_af_on123:$qs_af_on123==");
    if (qs_af_on123.isEmpty) {
      qs_af_on123 = "1";
    }
    jcRizhi("$TGA==guiyin=now==qs_af_on123:$qs_af_on123==");

    if (qs_af_on123 == "1") {
      jcRizhi("$TGA==guiyin=now==qm_af_on: 返回1 需要判断af的数据");
      if (source.isNotEmpty && source != afDataOrganic) {
        jcRizhi("$TGA===========guiyin= mailiang");
        // 4.满足买量用户的判断条件
        _appsFlyerData = source;
        JCShijianBaogao.organic_to_buy();
      } else {
        _appsFlyerData = afDataOrganic;
        jcRizhi("$TGA===========guiyin= zirang");
      }
      JCShijianBaogao.adjust_suc(_appsFlyerData == afDataOrganic ? "0" : "1");
      // int mill = 12000;
      // Future.delayed(Duration(milliseconds: mill), () {
      //   // todo: 测试代码
      //   _appsFlyerData = "ddd";
      //   sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
      // });

      sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
    } else if (qs_af_on123 == "0") {
      jcRizhi("$TGA===now==qm_af_on: 返回0 不需要判断af的数据");
      _appsFlyerData = "qs_af_on123";
      sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
    }
  }

  cloakAAAA({int count = 0}) async {
    JCShijianBaogao.cloak_req();
    var data = await JCNet().cloak();
    jcRizhi("$TGA=package cloak data:$data count:$count");

    _cloakData = data;
    JCShijianBaogao.cloak_suc(_cloakData == cloakBData ? "1" : "0");
    // 正常模式 B包
    if (data == cloakBData) {
      jcRizhi("$TGA=====正常模式 B包==data:$data=");
      _cloakData = data;
      // send(cloakData: _cloakData, afData: _appsFlyerData);
      // await _initAppsFlyer();
      return data;
    }
    // 命中黑名单 A包
    else if (data == cloakAData) {
      jcRizhi("$TGA=====命中黑名单 A包==data:$data=");
      _cloakData = data;
      // send(cloakData: _cloakData, afData: _appsFlyerData);
      // await _initAppsFlyer();
      return data;
    }
    // 其他数据则再次请求
    else {
      if (count == 10) {
        return cloakAData;
      }

      await Future.delayed(Duration(milliseconds: 1000), () {});
      var nextCount = count + 1;
      return await cloakAAAA(count: nextCount);
    }
  }

  Future _initA() async {
    // 广告初始化
    jcRizhi("$TGA====_initA==cloak();==");
    var cloakData = await cloakAAAA();
    jcRizhi("$TGA====_initA==cloakData:$cloakData==");
    DateTime dateTime = DateTime.now();
    jcRizhi("$TGA===JCFbase==${dateTime.millisecondsSinceEpoch}");
    // 初始化firebase
    await JCFbase().chushi();
    DateTime dateTime2 = DateTime.now();
    jcRizhi(
      "$TGA===JCFbase==${dateTime2.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch}",
    );
    await _chushiGuiyin();



  }

  Future _initB() async {
    // await TBDeviceManager.isLimitAdTrackingEnabled();
    // 广告初始化
    jcRizhi("$TGA===_initB===GGCommonAds().init start==");
    int time = DateTime.now().millisecondsSinceEpoch;
    // await GGCommonAds().init();
    int time2 = DateTime.now().millisecondsSinceEpoch;
    jcRizhi("$TGA===_initB===GGCommonAds().init end===耗时:${time2 - time}");
    var box = JCHive.box;
    box.put(kHivePackage, packageB);
    jcRizhi("$TGA===_initB===_initAppsFlyer() start==");
    await _chushiGuiyin();
    int time3 = DateTime.now().millisecondsSinceEpoch;
    jcRizhi("$TGA===_initB===_initAppsFlyer() end===耗时:${time3 - time2}");
    if (Platform.isAndroid) {
      await JCWindController.initNumberUnit();
      int time4 = DateTime.now().millisecondsSinceEpoch;
      jcRizhi("$TGA===_initB===SWFengKong() end===耗时:${time4 - time3}");
    }

    JCShijianBaogao.cloak_req();
    JCNet().cloak().then((v) {
      _cloakData = v ?? "";
      if (v.isEmpty) {
        _cloakData = cloakAData;
      }
      JCShijianBaogao.cloak_suc(_cloakData == cloakBData ? "1" : "0");
      // bool pAaaaa = _cloakData == cloakAData;
      // jcRizhi(
      //   "==_initB===_cloakData():$_cloakData=cloakAData:$cloakAData=pAaaaa:$pAaaaa",
      // );
      // // pAaaaa = true;
      // if (pAaaaa) {
      //   _name = packageA;
      //   box.put(kHivePackage, packageA);
      //   subject.add(_name);
      // }
    });

    initCompleter?.complete(true);
  }

  // auto patch 285

  Completer<bool>? initCompleter;
  static const String TGA = "QuizPackage:";

  Future<bool> init() async {
    initCompleter = Completer<bool>();
    var box = JCHive.box;
    var packageName = box.get(kHivePackage) ?? packageA;
    // packageName = packageB;

    _name = packageName;
    jcRizhi("$TGA=package==init:$packageName==");
    if (packageName == packageB) {
      DateTime dateTime = DateTime.now();
      jcRizhi("$TGA===JCFbase==${dateTime.millisecondsSinceEpoch}");
      // 初始化firebase
      await JCFbase().chushi();
      DateTime dateTime2 = DateTime.now();
      jcRizhi(
        "$TGA===JCFbase==${dateTime2.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch}",
      );

      await _initB();
    } else {
      await _initA();
    }

    bool result = (await initCompleter?.future) ?? false;
    jcRizhi("$TGA=package==result:$result==isPackageB:${isPackageB()}");
    if (isPackageB()) {
      DateTime dd = DateTime.now();
      // 初始化firebase
      await JCAdsTools().init();
      DateTime dddd = DateTime.now();
      jcRizhi(
        "$TGA===JCAdsTools==${dddd.millisecondsSinceEpoch - dd.millisecondsSinceEpoch}",
      );
    }

    return result;
  }

  bool sfChushiAF = false;
  bool hasAdjust = true;

  _chushiGuiyin() async {
    if (!sfChushiAF) {
      sfChushiAF = true;

      if (hasAdjust) {
        await JcAdjust().initSdk("d1x71jap6eio");
      } else {
        String asdkasfdhka = "XM9ua37BHJWBKq8jTYg74a";
        if (asdkasfdhka.isEmpty) {
          return;
        }
        await JcAF().initAppsFlyer(afDevKey: asdkasfdhka, appId: "6752763599");
      }
      String qs_af_on123 = JCFbase().by(name: "qs_adjust_on");
      jcRizhi("==qs_af_on123==$qs_af_on123");
      //
      // String qs_af_on123 = JCFbase().by(name: "qs_adjust_on");
      // jcRizhi("$TGA==guiyin=pre==qs_af_on123:$qs_af_on123==");
      // if (qs_af_on123.isEmpty) {
      //   qs_af_on123 = "1";
      // }
      //
      // if(qs_af_on123 == "0"){
      //   _appsFlyerData = "qs_af_on123";
      //   sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
      // }
      //

    }
  }
}
