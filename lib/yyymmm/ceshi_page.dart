// import 'dart:math';
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: DemoPage());
//   }
// }
//
// class DemoPage extends StatefulWidget {
//   const DemoPage({super.key});
//   @override
//   State<DemoPage> createState() => _DemoPageState();
// }
//
// class _DemoPageState extends State<DemoPage> {
//   double progress = 0.6;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Shader 条纹进度条（修正）')),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             StripedShaderProgressBar(
//               percent: progress,
//               height: 28,
//               backgroundColor: Colors.grey.shade300,
//               stripeColor: Colors.blue,
//               stripeWidth: 18,
//               stripeSpacing: 10,
//               stripeAngle: -25,
//               animate: true,
//               animationSpeed: 100,
//             ),
//             const SizedBox(height: 24),
//             Slider(
//               value: progress,
//               onChanged: (v) => setState(() => progress = v),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class StripedShaderProgressBar extends StatefulWidget {
//   final double percent;
//   final double height;
//   final Color backgroundColor;
//   final Color stripeColor;
//   final double stripeWidth;
//   final double stripeSpacing;
//   final double stripeAngle; // degrees
//   final bool animate;
//   final double animationSpeed; // pixels per second
//
//   const StripedShaderProgressBar({
//     super.key,
//     required this.percent,
//     this.height = 20,
//     this.backgroundColor = const Color(0xFFE0E0E0),
//     this.stripeColor = const Color(0xFF2196F3),
//     this.stripeWidth = 16,
//     this.stripeSpacing = 12,
//     this.stripeAngle = -30,
//     this.animate = true,
//     this.animationSpeed = 60,
//   });
//
//   @override
//   State<StripedShaderProgressBar> createState() =>
//       _StripedShaderProgressBarState();
// }
//
// class _StripedShaderProgressBarState extends State<StripedShaderProgressBar>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _ctrl;
//
//   double get _period => widget.stripeWidth + widget.stripeSpacing;
//
//   @override
//   void initState() {
//     super.initState();
//     final secs = max(0.01, _period / max(1, widget.animationSpeed));
//     _ctrl = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: (secs * 1000).toInt()),
//     );
//     if (widget.animate) _ctrl.repeat();
//   }
//
//   @override
//   void didUpdateWidget(covariant StripedShaderProgressBar old) {
//     super.didUpdateWidget(old);
//     if (widget.animate != old.animate ||
//         widget.animationSpeed != old.animationSpeed ||
//         _period != old._period) {
//       _ctrl.dispose();
//       final secs = max(0.01, _period / max(1, widget.animationSpeed));
//       _ctrl = AnimationController(
//         vsync: this,
//         duration: Duration(milliseconds: (secs * 1000).toInt()),
//       );
//       if (widget.animate) _ctrl.repeat();
//     }
//   }
//
//   @override
//   void dispose() {
//     _ctrl.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final percent = widget.percent.clamp(0.0, 1.0);
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(widget.height / 2),
//       child: Container(
//         height: widget.height,
//         color: widget.backgroundColor,
//         child: LayoutBuilder(builder: (context, cons) {
//           final fullW = cons.maxWidth;
//           final visW = fullW * percent;
//           return Align(
//             alignment: Alignment.centerLeft,
//             child: SizedBox(
//               width: visW,
//               height: widget.height,
//               child: AnimatedBuilder(
//                 animation: _ctrl,
//                 builder: (context, _) {
//                   // dx: 0..period，用来偏移 shader 的原点（像素）
//                   final dx = widget.animate ? _ctrl.value * _period : 0.0;
//                   final stripeFrac = widget.stripeWidth / _period;
//                   final angleRad = widget.stripeAngle * pi / 180.0;
//
//                   final gradient = LinearGradient(
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                     colors: [
//                       widget.stripeColor,
//                       widget.stripeColor,
//                       Colors.transparent,
//                       Colors.transparent,
//                     ],
//                     stops: [0.0, stripeFrac, stripeFrac, 1.0],
//                     tileMode: TileMode.repeated,
//                     // 只用 GradientRotation 做旋转
//                     transform: GradientRotation(angleRad),
//                   );
//
//                   return ShaderMask(
//                     blendMode: BlendMode.srcATop,
//                     shaderCallback: (rect) {
//                       // 通过给 createShader 的 rect 做平移（left = -dx）来改变相位
//                       // 宽度多加一个周期，确保平铺不会留空
//                       final shaderRect = Rect.fromLTWH(-dx, 0, rect.width + _period, rect.height);
//                       return gradient.createShader(shaderRect);
//                     },
//                     child: Container(color: widget.stripeColor.withOpacity(0.15)),
//                   );
//                 },
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }