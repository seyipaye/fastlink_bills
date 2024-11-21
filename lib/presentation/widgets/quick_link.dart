import 'package:fastlink_app/core/extentions.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/app_card.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../core/app_routes.dart';

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
