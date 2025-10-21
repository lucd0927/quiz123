import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_ad_revenue.dart';
import 'package:adjust_sdk/adjust_attribution.dart';
import 'package:adjust_sdk/adjust_config.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:quiz123/tools/package.dart';

import '../../wangluo/shijian_baogao.dart';
import '../jc_common_config.dart';

class JcAdjust {
  static final JcAdjust _instance = JcAdjust._();

  factory JcAdjust() {
    return _instance;
  }

  JcAdjust._();

  AdjustConfig? adjustConfig() => _config;

  AdjustConfig? _config;

  initSdk(String appToken) async {
    // 在进行测试时，应当确保将环境设置为 AdjustEnvironment.sandbox 。请在向应用商店提交应用前将此设为 AdjustEnvironment.production。
    AdjustConfig config = AdjustConfig(appToken, AdjustEnvironment.production);
    config.logLevel = AdjustLogLevel.verbose;
    var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    // config.externalDeviceId =distinct_id;

    _config = config;
    Adjust.addGlobalCallbackParameter("customer_user_id", distinct_id);
    config.attributionCallback = (AdjustAttribution attributionChangedData) {
      print('[Adjust]: Attribution changed!');

      if (attributionChangedData.trackerToken != null) {
        print(
          '[Adjust]: Tracker token: ${attributionChangedData!.trackerToken ?? ""}',
        );
      }
      if (attributionChangedData.trackerName != null) {
        print('[Adjust]: Tracker name: ${attributionChangedData.trackerName}');
      }
      if (attributionChangedData.campaign != null) {
        print('[Adjust]: Campaign: ${attributionChangedData.campaign}');
      }
      String? network = attributionChangedData.network;
      if (network != null) {
        print('[Adjust]: Network: ${network}');

        if (network != JCABluoji.afDataOrganic) {
          JCABluoji().guiyin(network);
        }
      }
      if (attributionChangedData.creative != null) {
        print('[Adjust]: Creative: ${attributionChangedData.creative}');
      }
      if (attributionChangedData.adgroup != null) {
        print('[Adjust]: Adgroup: ${attributionChangedData.adgroup}');
      }
      if (attributionChangedData.clickLabel != null) {
        print('[Adjust]: Click label: ${attributionChangedData.clickLabel}');
      }
      if (attributionChangedData.fbInstallReferrer != null) {
        print(
          '[Adjust]: facebook install referrer: ${attributionChangedData.fbInstallReferrer}',
        );
      }
      if (attributionChangedData.jsonResponse != null) {
        print(
          '[Adjust]: JSON Response: ${attributionChangedData.jsonResponse}',
        );
      }
    };

    Adjust.initSdk(config);
    JCShijianBaogao.adjust_req();
  }


  adjustRevenue({
    required final String network,
    required final String currency,
    required final double value,
    required final EnumAdsPlatform source,
  }){
    String adSource = "applovin_max_sdk";

    if(source == EnumAdsPlatform.max){
      adSource = "applovin_max_sdk";
    }else if(source == EnumAdsPlatform.topon){
    adSource = "topon_sdk";
    }

    AdjustAdRevenue adjustAdRevenue = AdjustAdRevenue(adSource);
    adjustAdRevenue.setRevenue(value, currency);
    adjustAdRevenue.adRevenueNetwork = network;
    Adjust.trackAdRevenue(adjustAdRevenue);
  }

}
