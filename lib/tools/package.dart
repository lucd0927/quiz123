// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.327393
import 'dart:async';
import 'dart:io';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';

import 'package:flutter_tba_info/flutter_tba_info.dart';

import 'package:rxdart/rxdart.dart';

import '../ads//jc_ads_tools.dart';
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

  static const String cloakBData = "whinny";
  static const String cloakAData = "moreover";
  static const String afDataOrganic = "Organic";

  static const String kHivePackage = "dfsdsfkjdsflkjfdslkj";
  static const String packageA = "AAAAAAA";
  static const String packageB = "BBBBBBB";

  static String get clockData => _cloakData;

  // static String _clockData = "";

  static bool showH5() {
    jcRizhi("===showH5=_cloakData:$_cloakData==cloakBData:$cloakBData");
    return _cloakData == cloakBData;
  }

  static String _name = packageB ?? packageA;

  // 哪个包  A包还是B包 默认A包
  static String get name => _name;
  final subject = BehaviorSubject<String>();

  static bool isPackageB() {
    return packageB == name;
  }

  void sendA({required String cloakData, required String afData}) {
    jcRizhi("ABPackage send: cloakData:$cloakData  ====afData:$afData");
    if (cloakData == cloakBData &&
        (afData.isNotEmpty && afData != afDataOrganic)) {
      _name = packageB;
      var box = JCHive.box;
      box.put(kHivePackage, packageB);
      JCWindController.initNumberUnit();

      initCompleter.complete(true);
    } else {
      _name = packageA;

      initCompleter.complete(false);
    }

    subject.add(_name);
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

  // afDevKey : CbBDTSE3epZuMEDXGBeXGX
  // appId: 6745999527
  initAppsFlyer({required String afDevKey, required String appId}) async {
    jcRizhi("======initAppsFlyer====afDevKey:$afDevKey");
    try {
      AppsFlyerOptions sdfafd = AppsFlyerOptions(
        afDevKey: afDevKey ?? "应用识别码，产品经理提供",
        // appId: appId ?? "iOS平台的 app id （10位数字），产品经理提供，Android应用不传",
        showDebug: true,
        manualStart: true,
        timeToWaitForATTUserAuthorization: 10,
      );
      AppsflyerSdk appsFlyerAdk = AppsflyerSdk(sdfafd);
      // PBMaiDian.af_req();
      await appsFlyerAdk.initSdk(
        registerOnDeepLinkingCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerConversionDataCallback: true,
      );
      // auto patch 552
      var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
      String userId = distinct_id;

      // 1.AppsFlyer与TBA平台对接
      appsFlyerAdk.setCustomerUserId(userId);
      // 2.应用归因监听

      appsFlyerAdk.onInstallConversionData((p) {
        jcRizhi(
          "==========initAppsFlyer=进入回调===appsFlyerAdk.onInstallConversionData= data$p",
        );
        if (isPackageB()) {
          return;
        }

        String c117pig_af_on = JCFbase().by(name: "c117pig_af_on");
        jcRizhi("==pre==c106card_af_on:$c117pig_af_on==");
        if (c117pig_af_on.isEmpty) {
          c117pig_af_on = "1";
        }
        jcRizhi("==now==c106card_af_on:$c117pig_af_on==");

        if (c117pig_af_on == "1" && p is Map) {
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
            } else {
              // auto patch 567
              _appsFlyerData = afDataOrganic;
              jcRizhi(
                "==========initAppsFlyer====appsFlyerAdk.onInstallConversionDat= zirang",
              );
            }

            // Future.delayed(Duration(seconds: 10), () {
            //   send(cloakData: _cloakData, afData: _appsFlyerData);
            // });

            // todo: 测试代码
            // _appsFlyerData = "ddd";
            sendA(cloakData: _cloakData, afData: _appsFlyerData);
          } else {
            // todo: 测试代码
            // _appsFlyerData = "ddd";
            jcRizhi("==now==qm_af_on: 返回1 但是结构不含有af_status字段");
            sendA(cloakData: _cloakData, afData: _appsFlyerData);
          }
        } else if (c117pig_af_on == "0") {
          jcRizhi("==now==qm_af_on: 返回0 不需要判断af的数据");
          _appsFlyerData = "c106card_af_on";
          sendA(cloakData: _cloakData, afData: _appsFlyerData);
        }
      });

      appsFlyerAdk.startSDK(
        onSuccess: () {
          jcRizhi("=initAppsFlyer=appsFlyerAdk:onSuccess==初始化成功");
          // PBMaiDian.af_suc();
        },
        onError: (int errorCode, String errorMessage) {
          jcRizhi(
            "=initAppsFlyer=appsFlyerAdk:onError=初始化失败=errorCode:$errorCode errorMessage:$errorMessage ",
          );
        },
      );
      _appsFlyerAdk = appsFlyerAdk;
      jcRizhi(
        "======initAppsFlyer===appsFlyerAdk.onInstallConversion==_appsFlyerAdk:$_appsFlyerAdk",
      );
    } catch (e) {
      jcRizhi("======initAppsFlyer===error:$e");
    }
  }

  static AppsflyerSdk? _appsFlyerAdk;

  static AppsflyerSdk? appsflyerSdk() => _appsFlyerAdk;

  cloak({int count = 0}) async {
    var data = await JCNet().cloak();
    // auto patch 693
    jcRizhi("package cloak data:$data");

    if (count == 10) {
      data = cloakAData;
    }

    _cloakData = data;

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
      await Future.delayed(Duration(milliseconds: 1000), () {});
      var nextCount = count + 1;
      await cloak(count: nextCount);
    }
  }

  Future _initA() async {
    // await TBDeviceManager.isLimitAdTrackingEnabled();
    // 广告初始化
    jcRizhi("===_initA==:GGCommonAds().init();==");


    jcRizhi("===_initA==:cloak();==");
    var cloakData = await cloak();
    jcRizhi("===_initA=_initAppsFlyer=cloakData:$cloakData==");

    await _initAppsFlyer();
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
    await _initAppsFlyer();
    int time3 = DateTime.now().millisecondsSinceEpoch;
    jcRizhi("==_initB===_initAppsFlyer() end===耗时:${time3 - time2}");

    await JCWindController.initNumberUnit();
    int time4 = DateTime.now().millisecondsSinceEpoch;
    jcRizhi("==_initB===SWFengKong() end===耗时:${time4 - time3}");
    // PBMaiDian.cloak_req();
    JCNet().cloak().then((v) {
      _cloakData = v ?? "";
      // PBMaiDian.cloak_suc(veinKeyValue: _cloakData == cloakBData ? "1" : "0");
      jcRizhi("==_initB===_cloakData():$_cloakData==");
    });

    initCompleter.complete(true);
  }

  // auto patch 285

  late Completer<bool> initCompleter;

  Future<bool> init() async {
    initCompleter = Completer<bool>();

    // 初始化firebase
    await JCFbase().chushi();

    var box = JCHive.box;

    var packageName = box.get(kHivePackage) ?? packageA;
    packageName = packageB;

    _name = packageName;
    jcRizhi("package==init:$packageName==");
    if (packageName == packageB) {
      await _initB();
    } else {
      await _initA();
    }

    return await initCompleter.future;
  }

  bool isInitAppsFlyer = false;

  _initAppsFlyer() async {
    if (!isInitAppsFlyer) {
      isInitAppsFlyer = true;
      String afKey ="dadfa";
      if (afKey.isEmpty) {
        return;
      }

      await initAppsFlyer(afDevKey: afKey, appId: "");
    }
  }
}
