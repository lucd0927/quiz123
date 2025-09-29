import 'dart:convert';
import 'dart:math';

import 'package:quiz123/tools/jc_fbase.dart';
import 'package:quiz123/tools/num_floor.dart';
import 'package:quiz123/tools/rizhi.dart';
import 'package:quiz123/yyymmm/dt_tttt/dt_controller.dart';

class ShuzhiShuju {
  static Map<String, dynamic>? _lastdata;

  static List<double> eq_range() {
    _onlineJson();
    _lastdata ??= _bendiData;
    List asdfasfdasf = _lastdata?['eq_range'] ?? [];
    List<double> tmpData = [];
    for (var value in asdfasfdasf) {
      double tmp = value * 1.0;
      tmpData.add(tmp);
    }
    if (tmpData.isEmpty) {
      return [800.0];
    }
    tmpData.add(200.0);
    tmpData.sort((a,b)=>a.compareTo(b));
    return tmpData;
  }

  static double new_prize() {
    _onlineJson();
    _lastdata ??= _bendiData;
    var data = _lastdata?['new_prize'];
    if (data is num) {
      return data * 1.0;
    }
    return 134.0;
  }

  static int int_all() {
    _onlineJson();
    _lastdata ??= _bendiData;
    var tmp_queue_number = _lastdata!["queue_number"];
    if (tmp_queue_number is List && tmp_queue_number.isNotEmpty) {
      return tmp_queue_number[0]['int_all'];
    }
    return 388;
  }

  static int int_all_delete() {
    _onlineJson();
    _lastdata ??= _bendiData;
    var asdjalsfdj = _lastdata!["queue_number"];
    if (asdjalsfdj is List && asdjalsfdj.isNotEmpty) {
      var data = asdjalsfdj[0]['int_all_delete'];

      if (data is List && data.isNotEmpty) {
        int adfafa0 = data[0];
        int asdafd1 = adfafa0;
        if (data.length > 1) {
          asdafd1 = data[1];
        }
        int diff = asdafd1 - adfafa0;
        if (diff <= 0) {
          diff = 1;
        }
        jcRizhi("==index0:$adfafa0====index1:$asdafd1");
        int asdffgsdgewrq = Random().nextInt(diff);
        int result = adfafa0 + asdffgsdgewrq;
        return result;
      }
    }
    return 2;
  }

  static int int_current() {
    _onlineJson();
    _lastdata ??= _bendiData;
    var dfgdsfgdhgtryt = _lastdata!["queue_number"];
    if (dfgdsfgdhgtryt is List && dfgdsfgdhgtryt.length > 1) {
      return dfgdsfgdhgtryt[1]['int_current'];
    }
    return 99;
  }

  static int int_current_delete() {
    _onlineJson();
    _lastdata ??= _bendiData;
    var sdjlkfjghlk = _lastdata!["queue_number"];
    if (sdjlkfjghlk is List && sdjlkfjghlk.length > 1) {
      var data = sdjlkfjghlk[1]['int_current_delete'];

      if (data is List && data.isNotEmpty) {
        int sdfgdsfgsdg0 = data[0];
        int sdfgdfghh1 = sdfgdsfgsdg0;
        if (data.length > 1) {
          sdfgdfghh1 = data[1];
        }
        int asasgfs555 = sdfgdfghh1 - sdfgdsfgsdg0;
        if (asasgfs555 <= 0) {
          asasgfs555 = 1;
        }
        jcRizhi(
          "==index0:$sdfgdsfgsdg0====index1:$sdfgdfghh1 diff:$asasgfs555",
        );
        int fhjfgjfgjfghj = Random().nextInt(asasgfs555);
        int result = sdfgdsfgsdg0 + fhjfgjfgjfghj;
        return result;
      }
    }
    return 6;
  }

  static double _inner_prize(String key, double coin) {
    _onlineJson();
    _lastdata ??= _bendiData;
    double asdfjlkasjfdlas = Random().nextDouble().toAsFixedFloor(2);

    var sfjdlajsfldkPrize = _lastdata!["$key"];
    jcRizhi("=$key==quizPrizeData:${sfjdlajsfldkPrize is List}=");
    if (sfjdlajsfldkPrize is List) {
      double tmpCurMoney = coin;
      for (var action in sfjdlajsfldkPrize) {
        double asdfasfdafs0 = (action['first_number'] ?? 0.0) * 1.0;
        double ghjfghjfgj1 = (action['end_number'] ?? 0.0) * 1.0;
        // jcRizhi("=$key==tmpCurMoney:$tmpCurMoney=diyi:$asdfasfdafs0=dier:$ghjfghjfgj1=",);
        if (asdfasfdafs0 <= tmpCurMoney && tmpCurMoney < ghjfghjfgj1) {
          var prize = action['prize'];
          if (prize is List && prize.isNotEmpty) {
            double ertwert0 = (prize[0] ?? 0) * 1.0;
            double tyuhfjhfj1 = ertwert0;
            if (prize.length > 1) {
              tyuhfjhfj1 = (prize[1] ?? 0) * 1.0;
            }
            double asdfjlasfjd = tyuhfjhfj1 - ertwert0;
            if (asdfjlasfjd <= 0) {
              asdfjlasfjd = 1.0;
            }
            double random = Random().nextDouble() * asdfjlasfjd;
            double result = ertwert0 + random;
            asdfjlkasjfdlas = result;
          }
          break;
        }
      }
    }
    jcRizhi("=$key===tmpPrize:$asdfjlkasjfdlas=");

    asdfjlkasjfdlas = asdfjlkasjfdlas.toAsFixedFloor(2);
    if (asdfjlkasjfdlas <= 0) {
      asdfjlkasjfdlas = 0.01;
    }
    return asdfjlkasjfdlas;
  }

