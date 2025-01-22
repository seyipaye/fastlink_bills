import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

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
            Text('Password Changed!',
            style: AppText.fBTextBlackBold,
            textAlign: TextAlign.center,
            ),
            Gap(10.h),
              Text('Your password has been changed\n successfully.',
            style: AppText.fBTextBlackBoldMediumLightBlack,
                      textAlign: TextAlign.center,
        
            ),
            Gap(60.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                      child: Text('Log in'),
                      onPressed:  (){},
                      
                      // controller.setPasswordPressed,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
          