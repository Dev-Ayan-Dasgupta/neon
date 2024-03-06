import 'package:equatable/equatable.dart';

class Login extends Equatable {
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

  const Login({
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
  List<Object?> get props => [
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
