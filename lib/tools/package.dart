// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.327393
import 'dart:async';
import 'dart:io';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';

import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:quiz123/ads/jc_ads_tools.dart';
import 'package:quiz123/wangluo/shijian_baogao.dart';

import 'package:rxdart/rxdart.dart';

import '../ads/jc_wind_controller.dart';
import '../hive/jc_hive.dart';
import '../wangluo/wangluo.dart';
import 'jc_fbase.dart';
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
    jcRizhi("===showH5=_cloakData:$_cloakData==cloakBData:$cloakBData");
    return _cloakData == cloakBData;
  }

  static String _name = packageA;

  // 哪个包  A包还是B包 默认A包
  static String get name => _name;
  final subject = BehaviorSubject<String>();

  static bool isPackageB() {
    return packageB == name;
  }

  void sendAAA({required String cloakData, required String afData}) {
    bool entryBBB =
        cloakData == cloakBData &&
        (afData.isNotEmpty && afData != afDataOrganic);
    jcRizhi(
      "ABPackage send: cloakData:$cloakData  ====afData:$afData entryBBB:$entryBBB",
    );
    var box = JCHive.box;
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
      subject.add(_name);
      initCompleter?.complete(false);
    }
  }

  void dispose() {
    subject.close();
  }

  void listen(void Function(String packageName) update) {
    subject.stream.listen((String a) {
      jcRizhi("ABPackage: update packageName:$a");
      update(a);
    });
  }

  // 正常模式 B包 oft
  // 命中黑名单 A包   brash
  static String _cloakData = "";

  // Organic network里是否包含【Organic】字段，如果包含则为自然量用户，并且展示为A包
  String _appsFlyerData = afDataOrganic;

  // afDevKey : asdasf1122xadfaf
  // appId: 56564645
  initAppsFlyer({required String afDevKey, required String appId}) async {
    jcRizhi("======initAppsFlyer====afDevKey:$afDevKey appId:$appId");
    try {
      AppsFlyerOptions dfghdfhdfhg = AppsFlyerOptions(
        afDevKey: afDevKey ?? "应用识别码，产品经理提供",
        appId: appId ?? "iOS平台的 app id （10位数字），产品经理提供，Android应用不传",
        showDebug: true,
        manualStart: true,
        timeToWaitForATTUserAuthorization: 10,
      );
      AppsflyerSdk afSdkkkkkk = AppsflyerSdk(dfghdfhdfhg);
      JCShijianBaogao.af_req();
      await afSdkkkkkk.initSdk(
        registerOnDeepLinkingCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerConversionDataCallback: true,
      );
      // auto patch 552
      var distinct_id = await FlutterTbaInfo.instance.getDistinctId();

      // 1.AppsFlyer与TBA平台对接
      afSdkkkkkk.setCustomerUserId(distinct_id);
      // 2.应用归因监听

      afSdkkkkkk.onInstallConversionData((p) {
        jcRizhi(
          "==========initAppsFlyer=进入回调===appsFlyerAdk.onInstallConversionData= data$p",
        );
        if (isPackageB()) {
          return;
        }

        String qs_af_on123 = JCFbase().by(name: "qs_af_on");
        jcRizhi("==pre==qs_af_on123:$qs_af_on123==");
        if (qs_af_on123.isEmpty) {
          qs_af_on123 = "1";
        }
        jcRizhi("==now==qs_af_on123:$qs_af_on123==");

        if (qs_af_on123 == "1" && p is Map) {
          jcRizhi("==now==qm_af_on: 返回1 需要判断af的数据");
          final payload = p["payload"];
          if (payload is Map && payload.containsKey("af_status")) {
            String af_status = payload["af_status"] ?? "";
            // 3.买量用户判断

            if (af_status.isNotEmpty && !af_status.contains("Organic")) {
              jcRizhi(
                "==========initAppsFlyer====appsFlyerAdk.onInstallConversionDat= mailiang",
              );
              // 4.满足买量用户的判断条件
              _appsFlyerData = af_status;
              JCShijianBaogao.organic_to_buy();
            } else {
              // auto patch 567
              _appsFlyerData = afDataOrganic;
              jcRizhi(
                "==========initAppsFlyer====appsFlyerAdk.onInstallConversionDat= zirang",
              );
            }
            JCShijianBaogao.af_suc(_appsFlyerData == afDataOrganic ?"0":"1");
            // int mill = 12000;
            // Future.delayed(Duration(milliseconds: mill), () {
            //   // todo: 测试代码
            //   _appsFlyerData = "ddd";
            //   sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
            // });

            sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
          } else {
            // todo: 测试代码
            // _appsFlyerData = "ddd";
            jcRizhi("==now==qm_af_on: 返回1 但是结构不含有af_status字段");
            sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
          }
        } else if (qs_af_on123 == "0") {
          jcRizhi("==now==qm_af_on: 返回0 不需要判断af的数据");
          _appsFlyerData = "qs_af_on123";
          sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
        }
      });

      afSdkkkkkk.startSDK(
        onSuccess: () {
          jcRizhi("=initAppsFlyer=appsFlyerAdk:onSuccess==初始化成功");

        },
        onError: (int errorCode, String errorMessage) {
          jcRizhi(
            "=initAppsFlyer=appsFlyerAdk:onError=初始化失败=errorCode:$errorCode errorMessage:$errorMessage ",
          );
        },
      );
      _appsFlyerAdk = afSdkkkkkk;
      jcRizhi(
        "======initAppsFlyer===appsFlyerAdk.onInstallConversion==_appsFlyerAdk:$_appsFlyerAdk",
      );
    } catch (e) {
      jcRizhi("======initAppsFlyer===error:$e");
    }
  }

  static AppsflyerSdk? _appsFlyerAdk;

  static AppsflyerSdk? appsflyerSdk() => _appsFlyerAdk;

  // 仅针对A包
  cloakAAAA({int count = 0}) async {
    JCShijianBaogao.cloak_req();
    var data = await JCNet().cloak();
    jcRizhi("package cloak data:$data count:$count");

    _cloakData = data;
    JCShijianBaogao.cloak_suc(_cloakData == cloakBData ? "1" : "0");
    // 正常模式 B包
    if (data == cloakBData) {
      jcRizhi("====正常模式 B包==data:$data=");
      _cloakData = data;
      // send(cloakData: _cloakData, afData: _appsFlyerData);
      // await _initAppsFlyer();
      return data;
    }
    // 命中黑名单 A包
    else if (data == cloakAData) {
      jcRizhi("====命中黑名单 A包==data:$data=");
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
    jcRizhi("===_initA==:cloak();==");
    var cloakData = await cloakAAAA();
    jcRizhi("===_initA=_initAppsFlyer=cloakData:$cloakData==");
    await _chushiAF();
  }

  Future _initB() async {
    // await TBDeviceManager.isLimitAdTrackingEnabled();
    // 广告初始化
    jcRizhi("==_initB===GGCommonAds().init start==");
    int time = DateTime.now().millisecondsSinceEpoch;
    // await GGCommonAds().init();
    int time2 = DateTime.now().millisecondsSinceEpoch;
    jcRizhi("==_initB===GGCommonAds().init end===耗时:${time2 - time}");
    var box = JCHive.box;
    box.put(kHivePackage, packageB);
    jcRizhi("==_initB===_initAppsFlyer() start==");
    await _chushiAF();
    int time3 = DateTime.now().millisecondsSinceEpoch;
    jcRizhi("==_initB===_initAppsFlyer() end===耗时:${time3 - time2}");
    if (Platform.isAndroid) {
      await JCWindController.initNumberUnit();
      int time4 = DateTime.now().millisecondsSinceEpoch;
      jcRizhi("==_initB===SWFengKong() end===耗时:${time4 - time3}");
    }

    JCShijianBaogao.cloak_req();
    JCNet().cloak().then((v) {
      _cloakData = v ?? "";
      JCShijianBaogao.cloak_suc(_cloakData == cloakBData ? "1" : "0");
      // PBMaiDian.cloak_suc(veinKeyValue: _cloakData == cloakBData ? "1" : "0");
      bool pAaaaa = _cloakData == cloakAData;
      jcRizhi("==_initB===_cloakData():$_cloakData=cloakAData:$cloakAData=pAaaaa:$pAaaaa");
      // pAaaaa = true;
      if(pAaaaa){
        _name = packageA;
        box.put(kHivePackage, packageA);
        subject.add(_name);
      }

    });

    initCompleter?.complete(true);
  }

  // auto patch 285

  Completer<bool>? initCompleter;

  Future<bool> init() async {
    initCompleter = Completer<bool>();

    // 初始化firebase
    await JCFbase().chushi();
    await JCAdsTools().init();
    var box = JCHive.box;

    var packageName = box.get(kHivePackage) ?? packageA;
    // packageName = packageB;

    _name = packageName;
    jcRizhi("package==init:$packageName==");
    if (packageName == packageB) {
      await _initB();
    } else {
      await _initA();
    }

    return (await initCompleter?.future) ?? false;
  }

  bool sfChushiAF = false;

  _chushiAF() async {
    if (!sfChushiAF) {
      sfChushiAF = true;
      String asdkasfdhka = "XM9ua37BHJWBKq8jTYg74a";
      if (asdkasfdhka.isEmpty) {
        return;
      }

      await initAppsFlyer(afDevKey: asdkasfdhka, appId: "6752763599");
    }
  }
}
