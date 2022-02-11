import 'package:json_annotation/json_annotation.dart';
import 'package:shop/models/product.dart';
part 'subcategory.g.dart';

@JsonSerializable()
class Subcategory {
  int id;
  String name;

  Subcategory(this.id, this.name);

  factory Subcategory.fromJson(Map<String, dynamic> json) => _$SubcategoryFromJson(json);
  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
}