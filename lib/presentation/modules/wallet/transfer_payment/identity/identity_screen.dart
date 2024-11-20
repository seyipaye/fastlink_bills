import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/congratulations/congrats_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/congratulations/congrats_screen.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/identity/identity_controller.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/app_text_form_field.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class IdentityScreen extends GetView<IdentityController> {
  const IdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FBColors.whiteColor,
      appBar: AppBar(
        title: Text('Fund Wallet by Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(5),
              Text(
                'Proof of Identity',
                style: FBText.fBTextOrangeBig,
              ),
              Gap(6),
              Text(
                'Please provide your Bank Verification Number (BVN). Your BVN allows us to verify your account and protect you from fraud.',
                style: FBText.fBTextBlackBoldMedium,
              ),
              Gap(50),
              AppTextFormField(
                label: 'BVN',
                hintText: 'Enter 12 digits BVN',
              ),
              Gap(80),
              Column(
                children: [
                  BvnText(
                    description:
                        'Your BVN is a secure number issued by the Central Bank of Nigeria.',
                  ),
                  Gap(10),
                  BvnText(
                    description:
                        'Your BVN is a secure number issued by the Central Bank of Nigeria.',
                  ),
                  Gap(10),
                  BvnText(
                    description:
                        'Your BVN is a secure number issued by the Central Bank of Nigeria.',
                  ),
                ],
              ),
              Gap(100),
              SizedBox(
                // width: 340,
                height: 50,
                child: FBButton(
                  title: 'Proceed',
                  textColor: FBColors.whiteColor,
                  color: FBColors.orangeColor,
                  onTap: () {
                    // Instantiate the ProfilePageController before navigating
                    Get.put(CongratsController());
                    Get.to(() => CongratsScreen());
                  },
                ),
              )
            ],
          ),
        ),
      ),
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

        Flexible(
          child: Text(
            description,
            style: FBText.fBTextBlackBoldMedium,
          ),
        )
      ],
    );
  }
}
