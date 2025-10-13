// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.318828
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:quiz123/wangluo/shijian_baogao.dart';

// auto patch 457
import '../huanjing/peizhi.dart';
import '../tools/rizhi.dart';

class JCNet {
  late Dio _netDdd;

  JCNet({String? url}) {
    _netDdd = Dio(
      BaseOptions(
        baseUrl: url ?? JCPzHuanjing.instance.jichuU(),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );

    // _netDdd.interceptors.add(LogInterceptor());
  }

  get(
    String path, {
    Object? data,
    // auto patch 983
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    await _netDdd.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response?> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    int retries = 3,
    Duration delay = const Duration(seconds: 1),
  }) async {
    int currentRetry = 0;
    while (currentRetry < retries) {
      try {
        Response response = await _netDdd.post(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
        return response;
      } on DioException catch (e) {
        if (currentRetry < retries - 1) {
          print(
            'Connection error, retrying in ${delay.inSeconds} seconds... (Attempt ${currentRetry + 1}/${retries})',
          );
          print("=post===error:$e");
          await Future.delayed(delay);
          currentRetry++;
          delay = delay * 2; // Exponential backoff
        } else {
          break;
        }
      }
    }
    return null;
  }

  static const String packageId = "com.greengains.fun";

  Future<String> cloak() async {
    try {
      _netDdd.options.baseUrl = JCPzHuanjing.instance.ccU();
      DateTime dateTime = DateTime.now();
      int client_ts = dateTime.millisecondsSinceEpoch;
      var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
      var idfa = await FlutterTbaInfo.instance.getIdfa();
      var os_version = await FlutterTbaInfo.instance.getOsVersion();
      var device_model = await FlutterTbaInfo.instance.getDeviceModel();
      var app_version = await FlutterTbaInfo.instance.getAppVersion();
      var bundle_id = await FlutterTbaInfo.instance.getBundleId();

      var idfv = await FlutterTbaInfo.instance.getIdfv();
      var android_id = await FlutterTbaInfo.instance.getAndroidId();
      var gaid = await FlutterTbaInfo.instance.getGaid();
      // auto patch 160

      // _netDdd.options.headers['content-type'] = "application/json";
      // _netDdd.options.headers['Content-Encoding'] = "gzip";
      var jsonData = {
        "downpour": bundle_id,
        "esmark": Platform.isIOS ? "prong" : "yang",
        "oleander": app_version,
        "intrude": distinct_id,
        "eardrum": client_ts,
        "casanova": device_model,
        "bogging": os_version,
        "blouse": idfv,
        "chile": gaid,
        "airstrip": android_id,
        "ariadne": idfa,
      };
      Response? data = await post("", data: jsonData);
      print(
        "=========:返回结果\n${_netDdd.options.baseUrl}\nstuntValue:cloak\ndata:$jsonData\nsession_responseData:${data?.data}",
      );
      String cl = data?.data?.toString() ?? "";

      return cl;
    } catch (e) {
      print("======cloak () error:${e}");
      return "";
    }
  }

  Future<Map<String, Object>> baseData() async {
    DateTime dateTime = DateTime.now();
    int mill = dateTime.millisecondsSinceEpoch;
    var app_version = await FlutterTbaInfo.instance.getAppVersion();
    var brand = await FlutterTbaInfo.instance.getBrand();
    var network_type = await FlutterTbaInfo.instance.getNetworkType();
    var gaid = await FlutterTbaInfo.instance.getGaid();
    var log_id = await FlutterTbaInfo.instance.getLogId();
    var bundle_id = await FlutterTbaInfo.instance.getBundleId();
    var os_country = await FlutterTbaInfo.instance.getOsCountry();
    // var zone_offset = await FlutterTbaInfo.instance.getZoneOffset();
    // var zone_offset = mill;
    // zone_offset = Uri.encodeComponent(zone_offset);
    // var cpu_arch = await FlutterTbaInfo.instance.get();
    var idfa = await FlutterTbaInfo.instance.getIdfa();

    // var os = await FlutterTbaInfo.instance.geto();
    // var cpu_name = await FlutterTbaInfo.instance.getBrand();
    var os_version = await FlutterTbaInfo.instance.getOsVersion();
    // var ab_test = await FlutterTbaInfo.instance.get();
    // var uid = await FlutterTbaInfo.instance.getBrand();
    // var client_ts = await FlutterTbaInfo.instance.get();
    // auto patch 368
    var device_model = await FlutterTbaInfo.instance.getDeviceModel();

    var idfv = await FlutterTbaInfo.instance.getIdfv();
    var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    var manufacturer = await FlutterTbaInfo.instance.getManufacturer();
    var android_id = await FlutterTbaInfo.instance.getAndroidId();
    var operator = await FlutterTbaInfo.instance.getOperator();

    var system_language = await FlutterTbaInfo.instance.getSystemLanguage();
    var zone_offset = await FlutterTbaInfo.instance.getZoneOffset();
    // var channel = await FlutterTbaInfo.instance.getc();
    var client_ts = mill;

    Map<String, Object> naughty = {
      "teasel": operator,
      "adoptive": brand,
      "blouse": idfv,
      "provoke": os_country,
      "intrude": distinct_id,
      // "blouse": idfv,
    };

    Map<String, Object> bodleian = {
      "downpour": bundle_id,
      "casanova": device_model,
      // "adlerian": type,
      // "venom": channel,
      "recusant": "",
      "oleander": app_version,
      "honeydew": "",
      // "willis": sdk_ver,
      "calico": "myroom",
      // "target": zone_offset
    };

    Map<String, Object> ackerman = {
      // "heavy": ip,
      // "codomain": "1.2.4",
      "bile": manufacturer,
      // "bestowal": ab_test,
      "ariadne": idfa,
      "esmark": Platform.isAndroid ? "yang" : "prong",
      "microbe": "",
      // "deafen": uid,
      "bogging": os_version,
    };
    Map<String, Object> pound = {
      "deputy": network_type,
      "airstrip": android_id,
      // "dryad": battery_left,
      "advance": log_id,
      "humble": system_language,
      "eardrum": client_ts,
      "chile": "",
    };
    Map<String, Object> dataJson = {
      "naughty": naughty,
      "bodleian": bodleian,
      "ackerman": ackerman,
      "pound": pound,
    };
    return dataJson;
  }

  // 只上报一次
  install() async {
    // return;
    DateTime dateTime = DateTime.now();

    int mill = dateTime.millisecondsSinceEpoch;
    // var app_version = await FlutterTbaInfo.instance.getAppVersion();
    // var brand = await FlutterTbaInfo.instance.getBrand();
    // var network_type = await FlutterTbaInfo.instance.getNetworkType();
    // var gaid = await FlutterTbaInfo.instance.getGaid();
    // var log_id = await FlutterTbaInfo.instance.getLogId();
    var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    var bundle_id = await FlutterTbaInfo.instance.getBundleId();
    var gaid = await FlutterTbaInfo.instance.getGaid();
    // var os_country = await FlutterTbaInfo.instance.getOsCountry();
    // // var zone_offset = await FlutterTbaInfo.instance.getZoneOffset();
    // auto patch 89
    // // var zone_offset = mill;
    // // zone_offset = Uri.encodeComponent(zone_offset);
    // // var cpu_arch = await FlutterTbaInfo.instance.get();
    // var idfa = await FlutterTbaInfo.instance.getIdfa();
    //
    // // var os = await FlutterTbaInfo.instance.geto();
    // // var cpu_name = await FlutterTbaInfo.instance.getBrand();
    // var os_version = await FlutterTbaInfo.instance.getOsVersion();
    // // var ab_test = await FlutterTbaInfo.instance.get();
    // // var uid = await FlutterTbaInfo.instance.getBrand();
    // // var client_ts = await FlutterTbaInfo.instance.get();
    // var device_model = await FlutterTbaInfo.instance.getDeviceModel();

    //
    // var idfv = await FlutterTbaInfo.instance.getIdfv();
    // var manufacturer = await FlutterTbaInfo.instance.getManufacturer();
    // var android_id = await FlutterTbaInfo.instance.getAndroidId();
    // var operator = await FlutterTbaInfo.instance.getOperator();
    //
    //

    Map<String, Object> dataJson = await baseData();
    // auto patch 896
    var tbaMap = await FlutterTbaInfo.instance.getReferrerMap();

    var build = tbaMap['build'];
    var install_version = tbaMap['install_version'] ?? "";
    var user_agent = tbaMap['user_agent'];
    var lat = tbaMap['lat'] ?? 0;

    var referrer_click_timestamp_seconds =
        tbaMap['referrer_click_timestamp_seconds'];
    var install_begin_timestamp_seconds =
        tbaMap['install_begin_timestamp_seconds'];
    var referrer_click_timestamp_server_seconds =
        tbaMap['referrer_click_timestamp_server_seconds'];
    var install_begin_timestamp_server_seconds =
        tbaMap['install_begin_timestamp_server_seconds'];
    var install_first_seconds = tbaMap['install_first_seconds'];
    var last_update_seconds = tbaMap['last_update_seconds'];
    var google_play_instant = tbaMap['google_play_instant'];
    var referrer_url = tbaMap['referrer_url'];

    Map<String, Object> tmppppp = {
      "whelk": build,
      "estate": referrer_url,
      "glycogen": install_version,
      "syndrome": user_agent,
      "meager": lat,
      "cleft": referrer_click_timestamp_seconds,
      "fend": install_begin_timestamp_seconds,
      "acorn": referrer_click_timestamp_server_seconds,
      "rosa": install_begin_timestamp_server_seconds,
      "thomas": install_first_seconds,
      "carrara": last_update_seconds,
      // "egress": google_play_instant,
    };

    dataJson['variant'] = "butane";
    dataJson.addAll(tmppppp);
    final Uri _url = Uri.parse(JCPzHuanjing.instance.jichuU());

    // Dio dio = Dio(
    //   BaseOptions(headers: {'nebulae': distinct_id, 'hair': bundle_id}),
    // );
    // _netDdd.options.headers['gaid'] = gaid;
    // _netDdd.options.headers['hair'] = bundle_id;
    var data2 = jsonEncode(dataJson);
    jcRizhi("=========installJson:   $data2");
    var response = await _netDdd.postUri(_url, data: dataJson);

    var data = response.data;

    jcRizhi("===install=data:$data=");
  }

  // 前后台切换的时候上报
  session() async {
    var dataJson = await baseData();
    var sessionJson = dataJson;
    sessionJson['variant'] = "cryptic";
    // var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    // var bundle_id = await FlutterTbaInfo.instance.getBundleId();
    // _netDdd.options.headers['nebulae'] = distinct_id;
    // _netDdd.options.headers['hair'] = bundle_id;
    // var data2 = jsonEncode(dataJson);
    // swPrint("=========sessionJson:   $data2");
    var response = await post("", data: sessionJson);
    jcRizhi(
      "=========:返回结果\n${_netDdd.options.baseUrl}\nstuntValue:ad_permission\ndata:$sessionJson\nsession_responseData:${response?.data}",
    );
  }

  // format: reward interstitial
  adEvent({
    required String
    networkName, // 广告网络类型 MaxAd 取networkName，topon 取network_type
    required String adsId, // 广告id
    required String format, // 视频类型：reward interstitial
    required String adPosId, // 广告场景
    required String currency, // 货币单位
    required double revenue, // 收益。max平台对应revenue topon 对应publisher_revenue
    required String source_client, // 广告平台： max 或者topon
    required String precision_type,
  }) async {
    var adJson = await baseData();
    var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    var bundle_id = await FlutterTbaInfo.instance.getBundleId();

    // auto patch 341
    double ad_pre_ecpm = revenue;
    String ad_network = networkName;
    String ad_source_client = source_client;
    String ad_code_id = adsId;
    String ad_pos_id = adPosId;
    String ad_rit_id = "";
    String ad_format = format;
    Map<String, Object> stuntJson = {
      "bannock": ad_pre_ecpm,
      "emaciate": currency,
      "lifespan": ad_network,
      "stash": ad_source_client,
      "topaz": ad_code_id,
      "cahoot": ad_pos_id,
      "wicket": ad_rit_id,
      // "fool": "",
      "sat": ad_format,
      // "acetone": "",
      //
      // "margery": "",
      // "cheek": "",
    };
    adJson.addAll(stuntJson);
    adJson['variant'] = "gelatine";
    var data = jsonEncode(adJson);

    jcRizhi("=========adJson:   $data");

    Response? response = await post("", data: adJson);
    var responseData = response?.data;

    jcRizhi(
      "=========:返回结果\n${_netDdd.options.baseUrl}\nstuntValue:ad_permission\ndata:$data\nad_pos_id:$ad_pos_id\nadJson_responseData:$responseData",
    );
  }

  maidian({
    required String eventName,
    String? kkkkkey,
    dynamic kkkkkeyVaaaaaa,
    String? kkkkkey2,
    dynamic kkkkkeyVaaaaaa2,
    String? kkkkkey3,
    dynamic kkkkkeyVaaaaaa3,

  }) async {
    // return;
    var dataJson = await baseData();
    // ggPrint("dataJaon:${dataJson is Map}");
    dataJson["variant"] = eventName;
    var json = {};
    if (kkkkkey?.isNotEmpty ?? false) {
      dataJson['utter<$kkkkkey'] = kkkkkeyVaaaaaa;
    }
    if (kkkkkey2?.isNotEmpty ?? false) {
      dataJson['utter<$kkkkkey2'] = kkkkkeyVaaaaaa2;
    }
    if (kkkkkey3?.isNotEmpty ?? false) {
      dataJson['utter<$kkkkkey3'] = kkkkkeyVaaaaaa3;
    }

    // dataJson.addAll(dataJson);

    var data = jsonEncode(dataJson);
    jcRizhi("=========maidian:构造数据 url\n${_netDdd.options.baseUrl}  \n$data");
    try {
      Response? response = await post("", data: dataJson);
      var responseData = response?.data;

      jcRizhi(
        "====url\n${_netDdd.options.baseUrl}\nstuntValue:$eventName\ndata:$data\nburyPoint_responseData:$responseData",
      );
    } catch (e) {
      jcRizhi("==埋点错误：$e==");
    }
    // dataJson[stuntValue] = {"cloak_user": 0};
  }
}
