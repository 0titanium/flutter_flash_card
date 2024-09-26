// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LearningCardImpl _$$LearningCardImplFromJson(Map<String, dynamic> json) =>
    _$LearningCardImpl(
      id: json['id'] as String,
      frontText: json['frontText'] as String,
      backText: json['backText'] as String,
      know: json['know'] as bool? ?? false,
    );

Map<String, dynamic> _$$LearningCardImplToJson(_$LearningCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'frontText': instance.frontText,
      'backText': instance.backText,
      'know': instance.know,
    };
