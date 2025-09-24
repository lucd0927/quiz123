import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/view/jc_ts_kuang.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../gen/assets.gen.dart';

class SzPage extends StatefulWidget {
  const SzPage({super.key, required this.showBack});

  final bool showBack;

  @override
  State<SzPage> createState() => _SzPageState();
}

class _SzPageState extends State<SzPage> {
  @override
  Widget build(BuildContext context) {
    Widget child = Stack(
      children: [
        Image.asset(
          Assets.ttt.zhuyeBg.path,
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          fit: BoxFit.fill,
        ),
        Column(
          children: [
         widget.showBack?   Container(
              height: 100.h,
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      SizedBox(width: 16.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          Assets.ttt.settingBack.path,
                          width: 34.h,
                          height: 34.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ):Container(height: 80.h,),
            settingItem(
              icon: Assets.ttt.settingAbout.path,
              text: "Privacy Policy",
              onTap: () {
                Uri uri = Uri.parse('https://quizsparkitem.com/privacy/');
                qidongU(uri);
              },
            ),
            settingItem(
              icon: Assets.ttt.settingTerm.path,
              text: "Term Of User",
              onTap: () {
                Uri uri = Uri.parse('https://quizsparkitem.com/terms/');
                qidongU(uri);
              },
            ),
            settingItem(
              icon: Assets.ttt.settingContact.path,
              text: "Contact Us",
              onTap: () {
                qidongE();
              },
            ),
          ],
        ),
      ],
    );
    if (widget.showBack) {
      return child;
    }
    return Scaffold(body: child);
  }

  Future<void> qidongU(
    Uri uri, {
    LaunchMode mode = LaunchMode.platformDefault,
  }) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> qidongE() async {
    final Uri emial = Uri(
      scheme: 'mailto',
      path: 'fmmkelxf5522@outlook.com',
      queryParameters: {'subject': '', 'body': ''},
    );

    if (await canLaunchUrl(emial)) {
      await launchUrl(emial);
    } else {
      jcTsDialog(text: "No Mail app can be opened");
    }
  }

  settingItem({
    required String icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 60.h,
        width: 333.w,
        margin: EdgeInsets.only(bottom: 10.h),
        color: Colors.amber.withValues(alpha: 0),
        child: Stack(
          children: [
            Container(
              color: Colors.amber.withValues(alpha: 0),
              child: Image.asset(
                Assets.ttt.settingItemBg.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 6.h,
              top: 0,
              child: Center(
                child: Container(
                  color: Colors.green.withValues(alpha: 0),
                  height: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(width: 16.w),
                      Image.asset(icon, width: 24.w, height: 24.w),
                      SizedBox(width: 8.w),
                      Text(
                        text,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        Assets.ttt.settingNext.path,
                        width: 12.h,
                        height: 12.h,
                      ),
                      SizedBox(width: 16.w),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
