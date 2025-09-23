
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatiTop extends StatefulWidget {
  const DatiTop({super.key});

  @override
  State<DatiTop> createState() => _DatiTopState();
}

class _DatiTopState extends State<DatiTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58.h,
      child: Row(
        children: [
          Container(
            width: 204.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Color(0xffFFC850),
              border: Border.all(color: Color(0xff000000), width: 1.h),
              borderRadius: BorderRadius.circular(8.w),
            ),
          )
        ],
      ),
    );
  }
}