  static double quiz_prize() {
    double coin = DtController.to.curMoney.value;
    return _inner_prize("quiz_prize", coin);
  }

  static double float_prize() {
    double coin = DtController.to.curMoney.value;
    return _inner_prize("float_prize", coin);
  }

  static double box_prize() {
    double coin = DtController.to.curMoney.value;
    return _inner_prize("box_prize", coin);
  }

  static double check_prize() {
    double coin = DtController.to.curMoney.value;
    return _inner_prize("check_prize", coin);
  }

  static List<int> tixian_task() {
    List<int> tmp = [];
    _onlineJson();
    _lastdata ??= _bendiData;
    var tmp_card_range = _lastdata!["tixian_task"];
    if (tmp_card_range is List) {
      tmp_card_range.forEach((value) {
        int number = value['data'];
        tmp.add(number);
      });
    }

    int length = tmp.length;
    if (length < 9) {
      int addNum = 9 - length;
      for (int i = 0; i < addNum; i++) {
        tmp.add(20);
      }
    }
    return tmp;
  }

  static double _ineer_point(String key){
    double tmpasdjalsjdf = 5.0;

    _onlineJson();
    _lastdata ??= _bendiData;
    var data = _lastdata!["wheel_point"];

    var point = data['$key'] ?? tmpasdjalsjdf;
    tmpasdjalsjdf = point;
    return tmpasdjalsjdf;
  }
  static double point_5(){
    return 5.0;
  }

  static double point_10(){
    return 10.0;
  }

  static double point_20(){
    return 20.0;
  }

  static double point_50(){
    return 50.0;
  }

  static double point_80(){
    return 80.0;
  }

  static double wheel_point() {
    double tmpasdjalsjdf = 5.0;

    _onlineJson();
    _lastdata ??= _bendiData;
    var data = _lastdata!["wheel_point"];

    var _point_5 = data['point_5'];
    var _point_10 = data['point_10'];
    var _point_20 = data['point_20'];
    var _point_50 = data['point_50'];
    var _point_80 = data['point_80'];
    int max = 100;
    int random = Random().nextInt(max);
    jcRizhi("=wheelpoint==random:$random===");
    if (random >= (max - _point_5)) {
      tmpasdjalsjdf = point_5();
    } else if (random >= (max - _point_5 - _point_10)) {
      tmpasdjalsjdf = point_10();
    } else if (random >= (max - _point_5 - _point_10 - _point_20)) {
      tmpasdjalsjdf = point_20();
    } else if (random >= (max - _point_5 - _point_10 - _point_20 - _point_50)) {
      tmpasdjalsjdf = point_50();
    } else if (random >=
        (max - _point_5 - _point_10 - _point_20 - _point_50 - _point_80)) {
      tmpasdjalsjdf = point_80();
    }

    return tmpasdjalsjdf;
  }

  static bool intad_point() {
    _onlineJson();
    _lastdata ??= _bendiData;

    var intadPointData = _lastdata!["intad_point"];
    bool showIntad = false;
    if (intadPointData is List) {
      double tmpCurMoney = DtController.to.curMoney.value;

      for (var action in intadPointData) {
        double diyi = (action['first_number'] ?? 0.0) * 1.0;
        double dier = (action['end_number'] ?? 0.0) * 1.0;

        if (diyi <= tmpCurMoney && tmpCurMoney <= dier) {
          double point = (action['point'] ?? 0) * 1.0;
          double random = Random().nextDouble() * 100;
          showIntad = point >= random;
          break;
        }
      }
    }
    jcRizhi("===intad_point=$showIntad");

    // showIntad = false;
    return showIntad;
  }

