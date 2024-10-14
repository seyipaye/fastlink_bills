import 'package:fastlink_app/core/extentions.dart';
import 'package:fastlink_app/domain/repositories/app_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_routes.dart';
import '../../../../data/user/user.dart';
import '../../../../domain/repositories/auth_repo.dart';
import 'package:get/get.dart';

class OtpController extends GetxController with StateMixin<String> {
  Rx<User> get user => AuthRepository.instance.user;

  // get fromResetPassword => Get.previousRoute == Routes.resetPasswordOtp;
  final otpController = TextEditingController();

  @override
  void onInit() {
    // print(args);
    // if (data != null) {
    //   email = data[0];
    // } else {
    //   email = AuthRepository.instance.user.value.email ?? '';
    //   phone = AuthRepository.instance.user.value.phone ?? '';
    // }
    super.onInit();
  }

  @override
  void onReady() {
    // if (fromResetPassword) {
    //   AuthRepository.instance.resendOtp();
    // }
    super.onReady();
  }

  void onCompleted(String otp) {
    // args = (identifier: args.identifier, pin_id: args.pin_id, otp: otp);

    // print(args);
    user.value = user.value.copyWith(
        forgot_password: user.value.forgot_password!.copyWith(otp: otp));
    Get.toNamed(Routes.setNewPassword);
    return;

    // showLoadingState;

    // AuthRepository.instance.verifyEmail(otp, email).then((msg) {
    //   // Success
    //   Get.back();
    //   showMessage(msg);

    //   if (AuthRepository.instance.user.value.type == UserType.customer) {
    //     Get.offAllNamed(Routes.home);
    //   } else {
    //     kDebugMode
    //         ? Get.toNamed(Routes.dashboard)
    //         : Get.offAllNamed(Routes.dashboard);
    //   }
    // }).catchError((err, stackTrace) {
    //   if (err is! String) {
    //     err = err.toString();
    //   }
    //   // Error
    //   Get.back();
    //   showError(err);
    //   otpController.clear();
    // });
  }

  // void onResendPressed() {
  //   FocusManager.instance.primaryFocus?.unfocus();

  //   showLoadingState;
  //   final request;
  //   if (fromResetPassword) {
  //     request = AuthRepository.instance.forgetPassword().then((msg) {
  //       // Success
  //       Get.back();
  //       showMessage(msg);
  //     });
  //   } else {
  //     request = AuthRepository.instance.resendOtp().then((msg) {
  //       // Success
  //       Get.back();
  //       showMessage(msg);
  //     });
  //   }

  //   request.catchError((err, stackTrace) {
  //     if (err is! String) {
  //       err = err.toString();
  //     }
  //     // Error
  //     Get.back();
  //     showError(err);
  //   });
  // }

  void onCancelPressed() {
    FocusManager.instance.primaryFocus?.unfocus();
    AuthRepository.instance.logOut();
  }
}
