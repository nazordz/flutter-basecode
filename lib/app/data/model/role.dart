import 'package:freezed_annotation/freezed_annotation.dart';

part 'role.freezed.dart';

part 'role.g.dart';

@freezed
class Role with _$Role {
  const factory Role({
    required String id,
    required String name,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _Role;

  factory Role.fromJson(Map<String, Object?> json) => _$RoleFromJson(json);
}
