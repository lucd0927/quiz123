import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quiz123/ads/index.dart';
import 'package:quiz123/tools/app_track_status.dart';
import 'package:quiz123/tools/package.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/wangluo/shijian_baogao.dart';
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
  lifecycleChange();
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


Timer? _houtaiTimer;
bool sfXianshiAd = false;

void lifecycleChange() {
  SystemChannels.lifecycle.setMessageHandler((msg) async {
    jcRizhi('lifecycle> $msg');
    // if(!GGABPackage.isPackageB()){
    //   return msg;
    // }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top,SystemUiOverlay.bottom]);
    // msg是个字符串，是下面的值
    // AppLifecycleState.resumed
    // AppLifecycleState.inactive
    // AppLifecycleState.paused
    // AppLifecycleState.detached
    if (msg == "AppLifecycleState.resumed") {
      // bgGGAudioPlayer.resume();
      JCShijianBaogao.session();
      _houtaiTimer?.cancel();

      if (sfXianshiAd) {
        jcRizhi("===前后切换加载=GGCommonAds().showInterstitialAd=${JCAdsTools.hasDisplayAd()}=");
        if (!JCAdsTools.hasDisplayAd()) {
          jcRizhi("===前后切换加载=GGCommonAds().showInterstitialAd==");

          if (JCABluoji.isPackageB()) {
            JCAdsTools().showInterstitialAd(
              adPosId: JCAdsPosId.kwsbc_launch,
              ignored_hasDisplayAd: false,
              canTryAgain: false,
            );
          }
        }
      }
      sfXianshiAd = false;
    } else {
      // bgGGAudioPlayer.pause();
      if (msg == "AppLifecycleState.paused") {
        jcRizhi("====AppLifecycleState.paused===");
        JCShijianBaogao.app_background();
        sfXianshiAd = false;
        _houtaiTimer?.cancel();
        _houtaiTimer = Timer(Duration(seconds: 3), () {
          sfXianshiAd = true;
          jcRizhi("====AppLifecycleState.paused==showAd:$sfXianshiAd=");
          _houtaiTimer?.cancel();
        });
      } else if (msg == "AppLifecycleState.detached") {
      } else if (msg == "AppLifecycleState.inactive") {}
    }

    return msg;
  });
}
