import 'package:fastlink_app/core/extentions.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../resources/assets.gen.dart';
import '../../../utils/colors.dart';
import '../../../utils/styles/color.dart';
import '../../../utils/styles/fb_button.dart';
import '../../../utils/styles/text_size.dart';
import '../../../widgets/app_card.dart';
import '../../../widgets/app_text_form_field.dart';
import '../../../widgets/app_buttons.dart';
import '../../../widgets/phone_number/Phone_number_wrapper.dart';
import '../../data/buy_data/data_purchase.dart';
import '../../home/home_page.dart';
import 'buy_airtime_controller.dart';

const limited_time_offer = true;

const double topBoxHeight = 70;

class BuyAirtimeScreen extends GetView<BuyAirtimeController> {
  BuyAirtimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Airtime'),
      ),
      body: RefreshIndicator(
        onRefresh: controller.fetchData,
        child: PhoneNumberWrapper(
          topBoxHeight: topBoxHeight,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                HeaderText('Enter or Select amount'),
                gap20,
                GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  // padding: const EdgeInsets.symmetric(horizontal: 20),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 2,
                  children: List.generate(
                    9,
                    (_) => AppMaterial(
                      elevation: 0,
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      onTap: () {},
                      // color: Colors.teal[100],
                      child: const Text("₦ 1000").applyStyle(
                        bold: true,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                gap20,
                AppTextFormField(
                  // textEditingController: controller.emailText,
                  // label: 'Email Address',
                  inputFormatters: <TextInputFormatter>[kMoneyFormatter],
                  hintText: '50-100,000',
                  textInputType: TextInputType.number,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  prefixIcon: kNairaIcon,
                ),
                gap24,
                AppElevatedButton(
                  text: 'Continue',
                  onPressed: () async {
                    final result = await Get.bottomSheet(
                      ConfirmationBottomSheet(),
                      isScrollControlled: true,
                      ignoreSafeArea: false,
                    );
                    // _showBottomSheet(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmationBottomSheet extends StatelessWidget {
  const ConfirmationBottomSheet({
    super.key,
  });

  final bool insufficientBalance = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppIconButton2(
                      width: 25,
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  gap20,
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '₦',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.text,
                          fontFamily: kRaleway500,
                        ),
                        children: [
                          TextSpan(
                            text: '600.00',
                            style: TextStyle(
                              fontSize: 36,
                              color: AppColors.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  gap20,
                  DetailListTile(
                    firstText: 'Product',
                    secondText: 'MobileData',
                    networkImagePath: kMTNLogo,
                  ),
                  gap8,
                  DetailListTile(
                    firstText: 'Amount',
                    secondText: '₦ 600',
                  ),
                  gap16,
                  DetailListTile(
                    firstText: 'Recipient Mobile',
                    secondText: '08097654321',
                  ),
                  /* gap16,
                  DetailListTile(
                    firstText: 'Recipient Mobile',
                    secondText: '08097654321',
                  ), */
                  gap16,
                  DetailListTile(
                    firstText: 'Use points earned ',
                    secondText: '-₦ 50',
                    usePoints: true,
                    onSwitchChanged: (value) {},
                  ),
                  gap16,
                  gap24,
                ],
              ),
            ),
            Container(
              height: 64,
              color: AppColors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Assets.images.walletImage.image(),
                  gap16,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Wallet ',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.text,
                              fontFamily: kRaleway600,
                            ),
                            children: [
                              TextSpan(
                                text: '(₦1000)',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.light_text,
                                  fontFamily: kRaleway600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Text(
                        //   'Wallet (₦1000)',
                        //   style: FBText.fBTextBlackBoldMidMedium16,
                        // ),
                        if (insufficientBalance)
                          Text(
                            'Insufficient balance',
                          ).applyStyle(
                            bold: true,
                            color: AppColors.light_text,
                          )
                      ],
                    ),
                  ),
                  if (insufficientBalance)
                    CustomTextButton(
                      onTap: () {
                        // Get.put(TransactionController());
                        // Get.to(() => TransactionScreen());
                        Get.to(() => DataPurchaseStatusScreen());
                      },
                      text: 'Fund Wallet',
                      color: FBColors.orangeColor,
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: FBColors.orangeColor,
                        size: 10,
                      ),
                    ),
                  if (!insufficientBalance)
                    Icon(
                      size: 20,
                      Icons.check,
                      color: FBColors.orangeColor,
                    )
                ],
              ),
            ),
            gap24,
            Container(
              padding: EdgeInsets.only(left: 24, right: 24),
              height: 50,
              child: FBButton(
                title: 'Confirm Payment',
                onTap: () => Navigator.pop(context),
                color: FBColors.orangeColor,
                textColor: FBColors.whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailListTile extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String? networkImagePath;
  final bool? usePoints;
  final ValueChanged<bool>? onSwitchChanged;

  DetailListTile({
    required this.firstText,
    required this.secondText,
    this.onSwitchChanged,
    super.key,
    this.networkImagePath,
    this.usePoints,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            firstText,
            style: FBText.fbLightBlactText,
          ),
        ),
        gap16,
        if (networkImagePath != null)
          Image.asset(
            networkImagePath!,
            height: 32,
            width: 32,
          ),
        if (networkImagePath != null) gap16,
        Text(
          secondText,
          style: FBText.fBTextBlackBoldMiddMedium,
        ),
        if (onSwitchChanged != null) gap8,
        if (onSwitchChanged != null)
          SizedBox(
            width: 32,
            child: Transform.scale(
              scale: 0.6,
              child: CupertinoSwitch(
                value: usePoints ?? false,
                onChanged: onSwitchChanged,
                activeColor: AppColors.primary,
                // inactiveThumbColor: FBColors.orangeColor,
                // inactiveTrackColor: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
