import 'package:get/get.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';
import 'package:quiz123/yyymmm/zhuye/zhuye_controller.dart';

class FenleiController extends GetxController {
  static FenleiController get to => Get.find();

  onClick({required EnumLeixinType type}) {
    ZhuyeController.to.resetIndex(ZhuyeController.quizIndex);
  }
}
