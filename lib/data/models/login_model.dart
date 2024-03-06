// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:neon_student/domain/entities/login.dart';

class LoginModel extends Equatable {
  final String? emailId;
  final String? customerName;
  final bool? isOnboardingComplete;
  final int? onboardingState;
  final String? cif;
  final String? corporateReference;
  final String? token;
  final String? reason;
  final int? reasonCode;
  final String? tokenExpiresOn;
  final String? kycExpiresOn;
  final bool? isTemporaryPassword;
  final int? passwordChangesToday;
  final int? emailChangesToday;
  final int? mobileChangesToday;
  final bool? success;
  final String? message;

  const LoginModel({
    required this.emailId,
    required this.customerName,
    required this.isOnboardingComplete,
    required this.onboardingState,
    required this.cif,
    required this.corporateReference,
    required this.token,
    required this.reason,
    required this.reasonCode,
    required this.tokenExpiresOn,
    required this.kycExpiresOn,
    required this.isTemporaryPassword,
    required this.passwordChangesToday,
    required this.emailChangesToday,
    required this.mobileChangesToday,
    required this.success,
    required this.message,
  });

  @override
  List<Object?> get props {
    return [
      emailId,
      customerName,
      isOnboardingComplete,
      onboardingState,
      cif,
      corporateReference,
      token,
      reason,
      reasonCode,
      tokenExpiresOn,
      kycExpiresOn,
      isTemporaryPassword,
      passwordChangesToday,
      emailChangesToday,
      mobileChangesToday,
      success,
      message,
    ];
  }

  Login toEntity() => Login(
        emailId: emailId,
        customerName: customerName,
        isOnboardingComplete: isOnboardingComplete,
        onboardingState: onboardingState,
        cif: cif,
        corporateReference: corporateReference,
        token: token,
        reason: reason,
        reasonCode: reasonCode,
        tokenExpiresOn: tokenExpiresOn,
        kycExpiresOn: kycExpiresOn,
        isTemporaryPassword: isTemporaryPassword,
        passwordChangesToday: passwordChangesToday,
        emailChangesToday: emailChangesToday,
        mobileChangesToday: mobileChangesToday,
        success: success,
        message: message,
      );

  LoginModel copyWith({
    String? emailId,
    String? customerName,
    bool? isOnboardingComplete,
    int? onboardingState,
    String? cif,
    String? corporateReference,
    String? token,
    String? reason,
    int? reasonCode,
    String? tokenExpiresOn,
    String? kycExpiresOn,
    bool? isTemporaryPassword,
    int? passwordChangesToday,
    int? emailChangesToday,
    int? mobileChangesToday,
    bool? success,
    String? message,
  }) {
    return LoginModel(
      emailId: emailId ?? this.emailId,
      customerName: customerName ?? this.customerName,
      isOnboardingComplete: isOnboardingComplete ?? this.isOnboardingComplete,
      onboardingState: onboardingState ?? this.onboardingState,
      cif: cif ?? this.cif,
      corporateReference: corporateReference ?? this.corporateReference,
      token: token ?? this.token,
      reason: reason ?? this.reason,
      reasonCode: reasonCode ?? this.reasonCode,
      tokenExpiresOn: tokenExpiresOn ?? this.tokenExpiresOn,
      kycExpiresOn: kycExpiresOn ?? this.kycExpiresOn,
      isTemporaryPassword: isTemporaryPassword ?? this.isTemporaryPassword,
      passwordChangesToday: passwordChangesToday ?? this.passwordChangesToday,
      emailChangesToday: emailChangesToday ?? this.emailChangesToday,
      mobileChangesToday: mobileChangesToday ?? this.mobileChangesToday,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'emailId': emailId,
      'customerName': customerName,
      'isOnboardingComplete': isOnboardingComplete,
      'onboardingState': onboardingState,
      'cif': cif,
      'corporateReference': corporateReference,
      'token': token,
      'reason': reason,
      'reasonCode': reasonCode,
      'tokenExpiresOn': tokenExpiresOn,
      'kycExpiresOn': kycExpiresOn,
      'isTemporaryPassword': isTemporaryPassword,
      'passwordChangesToday': passwordChangesToday,
      'emailChangesToday': emailChangesToday,
      'mobileChangesToday': mobileChangesToday,
      'success': success,
      'message': message,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      emailId: map['emailId'] != null ? map['emailId'] as String : null,
      customerName:
          map['customerName'] != null ? map['customerName'] as String : null,
      isOnboardingComplete: map['isOnboardingComplete'] != null
          ? map['isOnboardingComplete'] as bool
          : null,
      onboardingState:
          map['onboardingState'] != null ? map['onboardingState'] as int : null,
      cif: map['cif'] != null ? map['cif'] as String : null,
      corporateReference: map['corporateReference'] != null
          ? map['corporateReference'] as String
          : null,
      token: map['token'] != null ? map['token'] as String : null,
      reason: map['reason'] != null ? map['reason'] as String : null,
      reasonCode: map['reasonCode'] != null ? map['reasonCode'] as int : null,
      tokenExpiresOn: map['tokenExpiresOn'] != null
          ? map['tokenExpiresOn'] as String
          : null,
      kycExpiresOn:
          map['kycExpiresOn'] != null ? map['kycExpiresOn'] as String : null,
      isTemporaryPassword: map['isTemporaryPassword'] != null
          ? map['isTemporaryPassword'] as bool
          : null,
      passwordChangesToday: map['passwordChangesToday'] != null
          ? map['passwordChangesToday'] as int
          : null,
      emailChangesToday: map['emailChangesToday'] != null
          ? map['emailChangesToday'] as int
          : null,
      mobileChangesToday: map['mobileChangesToday'] != null
          ? map['mobileChangesToday'] as int
          : null,
      success: map['success'] != null ? map['success'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
