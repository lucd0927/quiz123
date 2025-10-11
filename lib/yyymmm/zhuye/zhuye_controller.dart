import 'package:get/get.dart';
import 'package:quiz123/tools/package.dart';

import '../../wangluo/shijian_baogao.dart';

class ZhuyeController extends GetxController {
  static ZhuyeController get to => Get.find();
  static const int categoryIndex = 0;
  static const int quizIndex = 1;
  static const int metalIndex = 2;

  static const int quizIndexB = 0;
  static const int cashIndexB = 1;
  final curIndex = JCABluoji.isPackageB() ? quizIndexB.obs : quizIndex.obs;

  void resetIndex(int index) {
    curIndex.value = index;

    if (JCABluoji.isPackageB()) {
      if (index == quizIndexB) {
        JCShijianBaogao.quiz_page("b");
      } else if (index == cashIndexB) {
        JCShijianBaogao.cash_page();
      }
    } else {
      if (index == categoryIndex) {
      } else if (index == quizIndex) {
        JCShijianBaogao.quiz_page("a");
      } else if (index == metalIndex) {}
    }
  }
}
