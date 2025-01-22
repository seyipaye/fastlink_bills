import 'package:fastlink_app/presentation/modules/data/profile/login_settings/login_settings_screen.dart';
import 'package:fastlink_app/presentation/modules/data/profile/my_profile/my_profile_screen.dart';
import 'package:fastlink_app/presentation/modules/data/profile/pin/transaction_pin_screen.dart';
import 'package:fastlink_app/presentation/modules/home/home_page.dart';
import 'package:fastlink_app/presentation/utils/colors.dart';
import 'package:fastlink_app/presentation/utils/strings.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      //backgroundColor: AppColors.whiteColor,
      body: _profileBody(controller),
    );
  }
}

Widget _profileBody(ProfileController controller) {
  return SingleChildScrollView(
    child: Padding(
      padding:  EdgeInsets.only(left: 10.w, right: 10.w),
      child: Column(
        children: [
          Gap(10.h),
          ///////////////User-image///////////////////
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary,
                width: 1.0,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                // Instantiate the ProfilePageController before navigating
                // Get.put(ProfileController());
                // Get.to(() => ProfileScreen());
              },
              child: ClipOval(
                child: Image.network(
                  kUrl,
                  fit: BoxFit.cover,
                  width: 129,
                  height: 129,
                ),
              ),
            ),
          ),
          Gap(6.h),
          Text('Rachael Abigeal', style: AppText.blackTextW600S20),
          Gap(15.h),
          /////////First-Profile-Utililty-Container/////////////
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10),
              ///////////////////Correct-Shadow-Effect////////////////
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.1), // Slightly dark, neutral gray shadow
                  spreadRadius: 2, // Increases the size of the shadow
                  blurRadius: 5, // Makes the shadow softer
                  offset: Offset(0, 3), // Moves the shadow slightly downwards
                ),
              ],
            ///////////////////Correct-Shadow-Effect////////////////
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Column(
                children: [
                  ImageTextArrowRow(
                    image: Assets.images.profilee.image(),
                    text: 'My Profile',
                    onTap: () {
                       Get.to(() => MyProfileScreen());
                    },
                  ),
                  // Divider()
                  Gap(10.h),
                  ImageTextArrowRow(
                    image: Assets.images.list.image(),
                    text: 'Transaction History',
                    onTap: () {
                      // Get.to(() => EditProfileScreen());
                    },
                  ),
                  Gap(10.h),
                  ImageTextArrowRow(
                    image: Assets.images.profileCard.image(),
                    text: 'Saved Cards',
                    onTap: () {
                      // Get.to(() => EditProfileScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
      
          Gap(40.h),
          //////////////Second-Profile-Utililty-Container/////////////
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.r),
              ///////////////////Correct-Shadow-Effect////////////////
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.1), // Slightly dark, neutral gray shadow
                  spreadRadius: 2, // Increases the size of the shadow
                  blurRadius: 5, // Makes the shadow softer
                  offset: Offset(0, 3), // Moves the shadow slightly downwards
                ),
              ],
            ///////////////////Correct-Shadow-Effect////////////////


              // boxShadow: [
              //   BoxShadow(
              //     color: AppColors.whiteColor,
              //     spreadRadius: 1,
              //     blurRadius: 1,
              //     offset: Offset(0, 1), // changes position of shadow
              //   ),
              // ],
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //////////////////Account-Settings-Text////////////////
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.w, top: 15.h
                    ),
                    child: Text('ACCOUNT SETTINGS',
                        style: AppText.fBTextBlackBold12),
                  ),
                  //////////////////Account-Settings-Text////////////////
      
                  Gap(15.h),
                  ImageTextArrowRow(
                    image: Assets.images.login.image(),
                    text: 'Login Settings',
                    onTap: () {
                      Get.to(() => LoginSettingsScreen());
                    },
                  ),
                  // Divider()
                  Gap(5.h),
                  ImageTextArrowRow(
                    image: Assets.images.profilePassword.image(),
                    text: 'Transaction PIN',
                    onTap: () {
                      Get.to(() => TransactionPinScreen());
                    },
                  ),
                  Gap(5.h),
                  ImageTextArrowRow(
                    image: Assets.images.link.image(),
                    text: 'Link to Fastlink Wifi Account',
                    onTap: () {
                      // Get.to(() => EditProfileScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
          Gap(50.h),
          ///////////////Logout-Button///////////////////
          Container(
            height: 40.h,
            width: MediaQuery.of(Get.context!).size.width,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.r),
              ///////////////////Correct-Shadow-Effect////////////////
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.1), // Slightly dark, neutral gray shadow
                  spreadRadius: 2, // Increases the size of the shadow
                  blurRadius: 5, // Makes the shadow softer
                  offset: Offset(0, 3), // Moves the shadow slightly downwards
                ),
              ],
            ///////////////////Correct-Shadow-Effect////////////////
            ),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 7.h, ),
                  child: Text('Log Out', style: AppText.fBTextBlackBoldMedium),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

// Reusable Widget
class ImageTextArrowRow extends StatelessWidget {
  final Widget image;
  final String text;
  final VoidCallback onTap;

  const ImageTextArrowRow({
    Key? key,
    required this.image,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:
            EdgeInsets.only(left: 10.0.w, right: 10.w, top: 15.h, bottom: 15.h),
        child: Container(
         // color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  horizontalSpace(35),
                  SizedBox(width: 24.w, height: 24.h, child: image),
                  horizontalSpace(15),
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
      ),
    );
  }
}
