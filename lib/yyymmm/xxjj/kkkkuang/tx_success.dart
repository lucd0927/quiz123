// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:quiz123/yyymmm/xxjj/xj_ddd_controller.dart';
// import 'package:tuple/tuple.dart';
//
// import '../../../jichu_kuang/jichu_kuang.dart';
//
// showCashOutTaskSuccessfulDialogB(
//   BuildContext context, {
//   required double money,
// }) {
//   return jcKuang(
//     context: context,
//     child: CashOutTaskSuccessful(money: money),
//   );
// }
//
// class CashOutTaskSuccessful extends StatelessWidget {
//   const CashOutTaskSuccessful({super.key, required this.money});
//
//   final double money;
//
//   @override
//   Widget build(BuildContext context) {
//     String now_stage = XjDddController.to.now_stage();
//     double progress = 0;
//     Tuple2 item = Tuple2(0, 15);
//     int curCount = item.item1;
//     int allCount = item.item2;
//     Widget itemWidget = Text.rich(
//       TextSpan(
//         text: "Your withdrawal amount has been issued and will arrive in",
//         children: [
//           TextSpan(
//             text: " 3-5 ",
//             style: TextStyle(color: Color(0xff2DA027)),
//           ),
//
//           TextSpan(text: "working days. Please check your account"),
//         ],
//       ),
//       style: TextStyle(
//         fontWeight: FontWeight.w700,
//         fontSize: 15.sp,
//         color: Color(0xff770000),
//       ),
//     );
//
//     progress = curCount / allCount;
//     progress = progress.toPrecision(4);
//     progress = progress * 100;
//     return Center(
//       child: Stack(
//         children: [
//           Container(width: 320.w, height: 363.h, color: Colors.green),
//           Positioned(
//             left: 0,
//             right: 0,
//             top: 0,
//             bottom: 0,
//             child: Container(
//               // color: Colors.red.withOpacity(0.2),
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 72.h),
//
//                   Container(
//                     // color: Colors.red,
//                     child: MoneyCategoryWidget(
//                       money: '$money',
//                       moneyIcon: CashController.to.icon,
//                       height: 80.h,
//                       width: (80 * 104 / 58).h,
//                     ),
//                   ),
//
//                   Container(
//                     decoration: BoxDecoration(
//                       // color: Color(0xffF9D899),
//                       borderRadius: BorderRadius.circular(4.w),
//                     ),
//                     padding: EdgeInsets.only(
//                       top: 20.h,
//                       bottom: 20.h,
//                       left: 24.w,
//                       right: 24.h,
//                     ),
//
//                     child: itemWidget,
//                   ),
//                   // SizedBox(height: 16.h),
//                   InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Stack(
//                       children: [
//                         Container(
//                           width: 229.w,
//                           height: 54.h,
//                           color: Colors.black,
//                         ),
//                         Positioned(
//                           top: 0,
//                           bottom: 0.w,
//                           right: 0.w,
//                           left: 0,
//                           child: Center(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SizedBox(width: 4.w),
//                                 MedaFontWidget(
//                                   text: "I Know",
//                                   foreground: Color(0xff003508),
//                                 ),
//                                 SizedBox(width: 4.w),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 24.h),
//                 ],
//               ),
//             ),
//           ),
//
//           Positioned(
//             right: 0,
//             top: 40.h,
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 width: 50.h,
//                 height: 50.h,
//                 color: Colors.red.withValues(alpha: 0),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