  static _onlineJson() {
    if (_lastdata != null) {
      return;
    }

    Map<String, dynamic> localJson = _bendiData;

    String asdfasdfasdf = "qs_number";
    try {
      String name = asdfasdfasdf;
      String key = JCFbase().by(name: name);
      Map<String, dynamic> json = jsonDecode(key);
      localJson = json;
      jcRizhi("====ShuzhiShuju===FirebaseUtils:key:$key $name json $json");
    } on Exception catch (e) {
      jcRizhi("====ShuzhiShuju===onlineJson error:$e");
    }
    _lastdata = localJson;
    jcRizhi("====ShuzhiShuju===FirebaseUtils: ${jsonEncode(localJson)}");
    return localJson;
  }

  static Map<String, dynamic> _bendiData = {
    "eq_range": [800, 1000, 1500, 2000],
    "new_prize": 134, //新用户提现引导弹窗的数值
    "queue_number": [
      //配置排队队列人数的初始值
      {
        "int_all": 388,
        "int_all_delete": [1, 3],
      },
      {
        "int_current": 99,
        "int_current_delete": [5, 8],
      },
    ],
    "intad_point": [
      //配置关闭场景出插屏广告的概率 --新老用户弹窗、激励弹窗、转盘场景
      {"first_number": 0, "point": 0, "end_number": 300},
      {"first_number": 300, "point": 50, "end_number": 600},
      {"first_number": 600, "point": 80, "end_number": 700},
      {"first_number": 700, "point": 100, "end_number": 800},
    ],
    "quiz_prize": [
      {
        "first_number": 0,
        "prize": [
          10, 20, //取【10,20】区间的随机数,保留2位小数
        ],
        "end_number": 300,
      },
      {
        "first_number": 300,
        "prize": [
          5, 10, //取【5,10】区间的随机数,保留2位小数
        ],
        "end_number": 600,
      },
      {
        "first_number": 600,
        "prize": [
          3, 5, //取【3,5】区间的随机数,保留2位小数
        ],
        "end_number": 700,
      },
      {
        "first_number": 700,
        "prize": [
          1, 2, //取【1,2】区间的随机数,保留2位小数
        ],
        "end_number": 800,
      },
    ],
    "float_prize": [
      {
        "first_number": 0,
        "prize": [
          50, 60, //取【30,40】区间的随机数,保留2位小数
        ],
        "end_number": 300,
      },
      {
        "first_number": 300,
        "prize": [
          20, 30, //取【20,30】区间的随机数,保留2位小数
        ],
        "end_number": 600,
      },
      {
        "first_number": 600,
        "prize": [
          5, 10, //取【10,20】区间的随机数,保留2位小数
        ],
        "end_number": 700,
      },
      {
        "first_number": 700,
        "prize": [
          1, 5, //取【10,20】区间的随机数,保留2位小数
        ],
        "end_number": 800,
      },
    ],
    "box_prize": [
      //宝箱奖励数值
      {
        "first_number": 0,
        "prize": [
          30, 40, //取【30,40】区间的随机数,保留2位小数
        ],
        "end_number": 300,
      },
      {
        "first_number": 300,
        "prize": [
          20, 30, //取【20,30】区间的随机数,保留2位小数
        ],
        "end_number": 600,
      },
      {
        "first_number": 600,
        "prize": [
          10, 20, //取【10,20】区间的随机数,保留2位小数
        ],
        "end_number": 700,
      },
      {
        "first_number": 700,
        "prize": [
          5, 10, //取【10,20】区间的随机数,保留2位小数
        ],
        "end_number": 750,
      },
      {
        "first_number": 750,
        "prize": [
          1, 5, //取【10,20】区间的随机数,保留2位小数
        ],
        "end_number": 800,
      },
    ],
    //转盘奖励的概率
    "wheel_point": {
      "point_5": 10, //转盘出现$5的概率
      "point_10": 80, //转盘出现$10的概率
      "point_20": 5, //转盘出现$20的概率
      "point_50": 4, //转盘出现$50的概率
      "point_80": 1, //转盘出现$80的概率
      "iphone_point": 0, //转盘出现手机的概率
    },
    "tixian_task": [
      {"title": "quiz", "data": 10},
      {"title": "box", "data": 10},
      {"title": "spin", "data": 10},
      {"title": "pop", "data": 10},
      {"title": "quiz", "data": 20},
      {"title": "box", "data": 20},
      {"title": "spin", "data": 25},
      {"title": "pop", "data": 20},
      {"title": "quiz", "data": 50},
    ],
    "check_prize": [
      //签到数值
      {
        "first_number": 0,
        "prize": [
          5, 10, //取【5,10】区间的随机数,保留2位小数
        ],
        "end_number": 300,
      },
      {
        "first_number": 300,
        "prize": [
          3, 5, //取【3,5】区间的随机数,保留2位小数
        ],
        "end_number": 600,
      },
      {
        "first_number": 600,
        "prize": [
          1, 3, //取【1,3】区间的随机数,保留2位小数
        ],
        "end_number": 800,
      },
    ],
  };
}
