import 'package:get/get.dart';
import 'package:quiz123/tools/package.dart';



class ZhuyeController extends GetxController {
  static ZhuyeController get to => Get.find();
  static const int categoryIndex = 0;
  static const int quizIndex = 1;
  static const int metalIndex = 2;

  static const int quizIndexB = 0;
  static const int cashIndexB = 1;
  final curIndex =JCABluoji.isPackageB()?quizIndexB.obs: quizIndex.obs;

  void resetIndex(int index) {
    curIndex.value = index;

    if (index == categoryIndex ) {

    } else if (index == quizIndex) {

    } else if (index == metalIndex) {

    }
  }
}