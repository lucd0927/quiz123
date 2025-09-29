import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:quiz123/gen/assets.gen.dart';
import 'package:quiz123/hive/jc_hive.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/yy_gj/bbbb/shuzhishuju.dart';
import 'package:tuple/tuple.dart';

class XjDddController extends GetxController {
  static XjDddController get to => Get.find();

  static const String hkSelectPayCard = "hkSelectPayCard";

  var box = JCHive.box;

  var curPayCard = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    String tmpPayCard = box.get(hkSelectPayCard) ?? EnumPayType.paypal.name;
    curPayCard = tmpPayCard.obs;
  }

  topPayIcon({required EnumPayType payType}) {
    return topPayIconWithPayName(payType.name);
  }

  String topPayIconWithPayName(String payName) {
    String icon = Assets.bbb.xjPaypal.path;
    if (payName == EnumPayType.paypal.name) {
      icon = Assets.bbb.xjPaypal.path;
    } else if (payName == EnumPayType.pagbank.name) {
      icon = Assets.bbb.xjPagbank.path;
    } else if (payName == EnumPayType.cashapp.name) {
      icon = Assets.bbb.xjCashapp.path;
    } else if (payName == EnumPayType.amazon.name) {
      icon = Assets.bbb.xjAmazon.path;
    } else if (payName == EnumPayType.gpay.name) {
      icon = Assets.bbb.xjGpay.path;
    } else if (payName == EnumPayType.webmoney.name) {
      icon = Assets.bbb.xjWebmoney.path;
    } else if (payName == EnumPayType.mastercard.name) {
      icon = Assets.bbb.xjMastercard.path;
    }

    return icon;
  }

  String curPayCardIdWithBottom() {
    String payName = curPayCard.value;
    String icon = Assets.bbb.xjBottomPaypal.path;
    if (payName == EnumPayType.paypal.name) {
      icon = Assets.bbb.xjBottomPaypal.path;
    } else if (payName == EnumPayType.pagbank.name) {
      icon = Assets.bbb.xjBottomPagbank.path;
    } else if (payName == EnumPayType.cashapp.name) {
      icon = Assets.bbb.xjBottomCash.path;
    } else if (payName == EnumPayType.amazon.name) {
      icon = Assets.bbb.xjBottomAmazon.path;
    } else if (payName == EnumPayType.gpay.name) {
      icon = Assets.bbb.xjBottomGpay.path;
    } else if (payName == EnumPayType.webmoney.name) {
      icon = Assets.bbb.xjBottomWebmoney.path;
    } else if (payName == EnumPayType.mastercard.name) {
      icon = Assets.bbb.xjBottomMastercard.path;
    }

    return icon;
  }

  onTxFun({required double money}) {}

  static const hkXjRenwu = "dshhgsaewrewrew";

  static const hkWanchengRenwu = "kajsdlkhsdflkl;sdkfjklhsdkjs";

  // 所有任务完成进度
  allStageTaskCompleted() {
    int alskdjflkasjdf = box.get(hkWanchengRenwu) ?? 0;
    alskdjflkasjdf = alskdjflkasjdf + 1;
    box.put(hkWanchengRenwu, alskdjflkasjdf);
    if (alskdjflkasjdf == 1) {}

    jcRizhi("===resetQuestionProcess===:${box.get(hkXjRenwu)}");
  }

  bool hasCompletedAllTask() {
    int result = box.get(hkWanchengRenwu) ?? 0;
    return result != 0;
  }

  bool hasInitWithdrawTask() {
    bool init = false;
    var data = box.get(hkXjRenwu);
    init = data != null;
    return init;
  }

  chushiTixianRenwu() {
    String key = hkXjRenwu;

    var sdfgdsgsdsdf = {
      // 第一的阶段   - -刮XX张卡
      "stage_1": {
        "task_1": {
          "allCount": 15,
          "curCount": 0,
          "type": "pop",
          "text": ["Answer", "question correctly"],
        },
        "now_task": "task_1",
        "des": "Complete the task, cash out immediately",
      },

      // 第二阶段       - 提现排队弹窗
      "stage_2": {
        "task_1": {
          "allCount": 388,
          "curCount": 99,
          "type": "wheel",
          "text": ["${"Your Current rank"}: ", ""],
        },
        "now_task": "task_1",
        "des": "Congratulations, You are in the withdrawal approval queue.",
      },
      // 第三阶段
      "stage_3": {
        "task_1": {
          "allCount": ShuzhiShuju.tixian_task()[0],
          "curCount": 0,
          "text": ["Answer", "question right"],
        },
        "task_2": {
          "allCount": ShuzhiShuju.tixian_task()[1],
          "curCount": 0,
          "text": ["Open", "Gift Box"],
        },
        "task_3": {
          "allCount": ShuzhiShuju.tixian_task()[2],
          "curCount": 0,
          "text": ["Play", "Spins"],
        },
        "task_4": {
          "allCount": ShuzhiShuju.tixian_task()[3],
          "curCount": 0,
          "text": ["Collect", "Cash Pops"],
        },
        "task_5": {
          "allCount": ShuzhiShuju.tixian_task()[4],
          "curCount": 0,
          "text": ["Answer", "question right"],
        },
        "task_6": {
          "allCount": ShuzhiShuju.tixian_task()[5],
          "curCount": 0,
          "text": ["Open", "Gift Box"],
        },
        "task_7": {
          "allCount": ShuzhiShuju.tixian_task()[6],
          "curCount": 0,
          "text": ["Play", "Spins"],
        },
        "task_8": {
          "allCount": ShuzhiShuju.tixian_task()[7],
          "curCount": 0,
          "text": ["Collect", "Cash Pops"],
        },
        "task_9": {
          "allCount": ShuzhiShuju.tixian_task()[8],
          "curCount": 0,
          "text": ["Answer", "question right"],
        },

        "now_task": "task_1",
        "des": "Only one step away from successful withdrawal",
      },
      "now_stage": "stage_1",
    };

    box.put(key, sdfgdsgsdsdf);
    jcRizhi("initQuestionProcessWithMoneyLevel key:$key");
  }

  String now_stage() {
    String now_stage = "stage_1";

    String key = hkXjRenwu;
    var keyData = box.get(key);
    if (keyData == null) {
      return now_stage;
    }
    now_stage = keyData['now_stage'] ?? "stage_1";
    jcRizhi("now_stage ==hive 中存储的提现档位为： now_stage:$now_stage");
    return now_stage;
  }

  // item1 当前数量
  // item2 总的数量
  // 对应的文本
  // 当前阶段的描述
  Tuple4<int, int, List<String>, String> stage_1() {
    String key = hkXjRenwu;
    var data = box.get(key);
    jcRizhi("stage_1 hive 中存储的提现档位为1：data:${data}");

    var stageData = data['stage_1'];
    String now_task_name = stageData['now_task'];
    String des = stageData?['des'] ?? "";
    var taskData = stageData[now_task_name];
    int allCount = taskData?['allCount'] ?? 20;
    int curCount = taskData?['curCount'] ?? 0;

    List<String> texts = taskData?['text'] ?? ["", ""];

    return Tuple4(curCount, allCount, texts, des);
  }

  // item1 当前数量
  // item2 总的数量
  // 对应的文本
  // 当前阶段的描述
  Tuple4<int, int, List<String>, String> stage_2() {
    String key = hkXjRenwu;
    var data = box.get(key);
    jcRizhi("stage_2 hive 中存储的提现档位为1：data:${data}");

    var stageData = data['stage_2'];
    String now_task_name = stageData['now_task'];
    String des = stageData?['des'] ?? "";
    var taskData = stageData[now_task_name];
    int allCount = taskData?['allCount'] ?? 20;
    int curCount = taskData?['curCount'] ?? 0;

    List<String> texts = taskData?['text'] ?? ["", ""];

    return Tuple4(curCount, allCount, texts, des);
  }

  // item1 当前数量
  // item2 总的数量
  // 对应的文本
  // 当前阶段的描述
  Tuple4<int, int, List<String>, String> stage_3() {
    String key = hkXjRenwu;
    var data = box.get(key);
    jcRizhi("stage_3 hive 中存储的提现档位为1：data:${data}");

    var stageData = data['stage_3'];
    String now_task_name = stageData['now_task'];
    String des = stageData?['des'] ?? "";
    var taskData = stageData[now_task_name];
    int allCount = taskData?['allCount'] ?? 20;
    int curCount = taskData?['curCount'] ?? 0;

    List<String> texts = taskData?['text'] ?? ["", ""];

    return Tuple4(curCount, allCount, texts, des);
  }

  String curStageTaskName(String curStage) {
    String key = hkXjRenwu;
    var data = box.get(key);
    jcRizhi("========curStageTaskName：data:${data}");

    var stageData = data[curStage];
    String now_task_name = stageData['now_task'] ?? "";
    return now_task_name;
  }

  // 记录不同层次money的进度
  recordCashStageTaskProcess({required EnumXjjjjLx type}) {
    String key = hkXjRenwu;

    var saveJieduanShuju = box.get(key);
    jcRizhi("recordCashStageTaskProcess  数据data:${saveJieduanShuju == null}");

    if (saveJieduanShuju == null) {
      return;
    }
    String cur_jieduan = saveJieduanShuju['now_stage'] ?? "stage_1";
    jcRizhi(
      "recordCashStageTaskProcess ==hive 中存储的提现档位为3：now_stage:$cur_jieduan ",
    );
    var jieduanShuju = saveJieduanShuju[cur_jieduan];
    if (type == EnumXjjjjLx.dtQuizzzz) {
      if (cur_jieduan == "stage_1") {
        String now_task_name = jieduanShuju['now_task'] ?? "task_1";

        var nowTask = jieduanShuju[now_task_name];
        int allCount = nowTask['allCount'];
        int curCount = nowTask['curCount'];

        if (now_task_name == "task_1") {
          // curCount = allCount + 1;
          curCount = curCount + 1;
          nowTask['curCount'] = curCount;
        }

        if (curCount >= allCount) {
          int maxTaskNum = 1;
          String lastChar = now_task_name[now_task_name.length - 1];
          int taskCount = (int.tryParse(lastChar) ?? 1) + 1;
          if (taskCount > maxTaskNum) {
            taskCount = maxTaskNum;
            curCount = allCount;
            nowTask['curCount'] = curCount;
          } else if (taskCount == maxTaskNum) {}
          jieduanShuju['now_task'] = "task_$taskCount";
          if (now_task_name == "task_$maxTaskNum") {
            // _hasLastTaskInLastStage = true;
            saveJieduanShuju['now_stage'] = "stage_2";
          }
        }
      }
    } else if (type == EnumXjjjjLx.rankkkkk) {
      if (cur_jieduan == "stage_2") {
        String now_task_name = jieduanShuju['now_task'] ?? "task_1";

        var nowTask = jieduanShuju[now_task_name];
        int allCount = nowTask['allCount'];
        int curCount = nowTask['curCount'];

        if (now_task_name == "task_1") {
          int allDelete = ShuzhiShuju.int_all_delete();
          int curDelete = ShuzhiShuju.int_current_delete();
          jcRizhi("=allDelete:$allDelete==curDelete:$curDelete===");

          curCount = curCount - curDelete;
          allCount = allCount - allDelete;
          if (curCount <= 1) {
            curCount = 1;
          }
          if (allCount <= 10) {
            allCount = 10;
          }
          nowTask['curCount'] = curCount;
          nowTask['allCount'] = allCount;
        }

        if (curCount <= 1) {
          int maxTaskNum = 1;
          String lastChar = now_task_name[now_task_name.length - 1];
          int taskCount = (int.tryParse(lastChar) ?? 1) + 1;
          if (taskCount > maxTaskNum) {
            taskCount = maxTaskNum;
            curCount = 1;
            nowTask['curCount'] = curCount;
          } else if (taskCount == maxTaskNum) {}
          jieduanShuju['now_task'] = "task_$taskCount";
          if (now_task_name == "task_$maxTaskNum") {
            // hasLastTaskInStage = true;
            saveJieduanShuju['now_stage'] = "stage_3";
          }
        }
        update();
      }
    }

    if (cur_jieduan == "stage_2") {
      String now_task_name = jieduanShuju['now_task'] ?? "task_1";
      jcRizhi(
        "recordCashStageTaskProcess ==hive 中存储的提现档位为4：now_task_name:$now_task_name ",
      );
      var nowTask = jieduanShuju[now_task_name];
      int allCount = nowTask['allCount'];
      int curCount = nowTask['curCount'];

      //
      if (type == EnumXjjjjLx.dtQuizzzz) {
        if (now_task_name == "task_1" ||
            now_task_name == "task_5" ||
            now_task_name == "task_9") {
          // curCount = allCount + 1;
          curCount = curCount + 1;
          nowTask['curCount'] = curCount;
        }
      } else if (type == EnumXjjjjLx.zppppWheeeel) {
        if (now_task_name == "task_3" || now_task_name == "task_7") {
          // curCount = allCount + 1;
          curCount = curCount + 1;
          nowTask['curCount'] = curCount;
        }
      } else if (type == EnumXjjjjLx.bbbbXianggg) {
        if (now_task_name == "task_2" || now_task_name == "task_6") {
          // curCount = allCount + 1;
          curCount = curCount + 1;
          nowTask['curCount'] = curCount;
        }
      } else if (type == EnumXjjjjLx.qipaoo) {
        if (now_task_name == "task_4" || now_task_name == "task_8") {
          // curCount = allCount + 1;
          curCount = curCount + 1;
          nowTask['curCount'] = curCount;
        }
      }

      if (curCount >= allCount) {
        String lastChar = now_task_name[now_task_name.length - 1];
        int taskCount = (int.tryParse(lastChar) ?? 1) + 1;
        int maxTaskNum = 9;
        if (taskCount > maxTaskNum) {
          taskCount = maxTaskNum;
          curCount = allCount;
          nowTask['curCount'] = curCount;
        } else if (taskCount == maxTaskNum) {}
        jieduanShuju['now_task'] = "task_$taskCount";
        if (now_task_name == "task_$maxTaskNum") {
          var data = box.get(hkWanchengRenwu);
          if (data == null || true) {
            allStageTaskCompleted();
            // showCongratulationDialog(Get.context!, onSubmit: (){}, onClose: (){});
          }
        }
      }
      update();
    }

    jcRizhi(
      "recordCashStageTaskProcess ==hive 中存储的提现档位为5：keyData:$saveJieduanShuju ",
    );
    box.put(key, saveJieduanShuju);
  }
}

enum EnumXjjjjLx {
  dtQuizzzz, // da答题
  zppppWheeeel, // 转盘
  qipaoo, // 气泡
  bbbbXianggg, //
  rankkkkk, // 阶段1
}

enum EnumPayType {
  paypal("paypal"),
  pagbank("pagbank"),
  cashapp("cashapp"),
  mastercard("mastercard"),
  gpay("gpay"),
  webmoney("webmoney"),
  amazon("amazon");

  const EnumPayType(this.name);

  final String name;
}
