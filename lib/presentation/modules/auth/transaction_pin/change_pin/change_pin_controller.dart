import 'package:fastlink_app/presentation/modules/auth/otp/otp_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/password/reset_password_otp_screen.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/change_pin/change_pin_otp_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/change_pin/change_pin_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fastlink_app/core/extentions.dart';

import '../../../../../domain/repositories/auth_repo.dart';

class ChangePinController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final hidePassword = true.obs;
  String new_password_confirm = '';

  void hidePasswordPressed() => hidePassword.value = !hidePassword.value;

 

  void moveToNextScreen() {
    Get.put(ChangePinOtpController());

    Get.to(() => ChangePinOtpScreen());
  }

}
