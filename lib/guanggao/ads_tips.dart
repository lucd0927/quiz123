import 'dart:ui';

import 'package:get/get.dart';

import '../view/pb_tushi.dart';
import 'kuangkuang/ad_failed.dart';


class GGAdsTips {
  static void toast({
    String text = "Ad loading failed, please try again later",
  }) {
    pbToast(text: text);
  }

  static noAds({
    required VoidCallback onTryAgain,
    required VoidCallback onClose,
  }) async {
    showAdFailedDialog(
      Get.context!,
      onBtn: () {
        onTryAgain();
      },
      onClose: () {
        onClose();
      },
    );
  }
}
