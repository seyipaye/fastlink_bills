// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      id: json['id'] as int,
      balance: (json['balance'] as num).toDouble(),
      data_cap: (json['data_cap'] as num?)?.toDouble(),
      data_used: (json['data_used'] as num?)?.toDouble(),
      from_date: json['from_date'] == null
          ? null
          : DateTime.parse(json['from_date'] as String),
      to_date: json['to_date'] == null
          ? null
          : DateTime.parse(json['to_date'] as String),
      name: json['name'] as String?,
      address: json['address'] as String?,
      profile: json['profile'] as String,
      surname: json['surname'] as String?,
      token: json['token'] == null
          ? null
          : Token.fromJson(json['token'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      forgot_password: json['forgot_password'] == null
          ? null
          : ForgotPasswordVerifyRequest.fromJson(
              json['forgot_password'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'id': instance.id,
      'balance': instance.balance,
      'data_cap': instance.data_cap,
      'data_used': instance.data_used,
      'from_date': instance.from_date?.toIso8601String(),
      'to_date': instance.to_date?.toIso8601String(),
      'name': instance.name,
      'address': instance.address,
      'profile': instance.profile,
      'surname': instance.surname,
      'token': instance.token,
      'data': instance.data,
      'forgot_password': instance.forgot_password,
    };

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      json['access_token'] as String,
      json['token_type'] as String,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      data_cap: (json['data_cap'] as num).toDouble(),
      data_used: (json['data_used'] as num).toDouble(),
      free_data_attempts_left: json['free_data_attempts_left'] as int?,
      free_data_attempts_max: json['free_data_attempts_max'] as int?,
      from_date: json['from_date'] == null
          ? null
          : DateTime.parse(json['from_date'] as String),
      to_date: json['to_date'] == null
          ? null
          : DateTime.parse(json['to_date'] as String),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'data_cap': instance.data_cap,
      'data_used': instance.data_used,
      'free_data_attempts_left': instance.free_data_attempts_left,
      'free_data_attempts_max': instance.free_data_attempts_max,
      'from_date': instance.from_date?.toIso8601String(),
      'to_date': instance.to_date?.toIso8601String(),
    };

UserCredentials _$UserCredentialsFromJson(Map<String, dynamic> json) =>
    UserCredentials(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserCredentialsToJson(UserCredentials instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

ForgotPasswordVerifyRequest _$ForgotPasswordVerifyRequestFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordVerifyRequest(
      identifier: json['identifier'] as String,
      otp: json['otp'] as String?,
      pin_id: json['pin_id'] as String?,
      new_password: json['new_password'] as String?,
    );

Map<String, dynamic> _$ForgotPasswordVerifyRequestToJson(
        ForgotPasswordVerifyRequest instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'otp': instance.otp,
      'pin_id': instance.pin_id,
      'new_password': instance.new_password,
    };
