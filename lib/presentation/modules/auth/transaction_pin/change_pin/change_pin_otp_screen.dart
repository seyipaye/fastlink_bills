import 'package:fastlink_app/presentation/modules/auth/transaction_pin/change_pin/change_pin_otp_controller.dart';
import 'package:fastlink_app/presentation/utils/colors.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/utils/values.dart';
import 'package:fastlink_app/presentation/widgets/column_pro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';


class ChangePinOtpScreen extends GetView<ChangePinOtpController> {
  const ChangePinOtpScreen({Key? key}) : super(key: key);

  final bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('OTP Verification'),
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FlexibleScrollViewColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          padding: const EdgeInsets.fromLTRB(
              AppPadding.p24, AppPadding.p48, AppPadding.p24, AppPadding.p24),
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    //'Check your SMS messages a code has been sent to ... ',
                    'Enter the verification code ',
                    //+${controller.user.value.forgot_password?.identifier}
                    style: AppText.fBTextBlackBoldMedium,
                    textAlign: TextAlign.center,
                  ),
                  Gap(5.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "sent to",
                        style: AppText.fBTextBlackBoldMedium,
                        children: [
                          TextSpan(
                            text:
                                " +${controller.user.value.forgot_password?.identifier}",
                            style: AppText.fBTextOrangeSmall,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to Resend Code logic
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSize.s70,
            ),

            // ? Add Timer
            Text(
              'Expires in 5 mins',
              style: AppText.fBTextBlackSmall,
            ),
            spacer(),
            Pinput(
              onCompleted: controller.onCompleted,
              length: 5,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: AppSize.s40),

            Center(
              child: RichText(
                text: TextSpan(
                  text: "              'Didn’t recieve a code?",
                  style: AppText.fBTextBlackSmall,
                  children: [
                    TextSpan(
                      text: "resend",
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
    );
  }
}
