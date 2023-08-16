import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginBaseResponse {
  @JsonKey(name: 'login')
  final LoginResponse loginResponse;

  LoginBaseResponse(this.loginResponse);

  factory LoginBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginBaseResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'user')
  final UserResponse user;

  @JsonKey(name: 'buName')
  final String buName;

  @JsonKey(name: 'Settings')
  final SettingResponse Settings;

  @JsonKey(name: 'hasCheckedIn')
  final bool hasCheckedIn;

  LoginResponse(
      this.token, this.user, this.buName, this.Settings, this.hasCheckedIn);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SettingResponse {
  @JsonKey(name: 'geoFencing')
  final int geoFencing;
  @JsonKey(name: 'payment')
  final bool payment;
  @JsonKey(name: 'pfd')
  final bool pfd;
  @JsonKey(name: 'srn')
  final bool srn;
  @JsonKey(name: 'currency')
  final String currency;
  @JsonKey(name: 'targetDimension')
  final String targetDimension;
  @JsonKey(name: 'sbd')
  final bool sbd;
  @JsonKey(name: 'focusedSKU')
  final bool focusedSKU;
  @JsonKey(name: 'brandDistributionCoverageTarget')
  final bool brandDistributionCoverageTarget;
  @JsonKey(name: 'outletCoverageTarget')
  final bool outletCoverageTarget;

  factory SettingResponse.fromJson(Map<String, dynamic> json) =>
      _$SettingResponseFromJson(json);

  SettingResponse(
      this.geoFencing,
      this.payment,
      this.pfd,
      this.srn,
      this.currency,
      this.targetDimension,
      this.sbd,
      this.focusedSKU,
      this.brandDistributionCoverageTarget,
      this.outletCoverageTarget);

  Map<String, dynamic> toJson() => _$SettingResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserResponse {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'fullName')
  final String fullName;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'lastName')
  final String lastName;
  @JsonKey(name: 'refreshToken')
  final String? refreshToken;
  @JsonKey(name: 'role')
  final RoleResponse role;
  @JsonKey(name: 'parentUserId')
  final int parentUserId;
  @JsonKey(name: 'Distributor')
  final List<DistributorResponse> distributors;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  UserResponse(this.id, this.fullName, this.email, this.phoneNumber,
      this.firstName, this.lastName, this.refreshToken, this.role, this.parentUserId, this.distributors);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RoleResponse {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;

  factory RoleResponse.fromJson(Map<String, dynamic> json) =>
      _$RoleResponseFromJson(json);

  RoleResponse(this.id, this.name);

  Map<String, dynamic> toJson() => _$RoleResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DistributorResponse {
  @JsonKey(name: 'id')
  final int id;

  factory DistributorResponse.fromJson(Map<String, dynamic> json) =>
      _$DistributorResponseFromJson(json);

  DistributorResponse(this.id);

  Map<String, dynamic> toJson() => _$DistributorResponseToJson(this);
}
