import 'package:fastlink_app/presentation/modules/data/profile/profile_controller.dart';
import 'package:fastlink_app/presentation/modules/data/profile/profile_screen.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/fund_wallet_card.dart';
import 'package:fastlink_app/presentation/widgets/quick_link.dart';
import 'package:fastlink_app/presentation/widgets/referral_tab.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/presentation/widgets/transaction_tab.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _homeBody(),
    );
  }

  Widget _homeBody() {
    return RefreshIndicator(
      key: controller.refreshIndicatorKey,
      onRefresh: controller.refresh,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileAndNotification(),
                verticalSpace(20),
                FundWalletCard(),
                verticalSpace(20),
                QuickLink(),
                verticalSpace(20),
                TransactionTab(),
                verticalSpace(40),
                ReferralTab()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileAndNotification extends StatelessWidget {
  const ProfileAndNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.orange, // Border color
                  width: 1.0, // Border width
                ),
              ),
              child: IconButton(
                onPressed: () {
                  // Instantiate the ProfilePageController before navigating
                  Get.put(ProfileController());
                  Get.to(() => ProfileScreen());
                },
                icon: Icon(Icons.person),
                iconSize: 15,
              ),
            ),
            horizontalSpace(5),
            Text(
              'Hi, Rachael',
              style: FBText.fBTextBlackBold,
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            // Instantiate the ProfilePageController before navigating
            //  Get.put(ProfileController());
            //     Get.to(() => ProfileScreen());
          },
          icon: Icon(Icons.notifications),
          iconSize: 25,
          color: FBColors.blackColor,
        ),
      ],
    );
  }
}






//Information coming from the server.
class TransactionsData extends StatelessWidget {
  const TransactionsData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Assets.images.phone.image(width: 80, height: 40),
        horizontalSpace(7),
        Column(
          children: [
            Text(
              'Airtime Purchase',
              style: FBText.fBTextBlackBoldMidMedium,
            ),
            verticalSpace(7),
            Text(
              'Sep 5th, 18;25',
              style: FBText.fBTextBlacklittle,
            ),
          ],
        ),
        horizontalSpace(40),
        Text(
          '-200',
          style: FBText.fBTextBlackBoldMidMedium,
        )
      ],
    );
  }
}


class CustomTextButton extends StatelessWidget {
  final String text;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? color; // Optional color parameter

  const CustomTextButton({
    Key? key,
    required this.text,
    this.leading,
    this.trailing,
    this.onTap,
    this.color, // Allow users to pass a color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) leading!,
          Text(
            text,
            style: FBText.fBTextOrangeSmall.copyWith(
              color: color ?? Colors.orange, // Default to orange if color is not provided
            ),
          ),
          horizontalSpace(5),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
