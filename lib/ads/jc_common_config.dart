import 'package:thinkup_sdk/at_index.dart';
import 'package:applovin_max/applovin_max.dart';

class JCCommonAdsListener {
  final InterstitialListener? interstitialListener;
  final RewardedAdListener? rewardedAdListener;
  final void Function(ATRewardResponse)? atRewardResponse;
  final void Function(ATInterstitialResponse)? atInterstitialResponse;

  JCCommonAdsListener({
    required this.interstitialListener,
    required this.rewardedAdListener,
    required this.atRewardResponse,
    required this.atInterstitialResponse,
  });
}



class GGCommonJson {
  // 哪种方案 A 老方案 B 新方案
  static const String k_which_scheme = "kwsbc_switch";
  static const bool scheme_A = false;
  static const bool scheme_B = true;

  static const String k_out_int = "chaping";
  static const String k_out_rv = "jili";

  // static const String k_int_one_name = "glgns_int_one";
  // static const String k_int_two_name = "glgns_int_two";
  // static const String k_rv_one_name = "glgns_rv_one";
  // static const String k_rv_two_name = "glgns_rv_two";

  // 广告id
  static const String k_ads_id = "swxklbap";

  // 广告平台 max topon
  static const String k_platfrom = "ggatjmdl";

  // 广告类型 【interstitial为插屏类型，native为原生类型，reward为激励视频类型】
  static const String k_ad_type = "swyhrkjr";
  static const String k_time_out = "mzfedhwo";


  static const String k_ecpm = "ecpm";

  // 广告过期时间

  static const String maxkeyEncode =
      "OCI/Dx0bMCUBPgQNOT4nOTQZIwchDCQTOkcjDSIvIgEjDSomDyEiNio4EhovOUIeIT47AUwBRjgqOhI8L0dBGzctJy0NIxFMGhIkMAVCQ0RDISITRjY=";

  // max 平台
  static final String ad_platfrom_max = EnumAdsPlatform.max.name;

  // topon 平台
  static final String ad_platfrom_topon = EnumAdsPlatform.topon.name;

  // 插屏
  static final String ad_type_int = EnumAdsType.interstitial.name;

  // 激励
  static final String ad_type_rv = EnumAdsType.reward.name;

  static Map<String, dynamic> changeLocal(Map<String, dynamic> online) {
    Map<String, dynamic> newLocal = {};

    newLocal['cblhygrw'] = online['cblhygrw'];
    newLocal['hjioqwvw'] = online['hjioqwvw'];
    newLocal[k_which_scheme] = online[k_which_scheme];
    newLocal[k_out_int] = online['kwsbc_int'];

    newLocal[k_out_rv] = online['kwsbc_rv'];
    return newLocal;
  }

  static var localB = {
    "cblhygrw": 100,
    "hjioqwvw": 100,
    "kwsbc_switch": false,
    "kwsbc_int": [
      {
        "swxklbap": "8cf1af50d7596ca5",
        "ggatjmdl": "max",
        "swyhrkjr": "interstitial",
        "mzfedhwo": 3000
      }
    ],
    "kwsbc_rv": [
      {
        "swxklbap": "2894e29f5834cdf9",
        "ggatjmdl": "max",
        "swyhrkjr": "reward",
        "mzfedhwo": 3000
      }
    ]
  };

  static var localTopon = {
    "cblhygrw": 100,
    "hjioqwvw": 100,
    "kwsbc_switch": false,
    "kwsbc_int": [
      {
        "swxklbap": "n1h6chejmdltaa",
        "ggatjmdl": "topon",
        "swyhrkjr": "interstitial",
        "mzfedhwo": 3000
      }
    ],
    "kwsbc_rv": [
      {
        "swxklbap": "n1h6chejmdlkn6",
        "ggatjmdl": "topon",
        "swyhrkjr": "reward",
        "mzfedhwo": 3000
      }
    ]
  };


  static var localToponIOsTest = {
    "cblhygrw": 100,
    "hjioqwvw": 100,
    "kwsbc_switch": false,
    "kwsbc_int": [
      {
        "swxklbap": "n69e97c359e59f",
        "ggatjmdl": "topon",
        "swyhrkjr": "interstitial",
        "mzfedhwo": 3000
      }
    ],
    "kwsbc_rv": [
      {
        "swxklbap": "n69e97dcee016e",
        "ggatjmdl": "topon",
        "swyhrkjr": "reward",
        "mzfedhwo": 3000
      }
    ]
  };

  static var local =localTopon;
}
enum EnumAdsPlatform {
  max("max"),
  topon("topon");

  const EnumAdsPlatform(this.name);

  final String name;
}

enum EnumAdsType {
  interstitial("interstitial"),
  reward("reward");

  const EnumAdsType(this.name);

  final String name;
}
enum EnumGetScene {

  quiz(name: "quiz"),
  wheel(name: "wheel"),
  floating(name: "floating"),

  unknow(name: "unknow");

  const EnumGetScene({required this.name});

  final String name;
}