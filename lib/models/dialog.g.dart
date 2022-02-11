// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dialog _$DialogFromJson(Map<String, dynamic> json) => Dialog(
      json['id'] as int,
      json['name'] as String,
      Message.fromJson(json['last_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DialogToJson(Dialog instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_message': instance.lastMessage,
    };
