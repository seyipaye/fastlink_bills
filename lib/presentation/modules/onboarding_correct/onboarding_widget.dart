import 'package:fastlink_app/presentation/modules/auth/login/login_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/login/login_screen.dart';
import 'package:fastlink_app/presentation/modules/onboarding_correct/indicator_builder.dart';
import 'package:fastlink_app/presentation/utils/colors.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    Key? key,
    required this.titleOne,
    required this.description,
    required this.image,
    required this.next,
    required this.onTab,
    required this.activePage, // Accept activePage
    required this.totalPages, // Accept totalPages
  }) : super(key: key);

  final String titleOne;
  final String description;
  final String image;
  final bool next;
  final VoidCallback onTab;
  final int activePage; // New property
  final int totalPages; // New property

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Skip button
              Padding(
                padding: EdgeInsets.only(right: 15.w, top: 15.h),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: (){
                       Get.put(LoginController());
                          Get.to(() => const LoginScreen());
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(30.h),
              // Image section
              Container(
                height: 450.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(30.h),
              // Content section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titleOne,
                      style: AppText.fBTextBlackBigBoldS24W600,
                    ),
                    Gap(10.h),
                    Text(
                      description,
                      style: AppText.fBTextBlackBoldMiddMedium,
                      textAlign: TextAlign.center,
                    ),
                    Gap(30.h),
                    Padding(
                      padding: EdgeInsets.only(left: 150.w, top: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: IndicatorBuilder(
                          activePage: activePage, // Use dynamic activePage
                          totalPages: totalPages, // Use dynamic totalPages
                        ).buildIndicator,
                      ),
                    ),
                    Gap(30.h),
                     // Conditionally show FBButton only on the last screen
                    if (activePage == totalPages - 1) 
                      FBButton(
                        height: 58.h,
                        color: AppColors.primary,
                        title: 'Get Started',
                        textColor: AppColors.whiteColor,
                        onTap: () {
                          Get.put(LoginController());
                          Get.to(() => const LoginScreen());
                        },
                        borderRadius: 10.r,
                      ),
                    // FBButton(
                    //   height: 58.h,
                    //   color: AppColors.primary,
                    //   title: 'Get Started',
                    //   textColor: AppColors.whiteColor,
                    //   onTap: onTab,
                    //   borderRadius: 10.r,
                    //   //onTap: () => Get.to(() => const LoginScreen()),
                    // ),
                    Gap(20.h),
                    // FBButton.outline(
                    //   height: 58.h,
                    //   color: AppColors.foundationBlue400,
                    //   title: 'Skip',
                    //   textColor: AppColors.foundationBlue400,
                    //   onTap: () => Get.to(() => const LoginScreen()),
                    //   borderRadius: 10.r,
                    //   outlineBackgroundColor: AppColors.foundationBlue50,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
