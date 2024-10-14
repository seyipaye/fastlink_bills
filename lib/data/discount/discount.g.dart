// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
      id: json['id'] as String,
      expiry: DateTime.parse(json['expiry'] as String),
      created: DateTime.parse(json['created'] as String),
      modified: DateTime.parse(json['modified'] as String),
      recipient: json['recipient'] as String,
      applicable_plan: json['applicable_plan'] as String,
      valid: json['valid'] as bool,
      max_price: (json['max_price'] as num).toDouble(),
      max_usage: json['max_usage'] as int,
      title: json['title'] as String,
      usage_count: json['usage_count'] as int,
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'id': instance.id,
      'recipient': instance.recipient,
      'applicable_plan': instance.applicable_plan,
      'valid': instance.valid,
      'max_price': instance.max_price,
      'max_usage': instance.max_usage,
      'title': instance.title,
      'usage_count': instance.usage_count,
      'percentage': instance.percentage,
      'expiry': instance.expiry.toIso8601String(),
      'created': instance.created.toIso8601String(),
      'modified': instance.modified.toIso8601String(),
    };
