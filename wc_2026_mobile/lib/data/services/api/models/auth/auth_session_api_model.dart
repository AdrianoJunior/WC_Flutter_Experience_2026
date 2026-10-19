import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_session_api_model.g.dart';

@JsonSerializable()
class const AuthSessionApiModel({
  required final String token,
  required final AuthSessionUserApiModel user,
}) extends Equatable{

  @override
  List<Object?> get props => [token, user];

  factory AuthSessionApiModel.fromJson(Map<String, dynamic> map) => _$AuthSessionApiModelFromJson(map);

  Map<String, dynamic> toJson() => _$AuthSessionApiModelToJson(this);
}

@JsonSerializable()
class const AuthSessionUserApiModel({
  required final String name,
  required final String email,
}) extends Equatable {
  @override
  List<Object?> get props => [name, email];

  factory AuthSessionUserApiModel.fromJson(Map<String, dynamic> map) =>
      _$AuthSessionUserApiModelFromJson(map);

  Map<String, dynamic> toJson() => _$AuthSessionUserApiModelToJson(this);
}
