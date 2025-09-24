import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QXuanfu {
  OverlayEntry? _xuanfu;

  void show({
    required BuildContext context,
    required Widget child,

  }) {
    _xuanfu = null;
    _xuanfu = OverlayEntry(

      builder: (context) {
        return Xuanfu(child: child);

      },
    );
    Overlay.of(context).insert(_xuanfu!);
  }

  void close() {
    _xuanfu?.remove();
    _xuanfu = null;
  }
}

class Xuanfu extends StatefulWidget {
  const Xuanfu({super.key, required this.child});

  final Widget child;

  @override
  State<Xuanfu> createState() => _XuanfuState();
}

class _XuanfuState extends State<Xuanfu> {
  final double _xS = 0.15;
  final double _yS = 0.2;
  late Timer _timer;
  double _top = 100.h; //悬浮窗距屏幕或父组件顶部的距离
  double _left = ScreenUtil().screenWidth - 72.h; //悬浮窗距屏幕或父组件左侧的距离

  double _width = 0;
  double _height = 0;

  // 是否向右移动
  bool xRightDirection = true;

  // 是否向下移动
  bool yDownDirection = true;
  int milliseconds = 2100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _left =  _left * Random().nextDouble(); //悬浮窗距屏幕或父组件左侧的距离
    _top =  300.h * Random().nextDouble(); //悬浮窗距屏幕或父组件顶部的距离
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _update();
      _timer = Timer.periodic(Duration(milliseconds: 2000), (timer) {
        _update();
      });
    });
  }

  _update() {
    setState(() {
      if (xRightDirection) {
        _left = _width * _xS + _left;
        if (_left >= _width - 50) {
          _left = _width - 100;

          xRightDirection = false;
        }
      } else {
        _left = _left - _width * _xS;
        if (_left <= 0) {
          _left = 0;
          xRightDirection = true;
        }
      }

      if (yDownDirection) {
        _top = _height * _yS + _top;

        if (_top >= _height) {
          _top = _height - 100;
          yDownDirection = false;
        }
      } else {
        _top = _top - _height * _yS;
        if (_top <= 0) {
          _top = 0;
          yDownDirection = true;
        }
      }

      // if (_top >= _height) {
      //   _top = _top - _height * _transformScale;
      // } else {
      //   _top = _height * _transformScale + _top;
      // }

      // debugPrint("_top:$_top _left:$_left _width:$_width _height:$_height");
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double width = constraint.maxWidth;
        double maxHeight = constraint.maxHeight;
        _width = width;
        _height = maxHeight;
        return Stack(
          children: [
            AnimatedPositioned(
              left: _left,
              top: _top,
              duration: Duration(milliseconds: milliseconds + 500),
              curve: Curves.linear,
              child: widget.child,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }
}
