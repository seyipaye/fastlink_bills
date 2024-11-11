import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/app_card.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class QuickLink extends StatelessWidget {
  const QuickLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: FBText.fBTextBlackBoldMedium,
        ),
        Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildActionButton(
                image: Assets.images.phone.image(),
                text: 'Buy Airtime',
                onPressed: () {}),
            horizontalSpace(10),
            buildActionButton(
                image: Assets.images.cellphoneSound.image(),
                text: 'Buy Data',
                onPressed: () {}),
            horizontalSpace(10),
            buildActionButton(
                image: Assets.images.announcenmt.image(),
                text: 'Refer and Earn',
                onPressed: () {}),
          ],
        )
      ],
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
    boxShadow: [],
    child: Column(
      children: [
        image,
        Text(
          text,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
