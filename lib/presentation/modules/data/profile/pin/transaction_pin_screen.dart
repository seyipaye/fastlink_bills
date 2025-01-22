import 'package:fastlink_app/presentation/modules/auth/change_password/change_password.dart';
import 'package:fastlink_app/presentation/modules/auth/change_password/change_password_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/otp/otp_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/password/reset_password_otp_screen.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/change_pin/change_pin_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/change_pin/change_pin_screen.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TransactionPinScreen extends StatelessWidget {
  const TransactionPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction PIN"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment PIN",
              style: AppText.fBTextBlackBoldMidMedium16,
            ),
            Gap(20.h),
            TextArrowRow(
              onTap: () {
                Get.put(ChangePinController());

                Get.to(() => ChangePinScreen());
              },
              text: 'Change Payment PIN',
            ),
            TextArrowRow(
              onTap: () {
                Get.put(OtpController());

                Get.to(() => ResetPasswordOtpScreen());
              },
              text: 'Forgot Payment PIN',
            )
          ],
        ),
      ),
    );
  }
}

// Reusable Widget
class TextArrowRow extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const TextArrowRow({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:
            EdgeInsets.only(left: 10.0.w, right: 10.w, top: 15.h, bottom: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  text,
                  style: AppText.fBTextBlackBoldMedium,
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
