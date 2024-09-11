import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';

part 'card.g.dart';

@freezed
class Card with _$Card {
  const factory Card({
    required String frontText,
    required String backText,
  }) = _Card;

  factory Card.fromJson(Map<String, Object?> json) => _$CardFromJson(json);
}