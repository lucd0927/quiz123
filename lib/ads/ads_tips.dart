import 'dart:ui';

import 'package:get/get.dart';
import 'package:quiz123/view/jc_ts_kuang.dart';

import 'kuang/guanggao_failed.dart';


class JSAdsTips {
  static void toast({
    String text = "Ad loading failed, please try again later",
  }) {
    jcTsDialog(text: text);
  }

  static noAds({
    required VoidCallback onTryAgain,
    required VoidCallback onClose,
  }) async {
    showAdFailedDialog(
      Get.context!,
      onFunc: () {
        onTryAgain();
      },
      onFunc2: () {
        onClose();
      },
    );
  }
}
