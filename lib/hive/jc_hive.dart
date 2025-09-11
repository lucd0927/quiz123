import 'package:hive_ce_flutter/hive_flutter.dart';

class JCHive {
  static Box get box => Hive.box(_hBox);
  static const String _hBox = "jchive";
}
