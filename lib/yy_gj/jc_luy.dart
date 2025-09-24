// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.316821

import 'package:get/get.dart';
import 'package:quiz123/yyymmm/sz_page/sz_page.dart';

import '../yyymmm/kaiping/kaiping.dart';
import '../yyymmm/zhuye/zhuye.dart';

class JcLuy {
  static const splash = "/splash";
  static const zhuye = "/zhuye";
  static const test = "/test";
  static const wwvv = "/vvwwvv";
  static const shezhi = "/asdfasdfasdf";

  // static const quiz_cash = "/quiz_cash";

  static List<GetPage> pages = [
    GetPage(name: splash, page: () => JCKaiping()),
    GetPage(name: zhuye, page: () => Zhuye()),
    GetPage(name: shezhi, page: () => SzPage(showBack: true)),
  ];
}
