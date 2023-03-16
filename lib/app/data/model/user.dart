import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooritabasecode/app/data/model/role.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    required String phone,
    @JsonKey(name: 'role_id') required String roleId,
    @JsonKey(name: 'role') required Role role,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'deleted_at') required String? deletedAt,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
