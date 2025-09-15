import 'package:flutter/material.dart';

jcKuang({
  required BuildContext context,
  required Widget child,
  Color? barrierColor,
}) async {
  double alpha = 0.6;
  bool barrierDismissible = false;
  bool useRootNavigator = true;
  bool useSafeArea = false;
  return await showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    useRootNavigator: useRootNavigator,
    useSafeArea: useSafeArea,
    animationStyle: AnimationStyle(
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 400),
    ),
    barrierColor: barrierColor ?? Colors.black.withValues(alpha: alpha),

    builder: (context) {
      return SafeArea(
        top: false,
        bottom: false,
        child: NoFanhui(
          child: Material(color: Colors.transparent, child: child),
        ),
      );
    },
  );
}

class NoFanhui extends StatelessWidget {
  const NoFanhui({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(canPop: false, child: child);
  }
}
