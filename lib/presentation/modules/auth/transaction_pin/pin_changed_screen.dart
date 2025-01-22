import 'package:fastlink_app/presentation/modules/airtime/profile/profile_controller.dart';
import 'package:fastlink_app/presentation/modules/airtime/profile/profile_screen.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/change_pin/change_pin_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/change_pin/change_pin_screen.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PinChangedScreen extends StatelessWidget {
  const PinChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(200.h),
            Assets.images.greenMark.image(),
            Gap(20.h),
            Text('Payment PIN Changed!',
            style: AppText.fBTextBlackBold,
            textAlign: TextAlign.center,
            ),
            Gap(10.h),
              Text('Your PIN has been changed\n successfully.',
            style: AppText.fBTextBlackBoldMediumLightBlack,
                      textAlign: TextAlign.center,
        
            ),
            Gap(60.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                      child: Text('Back to Settings'),
                      onPressed:  (){
                         //Get.put(ProfileController());
                  Get.to(() => ProfileScreen());
                        // Get.put(ChangePinController());
                        // Get.to(() => ChangePinScreen());
                      },
                      
                      // controller.setPasswordPressed,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
          