import 'package:fastlink_app/constants/constants.dart';
import 'package:fastlink_app/presentation/modules/data/profile/profile_controller.dart';
import 'package:fastlink_app/presentation/modules/data/profile/profile_screen.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
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
      backgroundColor: FBColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ProfileAndNotification(),
      ),
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
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                  color: FBColors.orangeColor,
                  width: 1.0,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  // Instantiate the ProfilePageController before navigating
                  Get.put(ProfileController());
                  Get.to(() => ProfileScreen());
                },
                child: ClipOval(
                  child: Image.network(
                    kUrl,
                   // 'https://picsum.photos/200/200',
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),

            horizontalSpace(5),
            Text(
              'Hi, Rachael',
              style: FBText.fBTextBlackBold,
            ),
          ],
        ),
        
        Assets.images.notification.svg(),
        
      ],
    );
  
  }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? color;

  const CustomTextButton({
    Key? key,
    required this.text,
    this.leading,
    this.trailing,
    this.onTap,
    this.color, 
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
              color: color ??
                  Colors.orange, 
            ),
          ),
          horizontalSpace(5),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
