import 'package:fastlink_app/presentation/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/constants.dart';
import '../../../utils/values.dart';
import '../../../widgets/column_pro.dart';
import '../otp/otp_controller.dart';

class ResetPasswordOtpScreen extends GetView<OtpController> {
  const ResetPasswordOtpScreen({Key? key}) : super(key: key);

  final bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FlexibleScrollViewColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          padding: const EdgeInsets.fromLTRB(
              AppPadding.p24, 0, AppPadding.p24, AppPadding.p24),
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                //'Check your SMS messages a code has been sent to ... ',
                'Please, check your SMS app, a code \nhas been sent to +${controller.user.value.forgot_password?.identifier}',
                style: Get.textTheme.labelMedium!.copyWith(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: AppSize.s70,
            ),

            // ? Add Timer
            Text(
              'Expires in 5 mins',
              style: Get.textTheme.labelSmall!.copyWith(color: Colors.red),
            ),
            spacer(),
            Pinput(
              onCompleted: controller.onCompleted,
              length: 4,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: AppSize.s48),
            Text(
              'Didn’t recieve a code?',
              style: Get.textTheme.titleSmall,
            ),
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
    );
  }
}
