import 'package:fastlink_app/core/app_routes.dart';
import 'package:fastlink_app/domain/app_shared_prefs.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Add a delay and navigation logic
    Future.delayed(const Duration(seconds: 5), () {
      final user = Get.find<AppSharedPrefs>().user;
      if (user != null) {
        Get.offNamed(Routes.onboarding); // Navigate to Home if user exists
      } else {
        Get.offNamed(Routes.login); // Navigate to Login if no user
      }
    });
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Gap(250.h),
        Center(child: Assets.images.fastLinkLogo.image(
          color: AppColors.primary,
        )),

      ],),
    );
  }
}
