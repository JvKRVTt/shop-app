// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      json['from_user'] as bool,
      json['text'] as String,
      DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'from_user': instance.fromUser,
      'text': instance.text,
      'created_at': instance.createdAt.toIso8601String(),
    };
