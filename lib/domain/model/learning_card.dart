import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_card.freezed.dart';

part 'learning_card.g.dart';

@freezed
class LearningCard with _$LearningCard {
  const factory LearningCard({
    required String id,
    required String frontText,
    required String backText,
    @Default(false) bool know,
  }) = _LearningCard;

  factory LearningCard.fromJson(Map<String, Object?> json) =>
      _$LearningCardFromJson(json);
}
