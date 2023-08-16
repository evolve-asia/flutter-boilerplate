// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginBaseResponse _$LoginBaseResponseFromJson(Map<String, dynamic> json) =>
    LoginBaseResponse(
      LoginResponse.fromJson(json['login'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginBaseResponseToJson(LoginBaseResponse instance) =>
    <String, dynamic>{
      'login': instance.loginResponse.toJson(),
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['token'] as String,
      UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      json['buName'] as String,
      SettingResponse.fromJson(json['Settings'] as Map<String, dynamic>),
      json['hasCheckedIn'] as bool,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user.toJson(),
      'buName': instance.buName,
      'Settings': instance.Settings.toJson(),
      'hasCheckedIn': instance.hasCheckedIn,
    };

SettingResponse _$SettingResponseFromJson(Map<String, dynamic> json) =>
    SettingResponse(
      json['geoFencing'] as int,
      json['payment'] as bool,
      json['pfd'] as bool,
      json['srn'] as bool,
      json['currency'] as String,
      json['targetDimension'] as String,
      json['sbd'] as bool,
      json['focusedSKU'] as bool,
      json['brandDistributionCoverageTarget'] as bool,
      json['outletCoverageTarget'] as bool,
    );

Map<String, dynamic> _$SettingResponseToJson(SettingResponse instance) =>
    <String, dynamic>{
      'geoFencing': instance.geoFencing,
      'payment': instance.payment,
      'pfd': instance.pfd,
      'srn': instance.srn,
      'currency': instance.currency,
      'targetDimension': instance.targetDimension,
      'sbd': instance.sbd,
      'focusedSKU': instance.focusedSKU,
      'brandDistributionCoverageTarget':
          instance.brandDistributionCoverageTarget,
      'outletCoverageTarget': instance.outletCoverageTarget,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['id'] as int,
      json['fullName'] as String,
      json['email'] as String,
      json['phoneNumber'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['refreshToken'] as String?,
      RoleResponse.fromJson(json['role'] as Map<String, dynamic>),
      json['parentUserId'] as int,
      (json['Distributor'] as List<dynamic>)
          .map((e) => DistributorResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'refreshToken': instance.refreshToken,
      'role': instance.role.toJson(),
      'parentUserId': instance.parentUserId,
      'Distributor': instance.distributors.map((e) => e.toJson()).toList(),
    };

RoleResponse _$RoleResponseFromJson(Map<String, dynamic> json) => RoleResponse(
      json['id'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$RoleResponseToJson(RoleResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

DistributorResponse _$DistributorResponseFromJson(Map<String, dynamic> json) =>
    DistributorResponse(
      json['id'] as int,
    );

Map<String, dynamic> _$DistributorResponseToJson(
        DistributorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
