import 'package:json_annotation/json_annotation.dart';
part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: 'from_user')
  bool fromUser;
  String text;
  @JsonKey(name: 'created_at')
  DateTime createdAt;

  Message(this.fromUser, this.text, this.createdAt);

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}