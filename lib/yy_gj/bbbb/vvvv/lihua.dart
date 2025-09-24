
import 'package:flutter/material.dart';
import 'package:spine_flutter/spine_flutter.dart';

import '../../../gen/assets.gen.dart';




class SpinePigLihua extends StatelessWidget {
  const SpinePigLihua({super.key});

  @override
  Widget build(BuildContext context) {

    reportLeaks();
    final controller = SpineWidgetController(onInitialized: (controller) {
      // Set the default mixing time between animations
      controller.animationState.getData().setDefaultMix(0.2);
      // Set the portal animation on track 0
      controller.animationState.setAnimationByName(0, "show3", true);
      // Queue the run animation after the portal animation
      // controller.animationState.addAnimationByName(0, "run", true, 0);
    });

    return SpineWidget.fromAsset(Assets.sss.lihua.flyPokerAtlas, Assets.sss.lihua.flyPokerJson, controller);
  }
}