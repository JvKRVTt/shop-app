// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as int,
      (json['categories'] as List<dynamic>).map((e) => e as int).toList(),
      (json['subcategories'] as List<dynamic>).map((e) => e as int).toList(),
      json['image'] as String,
      json['title'] as String,
      json['description'] as String,
      (json['price'] as num).toDouble(),
      json['weight'] as int,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'categories': instance.categories,
      'subcategories': instance.subcategories,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'weight': instance.weight,
    };
