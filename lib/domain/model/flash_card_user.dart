import 'package:freezed_annotation/freezed_annotation.dart';

part 'flash_card_user.freezed.dart';

part 'flash_card_user.g.dart';

@freezed
class FlashCardUser with _$FlashCardUser {
  const factory FlashCardUser({
    required String id,
    required String email,
    required String displayName,
  }) = _FlashCardUser;

  factory FlashCardUser.fromJson(Map<String, Object?> json) => _$FlashCardUserFromJson(json);
}