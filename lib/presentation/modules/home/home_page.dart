import 'package:fastlink_app/core/extentions.dart';
import 'package:fastlink_app/presentation/modules/data/profile/profile_controller.dart';
import 'package:fastlink_app/presentation/modules/data/profile/profile_screen.dart';
import 'package:fastlink_app/presentation/utils/colors.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/referral_tab.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/presentation/widgets/transaction_tab.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routes.dart';
import '../../utils/strings.dart';
import '../../utils/styles/fb_button.dart';
import '../../widgets/app_card.dart';
import '../../widgets/visible_text.dart';
import '../fund_wallet/fund_wallet_screen.dart';
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
              ReferralTab()
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

class FundWalletCard extends StatelessWidget {
  const FundWalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        // color: Color(0xFFFFFBFB),
        color: AppColors.primary.withOpacity(0.05),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wallet Balance',
                  style: FBText.fBTextBlackBoldMedium,
                ),
                gap20,
                VisibilityToggleText(
                  text: '10000',
                  textStyle: FBText.fBTextBlackBoldMidMedium16,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 110,
            height: 28,
            child: FBButton(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              title: 'Fund wallet',
              leading: Icon(
                Icons.add,
                color: FBColors.whiteColor,
              ),
              color: FBColors.orangeColor,
              textColor: FBColors.whiteColor,
              onTap: () {
                Get.to(() => FundWalletScreen());
              },
            ),
          )
        ],
      ),
    );
  }
}

class QuickLink extends StatelessWidget {
  const QuickLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText('Quick Links'),
        gap16,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildActionButton(
              image: Assets.icons.phone.svg(),
              text: 'Buy Airtime',
              onPressed: () {
                Get.toNamed(Routes.buyAirtime);
              },
            ),
            buildActionButton(
              image: Assets.icons.cellphoneSound.svg(),
              text: 'Buy Data',
              onPressed: () {
                Get.toNamed(Routes.buyData);
              },
            ),
            buildActionButton(
              image: Assets.icons.fastlinkWifi.svg(),
              text: 'Fastlink Wifi',
              onPressed: () {},
            ),
            buildActionButton(
              image: Assets.icons.announce.svg(),
              text: 'Refer and Earn',
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: FBText.fBTextBlackBoldMedium,
    );
  }
}

Widget buildActionButton({
  required String text,
  required VoidCallback onPressed,
  required Widget image,
}) {
  return AppMaterial(
    padding: EdgeInsets.all(8),
    onTap: onPressed,
    color: Colors.transparent,
    elevation: 0,
    child: Column(
      children: [
        image,
        gap8,
        Text(
          text,
          textAlign: TextAlign.center,
        ).applyStyle(fontSize: 12, bold: true),
      ],
    ),
  );
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
