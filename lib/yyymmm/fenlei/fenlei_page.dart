import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/view/jc_jindutiao.dart';
import 'package:quiz123/yyymmm/fenlei/fenlei_controller.dart';

import '../../gen/assets.gen.dart';
import '../dt_tttt/dt_controller.dart';

class FenleiPage extends StatefulWidget {
  const FenleiPage({super.key});

  @override
  State<FenleiPage> createState() => _FenleiPageState();
}

class _FenleiPageState extends State<FenleiPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          item(type: EnumLeixinType.dailyLife),
          item(type: EnumLeixinType.nature),
          item(type: EnumLeixinType.science),
          item(type: EnumLeixinType.math),
          item(type: EnumLeixinType.animal),
        ],
      ),
    );
  }

  item({required EnumLeixinType type}) {
    String icon = Assets.ttt.leixingItemHistory.path;
    if (type == EnumLeixinType.dailyLife) {
      icon = Assets.ttt.leixingItemHistory.path;
    } else if (type == EnumLeixinType.nature) {
      icon = Assets.ttt.leixingItemNature.path;
    } else if (type == EnumLeixinType.science) {
      icon = Assets.ttt.leixingItemScience.path;
    } else if (type == EnumLeixinType.math) {
      icon = Assets.ttt.leixingItemMath.path;
    } else if (type == EnumLeixinType.animal) {
      icon = Assets.ttt.leixingItemAnimal.path;
    }
    int? curIndex = DtController.to.datiLeixingIndex(type);
    if (curIndex == null) {
      curIndex = 0;
    } else {
      curIndex = curIndex + 1;
    }
    int allIndex = DtController.to.datiLeixingAllLengt(type);
    jcRizhi("=typeL$type==curIndex:$curIndex=allIndex:$allIndex");
    double progress = curIndex / allIndex;

    return Container(
      width: double.infinity,
      height: 93.h,
      margin: EdgeInsets.only(bottom: 10.h),
      child: Stack(
        children: [
          Image.asset(
            Assets.ttt.leixingItemBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),

          Row(
            children: [
              SizedBox(width: 16.w),

              Image.asset(icon, width: 48.w, height: 48.w),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${type.name}",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18.sp,
                        color: Color(0xff902900),
                        height: 1,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    JCJingdutiao(
                      height: 11.h,
                      innerHeight: 11.h,
                      gradientColors: [
                        Color(0xffA0FFD6),
                        Color(0xff00CA11),
                        Color(0xffA0FFD6),
                      ],
                      bgColor: Color(0xffffffff),
                      text: "",
                      width: 154.w,
                      progress: progress,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              GestureDetector(
                onTap: () {
                  FenleiController.to.onClick(type: type);
                },
                child: Container(
                  width: 120.w,
                  height: double.infinity,
                  color: Colors.green.withValues(alpha: 0),
                  child: Center(
                    child: Image.asset(
                      Assets.ttt.leixingItemBtn.path,
                      width: 97.w,
                      height: 36.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
