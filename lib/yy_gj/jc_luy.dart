// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.316821

import 'package:get/get.dart';

import '../yyymmm/kaiping/kaiping.dart';
import '../yyymmm/zhuye.dart';



class JcLuy {
  static const splash = "/splash";
  static const zhuye = "/zhuye";
  static const test = "/test";
  static const wwvv = "/vvwwvv";


  // static const quiz_cash = "/quiz_cash";

  static List<GetPage> pages = [
    GetPage(name: splash, page: () => JCKaiping()),
    GetPage(name: zhuye, page: () => Zhuye()),

  ];
}