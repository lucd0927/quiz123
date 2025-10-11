import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/ads/index.dart';
import 'package:quiz123/view/animated_scale.dart';
import 'package:quiz123/yy_gj/bbbb/kkkkuang/money_ccc.dart';
import 'package:quiz123/yy_gj/bbbb/shuzhishuju.dart';
import 'package:quiz123/yy_gj/bbbb/vvvv/spine_newuser.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../jichu_kuang/jichu_kuang.dart';
import '../../../../yy_gj/bbbb/vvvv/rotate.dart';
import 'new_user_claim.dart';

showNewUserDialog(BuildContext context, {required DynamicCallback onBtn}) {
  return jcKuang(
    context: context,
    child: NewUser(
      onOpen: () async{
        await Future.delayed(Duration(milliseconds: 300));
        double money = ShuzhiShuju.new_prize();
        showNewUserClaimDialog(
          context,
          onBtn: (value) async {
            onBtn(value);
          },
          onBtn2: (value) {
            onBtn(value);
          },
          money: money,
        );
      },
    ),
  );
}

class NewUser extends StatefulWidget {
  const NewUser({super.key, required this.onOpen});

  final VoidCallback onOpen;

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  bool hasOpen = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 400.h,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 300.h,
                    height: 350.h,
                    margin: EdgeInsets.only(bottom: 20.h),
                    child: Stack(
                      children: [
                        Image.asset(
                          Assets.bbb.newBg2.path,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Center(
                          child: Container(
                            width: 173.h,
                            height: 155.h,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                hasOpen
                                    ? Container(
                                        width: 173.h,
                                        height: 155.h,
                                        child: SpineNewUser(),
                                      )
                                    : Image.asset(
                                        Assets.bbb.newGift.path,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Center(
                    child: Image.asset(
                      Assets.bbb.newTop.path,
                      width: 364.w,
                      height: 88.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10.h,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        onOpen();
                      },
                      child: Container(
                        width: 213.h,
                        height: 66.h,
                        color: Colors.transparent,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              Assets.bbb.newBtn.path,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              right: 10.w,
                              top: 10.h,
                              child: IgnorePointer(
                                child: JcDonghuaScale(
                                  child: Image.asset(
                                    Assets.ttt.gesture.path,
                                    width: 95.h,
                                    height: 87.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onOpen() async{
    setState(() {
      hasOpen = true;
    });
    await Future.delayed(Duration(milliseconds: 600));
    // setState(() {
    //   hasOpen = false;
    // });
    Navigator.pop(context);
    widget.onOpen();

  }
}
