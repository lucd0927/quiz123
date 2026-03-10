import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quiz123/huanjing/peizhi.dart';
import 'package:quiz123/tools/package.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../wangluo/shijian_baogao.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// 顶层方法（不能在类里）
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   jcRizhi("后台收到 FCM 消息: ${message.messageId}");
//   // 这里可以做数据处理、存储、触发本地通知等
// }
const local_ios = "tzios_count";

const int dingshiTz = 6876;
const int checkTz = 6877;
const int datiTz = 6878;
const int paypalTz = 6879;

@pragma('vm:entry-point')
ntb(NotificationResponse notificationResponse) async {
  WidgetsFlutterBinding.ensureInitialized();
  print(
    '点击通知 notificationTapBackground (${notificationResponse.id}) action tapped: '
    '${notificationResponse.actionId} with'
    ' payload: ${notificationResponse.payload}',
  );
  SharedPreferences sp = await SharedPreferences.getInstance();
  JCTzIossssss().shezhiTzCount(JCTzIossssss().huoquTzCount(sp), sp);
}

class JCTzIossssss {
  static final JCTzIossssss _instance = JCTzIossssss._();

  JCTzIossssss._();

  factory JCTzIossssss() {
    return _instance;
  }

  static bool _clickTz = false;

  static bool get clickTz => _clickTz;

  static String baioti = "";
  static String neirong = "";

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final IOSFlutterLocalNotificationsPlugin _plugin =
      IOSFlutterLocalNotificationsPlugin();

  initNotificationCount() async {
    final String payload = "local";
  }

  List get contents => [
    {
      "title": "Earn money by QuizSpark",
      "content": "💰More than 1,000 users have successfully withdrawn money",
    },
    {
      "title": "Earn money by QuizSpark",
      "content": "🎁Turn your knowledge into cash",
    },
    {
      "title": "Earn money by QuizSpark",
      "content": "🔥Here‘s \$100 for you! Expired after 5 minutes!",
    },
  ];

  void shezhiTzCount(int value, SharedPreferences sp) =>
      sp.setInt(local_ios, value);

  int huoquTzCount(SharedPreferences sp) => sp.getInt(local_ios) ?? 0;

  init() async {
    if(!JCABluoji.isPackageB()){
      return;
    }
    await requestNotificationPermission();

    initNotificationCount();

    jcRizhi("=initNotification====init===");

    const InitializationSettings initSettings = InitializationSettings(
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // 点击通知回调
        jcRizhi("点击通知 onDidReceiveNotificationResponse: ${response.payload}");
        tongsongdianji(response.id);
      },
      onDidReceiveBackgroundNotificationResponse: ntb,
    );
    NotificationAppLaunchDetails? notificationAppLaunchDetails = await _plugin
        .getNotificationAppLaunchDetails();
    jcRizhi(
      "=initNotification====getNotificationAppLaunchDetails==notificationAppLaunchDetails:$notificationAppLaunchDetails=",
    );

    if (notificationAppLaunchDetails != null) {
      NotificationResponse? notificationResponse =
          notificationAppLaunchDetails.notificationResponse;
      bool didNotificationLaunchApp =
          notificationAppLaunchDetails.didNotificationLaunchApp ?? false;
      _clickTz = didNotificationLaunchApp;
      jcRizhi(
        "点击通知 notificationAppLaunchDetails: didNotificationLaunchApp:${didNotificationLaunchApp} id:${notificationResponse?.id} data:${notificationResponse?.payload}",
      );
      if (didNotificationLaunchApp) {
        tongsongdianji(notificationResponse?.id);
      }
    }
    dingshi();

    fcmtongzhi();
    jiesoutz();
  }

  tongsongdianji(int? tuisongid) {
    String payload = "";
    jcRizhi("====tongsongdianji==tzid:$tuisongid==");
    if (tuisongid == dingshiTz) {
      payload = "fix";
    } else if (tuisongid == checkTz) {
      payload = "sign";
    } else if (tuisongid == datiTz) {
      payload = "quiz";
    } else if (tuisongid == paypalTz) {
      payload = "paypel";
    } else {
      payload = "fix";
    }

    JCShijianBaogao.inform_c(payload);

  }

  Future<bool> requestNotificationPermission() async {
    bool result = await Permission.notification.isGranted;

    if (await Permission.notification.isDenied) {
      PermissionStatus permissionStatus = await Permission.notification
          .request();
      result = permissionStatus == PermissionStatus.granted;
    }
    jcRizhi("==requestNotificationPermission=result:$result");
    return result;
  }

  String pushIcon = "tzimg1";

  Future<void> dingshi() async {

    jcRizhi("==initNotification=_repeatNotification=");
    int length = contents.length;
    int random = Random().nextInt(length);
    String baioti = contents[random]['title'];
    String neirong = contents[random]['content'];
    _plugin.periodicallyShowWithDuration(
      dingshiTz,
      JCABluoji.isPackageB() ? baioti : "QuizSpark",
      JCABluoji.isPackageB() ? neirong : "Come join the quiz!",
      Duration(minutes: 25),
    );
    var datiC = [
      "💰Someone just made a successful withdrawal on QuizMind！",
      "🎁Put your knowledge to work and earn money!",
    ];
    _plugin.periodicallyShowWithDuration(
      datiTz,
      JCABluoji.isPackageB() ? "Answer right, Earn Big!" : "QuizSpark",
      JCABluoji.isPackageB()
          ? datiC[Random.secure().nextInt(2)]
          : "Come join the quiz!",
      Duration(minutes: 40),
    );
    _plugin.periodicallyShowWithDuration(
      checkTz,
      JCABluoji.isPackageB() ? "Cash in check daily" : "QuizSpark",
      JCABluoji.isPackageB()
          ? "Sign up now and start earning money effortlessly."
          : "Come join the quiz!",
      Duration(minutes: 60),
    );

    _plugin.periodicallyShowWithDuration(
      paypalTz,
      JCABluoji.isPackageB() ? "Pending withdraw amount" : "QuizSpark",
      JCABluoji.isPackageB()
          ? "\$100 has arrived in your account"
          : "Come join the quiz!",
      Duration(minutes: 80),
    );
  }

  Future<void> fcmtongzhi() async {}

  int unlockId = 805;

  Future<void> jiesoutz() async {}

  Future<bool> checkNotificationPermission() async {
    bool result = await Permission.notification.isGranted;
    jcRizhi("==requestNotificationPermission=result:$result");
    return result;
  }
}
