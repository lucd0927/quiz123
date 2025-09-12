import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

jcTsDialog({String text = "", Alignment alignment = Alignment.topCenter}) {
  toastification.show(
    context: Get.context, // optional if you use ToastificationWrapper
    backgroundColor:Colors.black.withValues(alpha: 0.7),
    alignment: alignment,
    autoCloseDuration: const Duration(seconds: 3),
    title: Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.white.withValues(alpha: 1),
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
