import 'package:flutter_flash_card/domain/model/card.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck.freezed.dart';

part 'deck.g.dart';

@freezed
class Deck with _$Deck {
  const factory Deck({
    required String deckName,
    required List<Card> cards,
  }) = _Deck;

  factory Deck.fromJson(Map<String, Object?> json) => _$DeckFromJson(json);
}