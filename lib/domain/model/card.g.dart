// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardImpl _$$CardImplFromJson(Map<String, dynamic> json) => _$CardImpl(
      id: json['id'] as String,
      frontText: json['frontText'] as String,
      backText: json['backText'] as String,
      know: json['know'] as bool? ?? false,
    );

Map<String, dynamic> _$$CardImplToJson(_$CardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'frontText': instance.frontText,
      'backText': instance.backText,
      'know': instance.know,
    };
