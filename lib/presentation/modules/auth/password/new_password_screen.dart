import 'package:fastlink_app/presentation/modules/auth/password/password_controller.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../utils/validators.dart';
import '../../../utils/values.dart';
import '../../../widgets/app_text_form_field.dart';
import 'package:get/get.dart';

class SetNewPasswordScreen extends GetView<PasswordController> {
  const SetNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set New Password'),
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
                Text(
                  'Input your new preferred passsword, please let it be something you can remember',
                  style: Get.textTheme.bodySmall!.copyWith(letterSpacing: 0.75),
                ),
                spacer(),
                Obx(() => AppTextFormField(
                      label: 'New Password',
                      obscureText: controller.hidePassword.value,
                      hintText: 'Type at least 4 characters e.g Temi',
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
                      label: 'Confirm New Password ',
                      obscureText: controller.hidePassword.value,
                      validator: Validator.isPassword,
                      hintText: 'Type at least 4 characters e.g Bolu',
                      onSaved: (val) =>
                          controller.confirmNewPassword = val!.trim(),
                      suffixIcon: IconButton(
                        icon: controller.hidePassword.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.remove_red_eye),
                        onPressed: controller.hidePasswordPressed,
                      ),
                    )),
                spacer(),
                ElevatedButton(
                  child: Text('Set Password'),
                  onPressed: controller.setPasswordPressed,
                ),
                spacer(),
                TextButton(
                  child: Text('Cancel'),
                  style: TextButton.styleFrom(
                    textStyle: Get.textTheme.titleSmall!,
                  ),
                  onPressed: () {
                    //Get.offAllNamed(Routes.profilePrompt);
                    controller.onCancelPressed();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
