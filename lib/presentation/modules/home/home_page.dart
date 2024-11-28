import 'package:fastlink_app/constants/constants.dart';
import 'package:fastlink_app/core/extentions.dart';
import 'package:fastlink_app/presentation/modules/data/profile/profile_controller.dart';
import 'package:fastlink_app/presentation/modules/data/profile/profile_screen.dart';
import 'package:fastlink_app/presentation/utils/colors.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/fund_wallet_card.dart';
import 'package:fastlink_app/presentation/widgets/quick_link.dart';
import 'package:fastlink_app/presentation/widgets/referral_tab.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/presentation/widgets/transaction_tab.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        title: AvatarAndGreeting(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.notification.svg(),
          )
        ],
      ),
      body: _homeBody(),
    );
  }

  Widget _homeBody() {
    return RefreshIndicator(
      key: controller.refreshIndicatorKey,
      onRefresh: controller.refresh,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FundWalletCard(),
              gap20,
              QuickLink(),
              gap20,
              TransactionTab(),
              gap24,
              ReferralTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class AvatarAndGreeting extends StatelessWidget {
  const AvatarAndGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
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
                  Get.put(ProfileController());
                  Get.to(() => ProfileScreen());
                },
                child: ClipOval(
                  child: Image.network(
                    kUrl,
                    fit: BoxFit.cover,
                    width: 29,
                    height: 29,
                  ),
                ),
              ),
            ),
            gap8,
            Text('Hi, Rachael').applyStyle(fontSize: 20),
          ],
        ),
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
              color: color ?? Colors.orange,
            ),
          ),
          horizontalSpace(5),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
