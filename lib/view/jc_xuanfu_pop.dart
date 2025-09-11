import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JCXuanfuPop {

  ///是否真正显示
  bool get sfXianshi => _sfXianshiing;
  bool _sfXianshiing = false;
  OverlayEntry? _kkkk;


  void show({required BuildContext context, required Widget child}) {
    // if (_isShowing) return;
    _kkkk = null;
    _kkkk = OverlayEntry(
      builder: (context) {
        return DonghuaGundongView(child: child);
      },
    );
    Overlay.of(context).insert(_kkkk!);
    _sfXianshiing = true;
  }

  void close() {
    _sfXianshiing = false;
    _kkkk?.remove();
    _kkkk = null;
  }
}

class DonghuaGundongView extends StatefulWidget {
  const DonghuaGundongView({super.key, required this.child});

  final Widget child;

  @override
  State<DonghuaGundongView> createState() =>
      _DonghuaGundongViewState();
}

class _DonghuaGundongViewState
    extends State<DonghuaGundongView> {
  late Timer _asdfasftimer;
  final double _xTransformScale = 0.15;
  final double _yTransformScale = 0.2;

  bool xRightDirection = true;

  // 是否向下移动
  bool yDownDirection = true;
  int milliseconds = 2000;
  double _dingbuSW = 100.h; //悬浮窗距屏幕或父组件顶部的距离
  double _zuobianSW = ScreenUtil().screenWidth - 72.h; //悬浮窗距屏幕或父组件左侧的距离


  double _width = 0;
  double _height = 0;

  // 是否向右移动


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dingbuSW = 50+200.h*Random().nextDouble(); //悬浮窗距屏幕或父组件顶部的距离
    _zuobianSW = 50+(ScreenUtil().screenWidth - 72.h)*Random().nextDouble(); //悬浮窗距屏幕或父组件左侧的距离
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _gengxin();
      _asdfasftimer = Timer.periodic(Duration(milliseconds: 2000), (timer) {
        _gengxin();
      });
    });
  }

  _gengxin() {
    setState(() {
      if (xRightDirection) {
        _zuobianSW = _width * _xTransformScale + _zuobianSW;
        if (_zuobianSW >= _width - 50) {
          _zuobianSW = _width - 100;

          xRightDirection = false;
        }
      } else {
        _zuobianSW = _zuobianSW - _width * _xTransformScale;
        if (_zuobianSW <= 0) {
          _zuobianSW = 0;
          xRightDirection = true;
        }
      }

      if (yDownDirection) {
        _dingbuSW = _height * _yTransformScale + _dingbuSW;

        if (_dingbuSW >= _height) {
          _dingbuSW = _height - 100;
          yDownDirection = false;
        }
      } else {
        _dingbuSW = _dingbuSW - _height * _yTransformScale;
        if (_dingbuSW <= 0) {
          _dingbuSW = 0;
          yDownDirection = true;
        }
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double maxHeight = constraint.maxHeight;
        double width = constraint.maxWidth;
        _width = width;
        _height = maxHeight;
        return Stack(
          children: [
            AnimatedPositioned(
              left: _zuobianSW,
              top: _dingbuSW,
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
    _asdfasftimer.cancel();
  }
}