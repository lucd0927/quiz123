abstract class BaseEvent {
  String name();
}

enum EnumLiwuEvent { updateRight2, updateRight8 }

class LiwuEvent extends BaseEvent {
  @override
  String name() {
    return "LiwuEvent";
  }

  final EnumLiwuEvent type;

  LiwuEvent({required this.type});
}
