// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.334280
import 'dart:async';

import 'package:flutter/material.dart';

class JcAnimatedScale extends StatefulWidget {
  const JcAnimatedScale({
    super.key,
    required this.child,
    this.milliseconds = 1000,
    this.maxScale = 1.0,
    this.minScale = 0.8,
  });

  final Widget child;
  final int? milliseconds;
  final double? minScale;
  final double? maxScale;

  @override
  State<JcAnimatedScale> createState() => _JcAnimatedScaleState();

}


class _JcAnimatedScaleState extends State<JcAnimatedScale> {
  double scale = 1;

  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    double minScale = widget.minScale ?? 0.9;
    double maxScale = widget.maxScale ?? 1;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          scale = minScale;
        });
      }
      _timer = Timer.periodic(
        Duration(milliseconds: widget.milliseconds ?? 5000),
        (timer) {
          setState(() {
            if (scale == maxScale) {
              scale = minScale;
            } else {
              scale = maxScale;
            }
          });

        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      curve: Curves.linear,
      scale: scale,
      duration: Duration(milliseconds: widget.milliseconds ?? 5000),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _timer?.cancel();
    super.dispose();

  }
// auto patch 865
}    
