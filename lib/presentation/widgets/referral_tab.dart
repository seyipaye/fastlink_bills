import 'package:fastlink_app/presentation/utils/colors.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReferralTab extends StatelessWidget {
  const ReferralTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Assets.images.notificationB.svg(),
          Gap(24),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Earn Big by Referring a Friend!',
              style: FBText.fBTextBlackBoldMedium,
            ),
            Gap(8),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Each referral helps you save on your bills-\n because every penny counts!',
              style: FBText.fBTextBlacklittle,
              textAlign: TextAlign.start, 
            ),
          ),

            // RichText(
            //   text: TextSpan(
            //     children: [
            //       TextSpan(
            //           text: 'Earn Big by Referring a Friend!\n',
            //           style: FBText.fBTextBlackBoldMedium),
            //       WidgetSpan(
            //         child: SizedBox(height: 30),
            //       ),
            //       TextSpan(
            //           text:
            //               'Each referral helps you save on your bills - \n',
            //           style: FBText.fBTextBlacklittle),
            //       TextSpan(
            //         text: 'because every penny counts!',
            //         style: FBText.fBTextBlacklittle,
            //       ),
            //     ],
            //   ),
            // ),
            Gap(8),
            SizedBox(
              width: 100,
              height: 30,
              child: FBButton(
                title: 'Get Started',
                color: FBColors.orangeColor,
                textColor: FBColors.whiteColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ]),
        ],
      ),
    );
  }
}
