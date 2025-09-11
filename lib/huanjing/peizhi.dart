// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.325232

import 'peizhi_dev.dart';
import 'peizhi_prod.dart';
import 'peizhi_env.dart';

abstract class JCPzHuanjing {

  static JCPzHuanjingEnv? _env;

  static JCPzHuanjingEnv get env => _env ?? JCPzHuanjingEnv.dev;
  static bool hasKaifa(){
    return env == JCPzHuanjingEnv.dev;
  }
  static bool hasShengChan(){
    return env == JCPzHuanjingEnv.prod;
  }
  static initEvn(JCPzHuanjingEnv env){
    _env = env;
  }
  static JCPzHuanjing? _instance;
  static JCPzHuanjing get instance => _huoquShili();

  static JCPzHuanjing  _huoquShili(){
    switch(_env){
      case JCPzHuanjingEnv.dev:
        _instance = PBPeizhiDev();
        break;
      case JCPzHuanjingEnv.prod:
        _instance = PBPeizhiProd();
        break;
      default:
        _instance = PBPeizhiProd();
    }
    return _instance!;
  }



  String jichuU();
  String ccU();



}    
