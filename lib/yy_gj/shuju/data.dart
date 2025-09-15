import '../../yyymmm/dt_tttt/dt_controller.dart';
import 'animal.dart';

import 'daily_life.dart';
import 'math.dart';
import 'nature.dart';
import 'science.dart';

class DaTiShuju {
  static const int code = 123;
  static const kCategory = "category";
  static const kData = "data";

  static Map<String, dynamic> data = {
    EnumLeixinType.dailyLife.name: testData(),
    EnumLeixinType.nature.name: testData(),
    EnumLeixinType.science.name: testData(),
    EnumLeixinType.math.name: testData(),
    EnumLeixinType.animal.name:testData(),
  };

  // static Map<String, dynamic> data = {
  //   EnumLeixinType.dailyLife.name: DailyLife.dataA(),
  //   EnumLeixinType.nature.name: Nature.dataA(),
  //   EnumLeixinType.science.name: Science.dataA(),
  //   EnumLeixinType.math.name: Math.dataA(),
  //   EnumLeixinType.animal.name: Animal.dataA(),
  // };
  //
  static dynamic testData(){
    return [
      {
        "question": "What is the largest land animal in the world?",
        "a": "Dog",
        "b": "Elephant",
        "answer": "b",
      },
      {
        "question": "What animal has a long trunk?",
        "a": "Elephant",
        "b": "Giraffe",
        "answer": "a",
      },
    ];
  }

  static List<String> dataKeys = data.keys.toList();

  static String xiayigeLeixing(String curLeixing) {
    String next = curLeixing;
    var keys = data.keys.toList();
    int keyLength = keys.length;
    for (int i = 0; i < keyLength; i++) {
      String key = keys[i];
      if (key == curLeixing) {
        int nextI = i + 1;
        // 当i为最后一个索引，跳到第一个
        if (nextI == keyLength) {
          nextI = 0;
        }
        next = keys[nextI];
        break;
      }
    }
    return next;
  }
}
