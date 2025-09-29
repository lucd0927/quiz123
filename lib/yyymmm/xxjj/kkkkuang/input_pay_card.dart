import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/view/jc_text_border.dart';
import 'package:quiz123/view/jc_ts_kuang.dart';
import 'package:quiz123/yy_gj/bbbb/kkkkuang/money_ccc.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';
import 'package:quiz123/yyymmm/xxjj/xj_ddd_controller.dart';

import '../../../gen/assets.gen.dart';
import '../../../jichu_kuang/jichu_kuang.dart';

showInputPayCard(
  BuildContext context, {
  required VoidCallback onBtn,
  required VoidCallback onClose,
  required double money,
}) {
  return jcKuang(
    context: context,
    child: InputPayCard(
      onClose: () {},
      onSubmit: (data) {
        jcRizhi("===cardId:$data===");
        if (data is String && data.isNotEmpty) {
          jcTsDialog(text: "Congratulations on your successful withdrawal. Your money has arrived.");
          XjDddController.to.setSsssavePayCardId(data);
          XjDddController.to.setSssavemoney(money);
          XjDddController.to.setSssavePayCarddddd();
          XjDddController.to.chushiTixianRenwu();
          DtController.to.subDatiCoin(money);

        }
      },
    ),
  );
}

class InputPayCard extends StatefulWidget {
  const InputPayCard({
    super.key,
    required this.onClose,
    required this.onSubmit,
  });

  final VoidCallback onClose;
  final DynamicCallback onSubmit;

  @override
  State<InputPayCard> createState() => _InputPayCardState();
}

class _InputPayCardState extends State<InputPayCard> {
  String cardId = "";

  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  late VoidCallback textEditListener;

  late VoidCallback focusListener;

  double topHeight = 150.h;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditListener = () {
      TextEditingValue textEditingValue = textEditingController.value;

      // bool focusNode.hasFocus;
    };
    focusListener = () {
      debugPrint(
        "===focusListener===focusNode.hasFocus:${focusNode.hasFocus}==",
      );
      if (mounted) {
        setState(() {
          if (focusNode.hasFocus) {
            topHeight = 52.h;
          } else {
            topHeight = 150.h;
          }
        });
      }
    };
    textEditingController.addListener(textEditListener);
    focusNode.addListener(focusListener);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(
              height: topHeight,
              duration: Duration(milliseconds: 320),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    widget.onClose();
                  },
                  child: Image.asset(
                    Assets.ttt.close.path,
                    width: 20.h,
                    height: 20.h,
                  ),
                ),
                SizedBox(width: 30.w),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              width: 324.w,
              height: 435.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffD9F4DA), Color(0xffffffff)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16.w),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50.h,
                    child: Center(
                      child: Text(
                        "Cash Out",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  Wrap(
                    spacing: 14.w,
                    runSpacing: 12.h,
                    children: [
                      _cardItem(payType: EnumPayType.paypal),
                      _cardItem(payType: EnumPayType.cashapp),
                      _cardItem(payType: EnumPayType.pagbank),
                      _cardItem(payType: EnumPayType.amazon),
                      _cardItem(payType: EnumPayType.gpay),
                      _cardItem(payType: EnumPayType.webmoney),
                      _cardItem(payType: EnumPayType.mastercard),
                    ],
                  ),

                  _inpute(),
                  _btnSubmit(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  _inpute() {
    return Container(
      margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
      width: 294.w,
      height: 60.h,
      padding: EdgeInsets.only(left: 12.w, right: 12.w),
      decoration: BoxDecoration(
        color: Color(0xffffffff).withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(
          color: Color(0xff000000).withValues(alpha: 0.06),
          width: 1.w,
        ),
      ),
      child: Center(
        child: TextField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration.collapsed(
            hintText: "Please Input Your Account ID",
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000).withValues(alpha: 0.2),
            ),
          ),
          keyboardType: TextInputType.text,
          onChanged: (text) {
            cardId = text;
          },
        ),
      ),
    );
  }

  _btnSubmit() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        widget.onSubmit(cardId);
      },
      child: Container(
        width: 294.w,
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xff007F00),
          borderRadius: BorderRadius.circular(6.w),
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.02),
            width: 1.w,
          ),
        ),

        child: Text(
          "Submit",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _cardItem({required EnumPayType payType}) {
    String curSelect = XjDddController.to.curPayCard.value;
    bool select = payType.name == curSelect;
    String icon = XjDddController.to.payIconWithPayName(payType.name);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      width: 140.w,
      height: 50.h,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              XjDddController.to.curPayCard.value = payType.name;
            },
            child: Container(
              width: 140.w,
              height: 50.h,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Image.asset(
                icon,
                width: 120.w,
                height: 30.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          if (select)
            Positioned(
              right: 4.w,
              top: 4.w,
              child: Image.asset(
                Assets.bbb.tixianSelect.path,
                width: 18.h,
                height: 18.h,
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();
    focusNode.removeListener(focusListener);
    textEditingController.removeListener(textEditListener);
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }
}
