// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.327901
import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import 'rizhi.dart';

class JCFbase {
  // auto patch 391
  static final JCFbase _instance = JCFbase._();

  JCFbase._();

  factory JCFbase() => _instance;

  final update = StreamController<bool>.broadcast();

  String by({required String name}){
    try{

      String data =  FirebaseRemoteConfig.instance.getString(name);
      jcRizhi("==JCFbase==by==name:$name==:$data==");
      return data;

    }catch(e){
      jcRizhi("==JCFbase==by==name:$name==error:$e");
      return "";
    }
  }

  Future<void> chushi() async {

    try {
      jcRizhi("==JCFbase==initFirebase====");
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      jcRizhi(
        "==JCFbase==initFirebase===firebaseApp:${firebaseApp.toString()}=",
      );
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      PlatformDispatcher.instance.onError = (error, stack) {
        // printInDebug(() => "[FiabseUtils]: crash: $error, $stack");
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      FirebaseRemoteConfig.instance.onConfigUpdated.listen((event) async {
        await FirebaseRemoteConfig.instance.activate();
        jcRizhi(
          "===JCFbase.instance.onConfigUpdated.listen=====$event=",
        );
        // Use the new huanjing values here.
      });
      await _yuancheng();
    } catch (e) {
      jcRizhi("==JCFbase==initFirebase===error:$e");
    }
  }

  _yuancheng() async {
    try {
      jcRizhi("==JCFbase=====remote ensureInitialized");
      await FirebaseRemoteConfig.instance.ensureInitialized();
      // auto patch 99
      jcRizhi("==JCFbase=====remote fetchAndActivate");
      bool result = await FirebaseRemoteConfig.instance.fetchAndActivate();
      jcRizhi("==JCFbase=====remote fetchAndActivate result:$result");
      await FirebaseRemoteConfig.instance.activate();
      // auto patch 393
      // AbaoUtils().runme();
      update.sink.add(true);
    } catch (e) {
      jcRizhi("==JCFbase=====remote  error:$e");
      // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
    String qs_af_on123 = JCFbase().by(name: "qs_adjust_on");
    jcRizhi("=JCFbase=qs_af_on123==$qs_af_on123");
    jcRizhi("==JCFbase=====remote end");
  }
}
