// // 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.327901
// import 'dart:async';
// import 'dart:io';
// import 'dart:ui';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:flutter/material.dart';
//
// import 'rizhi.dart';
//
// class JCFbase {
//   // auto patch 391
//   static final JCFbase _instance = JCFbase._();
//
//   JCFbase._();
//
//   factory JCFbase() => _instance;
//
//   final update = StreamController<bool>.broadcast();
//
//   String by({required String name}) =>
//       FirebaseRemoteConfig.instance.getString(name);
//
//   Future<void> chushi() async {
//     // auto patch 904
//     // if (Platform.isAndroid) {
//     //   return;
//     // }
//     try {
//       jcRizhi("==PBFireBbbbbb==initFirebase====");
//       FirebaseApp firebaseApp = await Firebase.initializeApp();
//       jcRizhi(
//         "==PBFireBbbbbb==initFirebase===firebaseApp:${firebaseApp.toString()}=",
//       );
//       FlutterError.onError =
//           FirebaseCrashlytics.instance.recordFlutterFatalError;
//       PlatformDispatcher.instance.onError = (error, stack) {
//         // printInDebug(() => "[FiabseUtils]: crash: $error, $stack");
//         FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//         return true;
//       };
//       // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
//       FirebaseRemoteConfig.instance.onConfigUpdated.listen((event) async {
//         await FirebaseRemoteConfig.instance.activate();
//         jcRizhi(
//           "===PBFireBbbbbb.instance.onConfigUpdated.listen=====$event=",
//         );
//         // Use the new huanjing values here.
//       });
//       await _yuancheng();
//     } catch (e) {
//       jcRizhi("==PBFireBbbbbb==initFirebase===error:$e");
//     }
//   }
//
//   _yuancheng() async {
//     try {
//       jcRizhi("==PBFireBbbbbb=====remote ensureInitialized");
//       await FirebaseRemoteConfig.instance.ensureInitialized();
//       // auto patch 99
//       jcRizhi("==PBFireBbbbbb=====remote fetchAndActivate");
//       await FirebaseRemoteConfig.instance.fetchAndActivate();
//       // auto patch 393
//       // AbaoUtils().runme();
//       update.sink.add(true);
//     } catch (e) {
//       // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//     }
//     jcRizhi("==PBFireBbbbbb=====remote end");
//   }
// }
