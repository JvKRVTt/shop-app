import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';

@JsonSerializable()
class Order {
  int id;
  String status;
  @JsonKey(name: 'created_at')
  DateTime createdAt;

  Order(this.id, this.status, this.createdAt);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}