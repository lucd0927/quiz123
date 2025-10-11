import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class IosStore {
  // 6745999527
  static to() async {
    String appId = "6752763599";
    if (await canLaunchUrl(
      Uri.parse(
        'itms-apps://itunes.apple.com/app/id${appId}?action=write-review',
      ),
    )) {
      launchUrl(
        Uri.parse(
          'itms-apps://itunes.apple.com/app/id${appId}?action=write-review',
        ),
      );
    } else {
      debugPrint("=====跳转失败===");
    }
  }
}