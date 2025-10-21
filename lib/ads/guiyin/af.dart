
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';

import '../../tools/package.dart';
import '../../tools/rizhi.dart';
import '../../wangluo/shijian_baogao.dart';

class JcAF{

  static final JcAF _instance = JcAF._();

  factory JcAF() {
    return _instance;
  }

  JcAF._();


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

        final payload = p["payload"];
        if (payload is Map && payload.containsKey("af_status")) {
          String af_status = payload["af_status"] ?? "";
          JCABluoji().guiyin(af_status);
          return;
        }
        //
        // String qs_af_on123 = JCFbase().by(name: "qs_af_on");
        // jcRizhi("==pre==qs_af_on123:$qs_af_on123==");
        // if (qs_af_on123.isEmpty) {
        //   qs_af_on123 = "1";
        // }
        // jcRizhi("==now==qs_af_on123:$qs_af_on123==");
        //
        // if (qs_af_on123 == "1" && p is Map) {
        //   jcRizhi("==now==qm_af_on: 返回1 需要判断af的数据");
        //   final payload = p["payload"];
        //   if (payload is Map && payload.containsKey("af_status")) {
        //     String af_status = payload["af_status"] ?? "";
        //     // 3.买量用户判断
        //
        //     if (af_status.isNotEmpty && !af_status.contains("Organic")) {
        //       jcRizhi(
        //         "==========initAppsFlyer====appsFlyerAdk.onInstallConversionDat= mailiang",
        //       );
        //       // 4.满足买量用户的判断条件
        //       _appsFlyerData = af_status;
        //       JCShijianBaogao.organic_to_buy();
        //     } else {
        //       // auto patch 567
        //       _appsFlyerData = afDataOrganic;
        //       jcRizhi(
        //         "==========initAppsFlyer====appsFlyerAdk.onInstallConversionDat= zirang",
        //       );
        //     }
        //     JCShijianBaogao.af_suc(_appsFlyerData == afDataOrganic ? "0" : "1");
        //     // int mill = 12000;
        //     // Future.delayed(Duration(milliseconds: mill), () {
        //     //   // todo: 测试代码
        //     //   _appsFlyerData = "ddd";
        //     //   sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
        //     // });
        //
        //     sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
        //   } else {
        //     // todo: 测试代码
        //     // _appsFlyerData = "ddd";
        //     jcRizhi("==now==qm_af_on: 返回1 但是结构不含有af_status字段");
        //     sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
        //   }
        // } else if (qs_af_on123 == "0") {
        //   jcRizhi("==now==qm_af_on: 返回0 不需要判断af的数据");
        //   _appsFlyerData = "qs_af_on123";
        //   sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
        // }
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
}