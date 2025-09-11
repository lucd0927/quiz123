import 'package:get/get.dart';



class ZhuyeController extends GetxController {
  static ZhuyeController get to => Get.find();
  final curIndex = 0.obs;
  static const int categoryIndex = 0;
  static const int quizIndex = 1;
  static const int settingIndex = 2;
  void resetIndex(int index) {
    curIndex.value = index;

    if (index == categoryIndex ) {

    } else if (index == quizIndex) {

    } else if (index == settingIndex) {

    }
  }
}