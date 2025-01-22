import 'package:fastlink_app/presentation/modules/auth/change_password/change_password_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/change_pin/change_pin_controller.dart';
import 'package:fastlink_app/presentation/utils/colors.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/utils/validators.dart';
import 'package:fastlink_app/presentation/utils/values.dart';
import 'package:fastlink_app/presentation/widgets/app_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:fastlink_app/presentation/modules/auth/login/login_controller.dart';

import '../../../../widgets/column_pro.dart';
//import 'login_controller.dart';

class ChangePinScreen extends GetView<ChangePinController> {
  const ChangePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text("Change Payment PIN "),
      ),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: FlexibleScrollViewColumn(
            padding: EdgeInsets.all(AppPadding.p24),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(40),
                 
                  
                  Obx(
                    () => AppTextFormField(
                      label: 'Current PIN',
                      autofillHints: [AutofillHints.password],
                      hintText: 'Enter PIN',
                      obscureText: controller.hidePassword.value,
                      validator: Validator.isPassword,
                      onSaved: (val) =>
                          controller.new_password_confirm = val!.trim(),
                      suffixIcon: IconButton(
                        icon: controller.hidePassword.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.remove_red_eye),
                        onPressed: controller.hidePasswordPressed,
                      ),
                    ),
                  ),
                   Gap(55.h),
                   Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Forgot pin?",
                          style: AppText.fBTextBlackSmall,
                          children: [
                            TextSpan(
                              text: "Tap here",
                              style: AppText.fBTextOrangeSmall12,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigate to Resend Code logic
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  const Gap(70),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.moveToNextScreen,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Continue"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
