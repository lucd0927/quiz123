abstract class BaseEvent {
  String name();
}

enum EnumLiwuEvent { updateRight2, updateRight8, scroll }

class LiwuEvent extends BaseEvent {
  @override
  String name() {
    return "LiwuEvent";
  }

  final EnumLiwuEvent type;

  LiwuEvent({required this.type});
}

class DatiFloatEvent extends BaseEvent {
  @override
  String name() {
    return "DatiFloatEvent";
  }
}
class RankkkkEvent extends BaseEvent {
  @override
  String name() {
    return "RankkkkEvent";
  }
}
