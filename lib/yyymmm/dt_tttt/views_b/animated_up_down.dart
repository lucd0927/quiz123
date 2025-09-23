import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const updownNum = 4;
const shakeDuration = Duration(milliseconds: 5000);

class AnimatedUpDown extends StatefulWidget {
  const AnimatedUpDown({super.key, required this.child});
  final Widget child;
  @override
  State<AnimatedUpDown> createState() => _AnimatedUpDownState();
}

class _AnimatedUpDownState extends State<AnimatedUpDown>
    with TickerProviderStateMixin {
  late final AnimationController _updownC = AnimationController(
    vsync: this,
    duration: shakeDuration,
  );

  updown() {
    _updownC.repeat();
  }

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      updown();
    });
    _updownC.addListener(() {
      // if (_shakeController.status == AnimationStatus.completed) {
      //   _shakeController.reset();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _updownC,
          builder: (context, child) {
            final tmpVv = sin(
              updownNum * 2 * pi * _updownC.value,
            );
            return Transform.translate(
              offset: Offset(0, tmpVv * 8),
              child: child,
            );
          },
          child: widget.child,
        ),
        // CupertinoButton(child: const Text("抖动"), onPressed: shake),
      ],
    );
  }

  @override
  void dispose() {
    _updownC.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}