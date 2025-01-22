import 'package:fastlink_app/presentation/modules/auth/password/password_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/new_pin/new_pin_controller.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/validators.dart';
import 'package:fastlink_app/presentation/utils/values.dart';
import 'package:fastlink_app/presentation/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

class SetNewPinScreen extends GetView<NewPinController> {
  const SetNewPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Payment PIN'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p24),
          child: Form(
            key: controller.newFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                spacer(),
                Obx(() => AppTextFormField(
                      label: 'New PIN',
                      obscureText: controller.hidePassword.value,
                      hintText: 'Enter Pin',
                      validator: Validator.isPassword,
                      onSaved: (val) => controller.newPassword = val!.trim(),
                      suffixIcon: IconButton(
                        icon: controller.hidePassword.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.remove_red_eye),
                        onPressed: controller.hidePasswordPressed,
                      ),
                    )),
                spacer(),
                Obx(() => AppTextFormField(
                      label: 'Confirm New PIN ',
                      obscureText: controller.hidePassword.value,
                      validator: Validator.isPassword,
                      hintText: 'Enter Pin',
                      onSaved: (val) =>
                          controller.confirmNewPassword = val!.trim(),
                      suffixIcon: IconButton(
                        icon: controller.hidePassword.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.remove_red_eye),
                        onPressed: controller.hidePasswordPressed,
                      ),
                    )),
                Gap(200.h),
                ElevatedButton(
                  child: Text('Change Payment PIN'),
                  onPressed:  controller.moveToNextScreen,
                  
                  // controller.setPasswordPressed,
                ),
                // spacer(),
                // TextButton(
                //   child: Text('Cancel'),
                //   style: TextButton.styleFrom(
                //     textStyle: Get.textTheme.titleSmall!,
                //   ),
                //   onPressed: () {
                //     //Get.offAllNamed(Routes.profilePrompt);
                //     controller.onCancelPressed();
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
