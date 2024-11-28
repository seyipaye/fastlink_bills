import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../widgets/column_pro.dart';
import '../bank_transfer_controller.dart';

class IdentityProofPage extends GetView<BankTransferController> {
  const IdentityProofPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleScrollViewColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(5),
        Text(
          'Proof of Identity',
          style: FBText.fBTextOrangeBig,
        ),
        Gap(6),
        Text(
          'Please provide your Bank Verification \nNumber (BVN). Your BVN allows us to verify your account and protect you from fraud.',
          style: FBText.fBTextBlackMedium,
        ),
        Gap(50),
        AppTextFormField(
          label: 'BVN',
          hintText: 'Enter 12 digits BVN',
        ),
        gap24,
        Expanded(child: SizedBox.shrink()),
        Column(
          children: [
            BvnText(
              description:
                  'Your BVN is a secure number issued by the Central Bank of Nigeria.',
            ),
            Gap(10),
            BvnText(
              description:
                  'We only use your BVN for identity verification and comply with strict data privacy regulations.',
            ),
            Gap(10),
            BvnText(
              description:
                  'This process helps us keep your account safe and ensures that only you have access to it.',
            ),
          ],
        ),
        gap24,
        SizedBox(
          // width: 340,
          height: 50,
          child: FBButton(
            title: 'Proceed',
            textColor: FBColors.whiteColor,
            color: FBColors.orangeColor,
            onTap: controller.page2Submit,
          ),
        ),
        gap32,
      ],
    );
  }
}

class BvnText extends StatelessWidget {
  final String description;
  const BvnText({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: Colors.black,
          size: 3.0,
        ),
        Gap(10),
        Expanded(
          child: Text(
            description,
            style: FBText.fBTextBlackBoldMedium,
          ),
        )
      ],
    );
  }
}
