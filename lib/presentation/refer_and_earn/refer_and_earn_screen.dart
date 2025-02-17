import 'package:fastlink_app/presentation/utils/colors.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

bool referred = true;

class ReferAndEarnScreen extends StatelessWidget {
  const ReferAndEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refer & Earn'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20.h),
              ReferralEarnings(),
              Gap(20.h),
              ReferralStatus()
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////DEEP-SEEK-Code////////////////////////
class ReferralEarnings extends StatelessWidget {
  const ReferralEarnings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.referralColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
        child: Column(
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Gap(15.w),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Expanded(
                    child: Column(
                      children: [
                        Text('Your Referral Earnings',
                            style: AppText.fBTextBlackSmall),
                        Gap(8.w),
                        Text('₦200.00',
                            style: AppText.fBTextBlackBoldMidMedium16),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Assets.images.megaPhone.image(width: 42.w, height: 42.h),
                Gap(20.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReferralStatus extends StatelessWidget {
  const ReferralStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        referred
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Successful Referrals',
                    style: AppText.fBTextBlackMedium,
                  ),
                  Gap(40.h),
                  Assets.images.stuckAtHome.image(),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Successful Referrals (2 invitees)',
                    style: AppText.fBTextBlackMedium,
                  ),
                  Gap(40.h),
                  ReferralUserCard(name: 'John Doe'), 
                                    Gap(10.h),

                  ReferralUserCard(name: 'Tomiwa Joseph'), 
                                    Gap(10.h),

                  ReferralUserCard(name: 'Alice'),
                ],
              ),
        Gap(60.h),
        Center(
          child: Column(
            children: [
              Text(' Refer friends and family to grow your earnings. ',
                  style: AppText.fBTextBlackSmall),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'For every ',
                      style: AppText.fBTextBlackSmall,
                    ),
                    TextSpan(
                      text: 'two (2)',
                      style: AppText.fBTextOrangeSmall12,
                    ),
                    TextSpan(
                      text: ' successful referral, you earn;',
                      style: AppText.fBTextBlackSmall,
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              Text(' ₦200 ', style: AppText.fBTextOrangeBig),
              Gap(10.h),
              Text(
                  'Share your referral code (your phone number) below\n and start earning more:',
                  style: AppText.fBTextBlackSmall,
                  textAlign: TextAlign.center),
              Gap(40.h),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '08123456789',
                      style: AppText.fBTextBlackBoldMidMedium16,
                    ),
                    Gap(8.w),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: '08123456789'));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Copied to clipboard!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.copy,
                        color: FBColors.orangeColor,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(30.h),
              Text(
                'OR',
                style: AppText.fBTextBlackBoldMidMedium16,
              ),
              Gap(40.h),
              FBButton(
                height: 48.h,
                leading: Icon(
                  Icons.share,
                  color: FBColors.whiteColor,
                ),
                title: "Share link to invite",
                textColor: FBColors.whiteColor,
                color: FBColors.orangeColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/////////////////ReferralUserCard////////////////////////

class ReferralUserCard extends StatelessWidget {
  final String name;

  const ReferralUserCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    // Extract the first letter of the first and last names
    final initials = _getInitials(name);

    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: FBColors.orangeColor,
          child: Text(
            initials,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Gap(10.w),
        Text(
          name,
          style: AppText.fBTextBlackBoldMedium,
        ),
      ],
    );
  }

  // The Function to get the initials of the referred party name.
  String _getInitials(String name) {
    final names = name.split(' ');
    if (names.isEmpty) return '';
    if (names.length == 1) return names[0][0];

    // Get the first letter of the first and last names
    final firstNameInitial = names[0][0];
    final lastNameInitial = names[names.length - 1][0];
    return '$firstNameInitial$lastNameInitial';
  }
}
