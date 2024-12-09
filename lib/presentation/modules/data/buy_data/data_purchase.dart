import 'package:fastlink_app/presentation/modules/home/home_page.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DataPurchaseStatusScreen extends StatelessWidget {
  const DataPurchaseStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    text: 'Done',
                    color: FBColors.greenColor,
                  ),
                ],
              ),
              Gap(20),
              Column(
                children: [
                  Assets.images.greenMark.image(),
                  Gap(20),
                  Text(
                    'Data Purchase Successful',
                    style: AppText.fBTextBlackBoldMidMedium16,
                  ),
                  Gap(20),
                  Text(
                    'N600',
                    style: AppText.fBTextBlackBigBold24,
                  ),
                  Gap(10),
                  
                  Gap(30),
                  SizedBox(
                      height: 50,
                      child: FBButton.outline(
                        color: FBColors.orangeColor,
                        textColor: FBColors.orangeColor,
                        title: 'View Reciept',
                        onTap: () {},
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
