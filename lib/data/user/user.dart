// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:freezed_annotation/freezed_annotation.dart';
//part 'user.freezed.dart';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? email;
  String? phone;
  String? username;
  int id;
  double balance;
  double? data_cap;
  double? data_used;
  DateTime? from_date;
  DateTime? to_date;
  String? name;
  String? address;
  String profile;
  String? surname;

  Token? token;
  UserData? data;
  ForgotPasswordVerifyRequest? forgot_password;

  User({
    this.email,
    this.phone,
    this.username,
    required this.id,
    required this.balance,
    this.data_cap,
    this.data_used,
    this.from_date,
    this.to_date,
    this.name,
    this.address,
    required this.profile,
    this.surname,
    this.token,
    this.data,
    this.forgot_password,
  });

  factory User.zero() => User(id: 0, balance: 0, profile: '');

  factory User.forgotPassword(ForgotPasswordVerifyRequest request) => User(
        id: 0,
        balance: 0,
        profile: '',
        forgot_password: request,
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  // For irregular response on signup endpoint
  factory User.fromJsonWithToken(
      Map<String, Object?> user, Map<String, Object?> token) {
    user.putIfAbsent('token', () => token);
    return _$UserFromJson(user);
  }

  /*  String? get sureEmail {
    if (email != null) {
      return email;
    } else if (this.type == UserType.vendor) {
      return this.vendorProfile?.vendors?[0].email;
    }

    return this.customerProfile?.email;
  } */

  User copyWith({
    String? email,
    String? phone,
    String? username,
    int? id,
    double? balance,
    double? data_cap,
    double? data_used,
    DateTime? from_date,
    DateTime? to_date,
    String? name,
    String? address,
    String? profile,
    String? surname,
    Token? token,
    UserData? data,
    ForgotPasswordVerifyRequest? forgot_password,
  }) {
    return User(
        email: email ?? this.email,
        phone: phone ?? this.phone,
        username: username ?? this.username,
        id: id ?? this.id,
        balance: balance ?? this.balance,
        data_cap: data_cap ?? this.data_cap,
        data_used: data_used ?? this.data_used,
        from_date: from_date ?? this.from_date,
        to_date: to_date ?? this.to_date,
        name: name ?? this.name,
        address: address ?? this.address,
        profile: profile ?? this.profile,
        surname: surname ?? this.surname,
        token: token ?? this.token,
        data: data ?? this.data,
        forgot_password: forgot_password ?? this.forgot_password);
  }
}

@JsonSerializable()
class Token {
  String access_token;
  String token_type;

  Token(
    this.access_token,
    this.token_type,
  );

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

@JsonSerializable()
class UserData {
  double data_cap;
  double data_used;
  int? free_data_attempts_left;
  int? free_data_attempts_max;
  DateTime? from_date;
  DateTime? to_date;

  UserData({
    required this.data_cap,
    required this.data_used,
    this.free_data_attempts_left,
    this.free_data_attempts_max,
    this.from_date,
    this.to_date,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class UserCredentials {
  String email;
  String password;

  UserCredentials({
    required this.email,
    required this.password,
  });

  factory UserCredentials.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialsFromJson(json);
  Map<String, dynamic> toJson() => _$UserCredentialsToJson(this);
}

@JsonSerializable()
class ForgotPasswordVerifyRequest {
  String identifier;
  String? otp;
  String? pin_id;
  String? new_password;

  ForgotPasswordVerifyRequest({
    required this.identifier,
    this.otp,
    this.pin_id,
    this.new_password,
  });

  factory ForgotPasswordVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordVerifyRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotPasswordVerifyRequestToJson(this);

  ForgotPasswordVerifyRequest copyWith({
    String? identifier,
    String? otp,
    String? pin_id,
    String? new_password,
  }) {
    return ForgotPasswordVerifyRequest(
      identifier: identifier ?? this.identifier,
      otp: otp ?? this.otp,
      pin_id: pin_id ?? this.pin_id,
      new_password: new_password ?? this.new_password,
    );
  }
}
