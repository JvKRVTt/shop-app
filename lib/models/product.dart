import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  List<int> categories;
  List<int> subcategories;
  String image;
  String title;
  String description;
  double price;
  int weight;

  Product(this.id, this.categories, this.subcategories, this.image, this.title, this.description, this.price, this.weight);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}