import 'package:json_annotation/json_annotation.dart';
part 'ad.g.dart';

@JsonSerializable()
class Ad {
  String image;
  String title;
  String text;

  Ad(this.image, this.title, this.text);

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);
  Map<String, dynamic> toJson() => _$AdToJson(this);
}