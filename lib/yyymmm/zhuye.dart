import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz123/yyymmm/dt_tttt/dati_ttt.dart';
import 'package:quiz123/yyymmm/zhuye_controller.dart';

class Zhuye extends StatefulWidget {
  const Zhuye({super.key});

  @override
  State<Zhuye> createState() => _ZhuyeState();
}

class _ZhuyeState extends State<Zhuye> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(ZhuyeController());
  }

  List<Widget> pages() {
    return [DtPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Obx(() {
          int curIndex = ZhuyeController.to.curIndex.value;

          return Stack(
            children: [Positioned.fill(child: IndexedStack(children: pages(),index: curIndex,))],
          );
        }),
      ),
    );
  }
}
