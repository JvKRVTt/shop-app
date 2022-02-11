import 'package:json_annotation/json_annotation.dart';
import 'package:shop/models/subcategory.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  int id;
  String name;
  List<Subcategory> subcategories;

  Category(this.id, this.name, this.subcategories);

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}