import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quiz123/tools/app_track_status.dart';
import 'package:quiz123/wangluo/wangluo_jiancha.dart';
import 'package:spine_flutter/spine_flutter.dart';
import 'package:toastification/toastification.dart';

import 'hive/jc_hive.dart';
import 'yy_gj/jc_luy.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // // 1 设置环境

  // // 2 本地存储
  await Hive.initFlutter();
  await Hive.openBox(JCHive.hKeyBox);
  await initSpineFlutter(enableMemoryDebugging: false);
  // 设置只允许竖屏
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown, // 可选：允许上下颠倒的竖屏
  ]);
  JCAppTrackStatus.init();
  pbWangluoCheck.isOnline();
  pbWangluoCheck.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      // splitScreenMode: true,
      child: GlobalLoaderOverlay(
        child: ToastificationWrapper(
          child: GetMaterialApp(
            // main: MyHomePage(title: '1'),
            title: "QuizSpark",
            initialRoute: JcLuy.splash,
            builder: (BuildContext context, Widget? child) {
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarBrightness:Brightness.dark,
                  statusBarIconBrightness: Brightness.light,
                ),
                child: Overlay(
                  initialEntries: <OverlayEntry>[
                    OverlayEntry(
                      builder: (BuildContext ctx) {
                        return child!;
                      },
                    ),
                  ],
                ),
              );
              return Overlay();
            },
            theme: ThemeData(),
            getPages: JcLuy.pages,
            locale: ui.window.locale,
            // translations: FanyiTools(),
            // 你的翻译
            // fallbackLocale: Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
          ),
        ),
      ),
    );
  }
}
