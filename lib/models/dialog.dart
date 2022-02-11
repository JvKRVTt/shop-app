import 'package:json_annotation/json_annotation.dart';
import 'package:shop/models/message.dart';
part 'dialog.g.dart';

@JsonSerializable()
class Dialog {
  int id;
  String name;
  @JsonKey(name: 'last_message')
  Message lastMessage;

  Dialog(this.id, this.name, this.lastMessage);

  factory Dialog.fromJson(Map<String, dynamic> json) => _$DialogFromJson(json);
  Map<String, dynamic> toJson() => _$DialogToJson(this);
}