import 'package:fastlink_app/presentation/modules/home/home_page.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes.dart';
import '../../airtime/buy_airtime/buy_airtime_screen.dart';

class DataPurchaseStatusScreen extends StatelessWidget {
  const DataPurchaseStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Gap(80),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(
                    onTap: () {
                      Get.until((route) => Get.currentRoute == Routes.home);
                    },
                    text: 'Done',
                    color: FBColors.greenColor,
                  ),
                ],
              ),
              Gap(20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Assets.images.greenMark.image(),
                        Gap(20),
                        Text(
                          'Data Purchase Successful',
                          style: FBText.fBTextBlackBoldMidMedium16,
                        ),
                        gap8,
                        MoneyText(
                          '600',
                          fontSize: 32,
                        ),
                        gap24,
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: FBButton.outline(
                            color: FBColors.orangeColor,
                            textColor: FBColors.orangeColor,
                            title: 'View Reciept',
                            onTap: () {},
                          ),
                        ),
                        gap32,
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
