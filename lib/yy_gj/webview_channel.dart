import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:quiz123/tools/rizhi.dart';

/// 接入示例代码Services
class WebviewChannelIos {
  WebviewChannelIos._internal();

  factory WebviewChannelIos() => _instance;

  static final WebviewChannelIos _instance = WebviewChannelIos._internal();

  static const MethodChannel _askfChhh = MethodChannel('com.quizspark.web123view');

  /// 此处代码需在main文件中调用（只调用一次）
  Future<void> nbaIosChan(BuildContext context) async {
    jcRizhi("====rightAnsConfigIOSChannel=");
    _askfChhh.setMethodCallHandler((MethodCall call) async {
    });
  }
  /// 进入A面时就调用（只调用一次）
  Future<void> asdfAnsRAaaaVi1111() async {
    jcRizhi("==rightAnsRemoveView1====");
    _askfChhh.invokeMethod('sldkflkjadfkljd');
  }

  /// 进入B面时就调用（只调用一次）
  Future<void> asfdasfLoadCcccc() async {
    jcRizhi("==rightAnsLoadConfig====");
    _askfChhh.invokeMethod('knzcvxnakjhfksdhgkjd');
  }

  /// 进入B面时就调用（只调用一次)
  Future<void> lasflkafAnsGetaldsjlkasfBbbb() async {
    jcRizhi("==rightAnsGetOffer====");
    _askfChhh.invokeMethod('jaroiusnflksd');
  }
  Future<void> idfaaaaaaa() async {
    String idfa = await FlutterTbaInfo().getIdfa();
    jcRizhi("==idfa====$idfa");
    _askfChhh.invokeMethod('alksdfjklsajdfs',idfa);
  }

  /// 点击项目右上角或其他地方打开web游戏调用（每次点击按钮调用）
  Future<void> alsdjklsfShowWvvvv() async {
    jcRizhi("==rightAnsShowWebview====");
    _askfChhh.invokeMethod('anskjdshgkjsdfhk');
  }
}