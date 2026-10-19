import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class const LoginRequest({
  required final String email,
  required final String password,
}) extends Equatable {

  factory LoginRequest.fromJson(Map<String, dynamic> map) => _$LoginRequestFromJson(map);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  get props => [email, password];

  @override
  bool? get stringify => false;
}
