import 'package:fastlink_app/presentation/modules/auth/password/password_controller.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/values.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/validators.dart';
import '../../../widgets/app_text_form_field.dart';

class ForgotPasswordScreen extends GetView<PasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  final bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forogot Password',
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p24),
          child: Form(
            key: controller.resetFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                spacer(),
                Text(
                  'Oops! Mistakes do happen, you know!',
                  style: Get.textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                spacer(),
                Text(
                  'Input your phone number, then click the reset password button. \nAn OTP will be sent to your phone number',
                  style: Get.textTheme.bodySmall!.copyWith(letterSpacing: 0.75),
                ),
                spacer(),
                spacer(),
                AppTextFormField(
                  label: 'Phone Number',
                  autofillHints: [AutofillHints.telephoneNumber],
                  hintText: 'e.g 08123456789',
                  onSaved: (val) => controller.identifier = val!.trim(),
                  validator: Validator.isPhone,
                ),
                spacer(),
                spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                  child: Text('Reset Password'),
                  onPressed: controller.onResetPasswordPressed,
                ),
                spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
