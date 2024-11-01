
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';

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
        verticalSpace(3),
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

Column buildActionButton({
  required String text,
  required VoidCallback onPressed,
  required Widget image,
}) {
  return Column(
    children: [
      RawMaterialButton(
        onPressed: onPressed,
        elevation: 0.0,
        shape: const CircleBorder(),
        fillColor: Colors.transparent,
        padding: EdgeInsets.zero,
        child: image,
      ),
      Text(
        text,
        style: TextStyle(fontSize: 12),
        textAlign: TextAlign.center,
      ),
    ],
  );
}