import 'package:clipboard/clipboard.dart';
import 'package:fastlink_app/core/extentions.dart';
import 'package:fastlink_app/data/user/user.dart';
import 'package:fastlink_app/presentation/modules/wallet/card_payment/cards_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/card_payment/fund_with_card/fund_wallet_card.dart';
import 'package:fastlink_app/presentation/modules/wallet/card_payment/fund_with_card/fund_with_card_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/kyc/kyc_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/kyc/kyc_screen.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/app_card.dart';
import 'package:fastlink_app/presentation/widgets/app_text_form_field.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:pwa_install/pwa_install.dart' as pwa;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/column_pro.dart';
import 'fund_wallet_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FundWalletScreen extends GetView<FundWalletController> {
  FundWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FBColors.whiteColor,
      appBar: AppBar(
        title: Text('Fund Wallet'),
      ),
      body: _fundWalletView(),
    );
  }

  Widget _fundWalletView() {
    return ListView(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      children: [
        PaymentWidget(
          image: Assets.images.bankSvg.svg(),
          bigDescription: 'Bank Transfer',
          smallDescription:
              'Fund your wallet via mobile or internet \nbanking at no cost.',
          onTap: () {
            // Instantiate the ProfilePageController before navigating
            Get.put(KycController());
            Get.to(() => KycScreen());
          },
        ),
        verticalSpace(20),
        PaymentWidget(
          image: Assets.images.cardSvg.svg(),
          bigDescription: 'Debit Card',
          smallDescription:
              'Fund wallet directly from your bank card \nor account at 0.4% ',
          onTap: () {
            // Instantiate the ProfilePageController before navigating
            Get.put(FundWithCardController());
            Get.to(() => FundWithCardScreen());
          },
        ),
      ],
    );
  }
}

class PaymentWidget extends StatelessWidget {
  final String bigDescription;
  final String smallDescription;
  final Widget image;
  final VoidCallback? onTap;

  const PaymentWidget({
    Key? key,
    required this.bigDescription,
    required this.smallDescription,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMaterial(
      onTap: onTap,
      elevation: 0,
      radius: 10,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          image,
          //SizedBox(width: 16),
          gap20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(bigDescription, style: FBText.fBTextBlackBold12),
                gap8,
                Text(
                  smallDescription,
                  style: FBText.fBTextBlacklittle,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class PaymentErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/images/404.png'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [kDropShadow(0, 0, 16)],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Oops! Something went wrong',
                            style: Get.textTheme.titleMedium,
                          ),
                          Gap(20),
                          Text(
                            "Your device is having trouble connecting to the internet. \nPlease try the following troubleshooting tips:",
                            style: Get.textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                _buildItem(
                                  text:
                                      'Make sure you are connected to the internet',
                                ),
                                Gap(20),
                                _buildItem(
                                  text:
                                      "If you are connected to 'Fastlink-Internet', try turning your Wi-Fi off and on again, and claim the '20MB Free data'",
                                ),
                                Gap(20),
                                _buildItem(
                                  text:
                                      "Try claiming the '20 MB Free Data' again",
                                ),
                              ],
                            ),
                          ),
                          Gap(20),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Get.textTheme.labelMedium,
                              text:
                                  "If the issue persists, please contact our ",
                              children: [
                                TextSpan(
                                  text: 'support team',
                                  style: TextStyle(color: AppColors.primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      final phoneNumber = kSupport;
                                      final smsUri =
                                          Uri(scheme: 'sms', path: phoneNumber);
                                      try {
                                        if (await canLaunchUrl(
                                          smsUri,
                                        )) {
                                          await launchUrl(smsUri);
                                        }
                                      } catch (e) {
                                        Get.snackbar('Some error occured', '');
                                      }
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Back'),
                        style:
                            OutlinedButton.styleFrom(fixedSize: Size(258, 0)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildItem({
    required String text,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icons/bullet.png'),
        Gap(8),
        Expanded(
          child: Text(
            text,
            style: Get.textTheme.labelMedium,
          ),
        )
      ],
    );
  }
}

class AndroidPaymentPromptPage extends GetView<FundWalletController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SvgPicture.asset(
                'assets/images/android_prompt.svg',
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [kDropShadow(0, 0, 16)],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Using an Android Phone?',
                            style: Get.textTheme.titleLarge,
                          ),
                          Gap(20),
                          Text(
                            "It appears like you are using an Android Phone, and \ndon’t have an active Internet connection",
                            style: Get.textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                          Gap(40),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Here is what to do',
                              style: Get.textTheme.titleMedium,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                if (pwa.PWAInstall().installPromptEnabled)
                                  _buildItem(
                                    text:
                                        'Use our Web App for the best experience.',
                                    cta_text: 'Install Web App',
                                    onPressed: controller.onInstallPressed,
                                  ),
                                Gap(20),
                                _buildItem(
                                  text:
                                      "Claim a little data temporarily to fund your wallet",
                                  cta_text: 'Claim Free Data',
                                  onPressed: controller.onContinuePressed,
                                ),
                              ],
                            ),
                          ),
                          Gap(20),
                        ],
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Get.textTheme.labelMedium,
                          text: "If the issue persists, please \ncontact our ",
                          children: [
                            TextSpan(
                              text: 'support team',
                              style: TextStyle(color: AppColors.primary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  final phoneNumber = kSupport;
                                  final smsUri =
                                      Uri(scheme: 'sms', path: phoneNumber);
                                  try {
                                    if (await canLaunchUrl(
                                      smsUri,
                                    )) {
                                      await launchUrl(smsUri);
                                    }
                                  } catch (e) {
                                    Get.snackbar('Some error occured', '');
                                  }
                                },
                            ),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Back'),
                        style:
                            OutlinedButton.styleFrom(fixedSize: Size(258, 0)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildItem({
    required String text,
    required String cta_text,
    required VoidCallback onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('assets/icons/bullet.png'),
        Gap(8),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: Get.textTheme.labelMedium,
            text: text + "\n",
            children: [
              TextSpan(
                text: cta_text,
                style: TextStyle(color: AppColors.primary),
                recognizer: TapGestureRecognizer()..onTap = onPressed,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ContinueDialog extends StatelessWidget {
  ContinueDialog({
    super.key,
    required this.onContinuationPressed,
    required this.user_data,
  });

  final VoidCallback onContinuationPressed;
  final UserData user_data;
  final agreedToTerm = false.obs;
  final copied = false.obs;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Good News 😊',
              style: Get.textTheme.titleLarge,
            ),
            Gap(20),
            Text(
              "We will give you 10MB temporarily to subscribe to a data plan.\nYou have ${user_data.free_data_attempts_left} of ${user_data.free_data_attempts_max} attempts left.",
              style: Get.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            Gap(20),
            Text(
              "Kindly copy the link below, paste it into your \nbrowser app, and fund your wallet",
              style: Get.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            Gap(40),
            AppTextFormField(
              hintText: 'portal.usefastlink.com',
              readOnly: true,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      thickness: 1,
                      width: 20,
                      color: AppColors.hint,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      FlutterClipboard.copy('https://portal.usefastlink.com')
                          .then((value) => copied.value = true)
                          .catchError((error) {
                        GetSnackBar(
                          message: 'Click the check box to agree to the term',
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                        );
                        return true;
                      });
                    },
                    child: Obx(() => Text(
                          copied.value == false ? "Copy" : "Copied",
                          style: Get.textTheme.bodySmall?.copyWith(
                            color: AppColors.primary,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Gap(30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Checkbox(
                    value: agreedToTerm.value,
                    activeColor: AppColors.primary,
                    onChanged: (val) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      agreedToTerm.value = true;
                    },
                  ),
                ),
                Gap(10),
                Expanded(
                  child: Text(
                    'I agree to paste the link in my browser, and subscribe to a data plan immediately',
                    textAlign: TextAlign.start,
                    style: Get.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            Gap(24),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                if (agreedToTerm.value == true) {
                  Get.back();
                  onContinuationPressed();
                } else {
                  Get.showSnackbar(
                    GetSnackBar(
                      message: 'Click the check box to agree to the term',
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Container(
                width: 120,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "Continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 36, 16, 35),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Text(
                  'Payment methods',
                  style: Get.textTheme.titleSmall,
                ),
                Text(
                  'Choose your preferred payment option',
                  style: Get.textTheme.bodySmall,
                ),
              ],
            ),
            Gap(34),
            OutlineMaterial(
              child: Text('Pay with card'),
              onTap: () async {
                await kAnimationDelay;
                Get.back(result: 'card');
              },
            ),
            Gap(20),
            OutlineMaterial(
              child: Text('Other payment methods'),
              onTap: () async {
                await kAnimationDelay;
                Get.back(result: 'others');
              },
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}

class CardSelectionBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 36, 16, 35),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Card Tansaction',
              style: Get.theme.appBarTheme.titleTextStyle,
              textAlign: TextAlign.center,
            ),
            Gap(36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saved cards',
                      style: Get.textTheme.titleSmall,
                    ),
                    Text(
                      'List of all cards you saved',
                      style: Get.textTheme.bodySmall,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.back(result: 'new_card');
                  },
                  child: Text(
                    'Use a new card',
                    style: Get.textTheme.labelMedium
                        ?.apply(color: AppColors.primary),
                  ),
                )
              ],
            ),
            Expanded(
              child: GetX<CardsSelectionController>(
                init: CardsSelectionController(),
                builder: (controller) => controller.cards.value == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.cards.value?.isEmpty ?? false
                        ? Center(
                            child: Text(
                              'Oops, no saved card. \nkindly add a new card up there',
                              textAlign: TextAlign.center,
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.cards.value!.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 20),
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final debitCard = controller.cards.value![index];

                              return Padding(
                                padding: EdgeInsetsDirectional.only(top: 20),
                                child: OutlineMaterial(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 15,
                                  ),
                                  onTap: () {
                                    Get.back(result: debitCard);
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${debitCard.card_type.capitalize!} XXXX ${debitCard.last4}',
                                              style: Get.textTheme.labelMedium,
                                            ),
                                            Text(
                                              'Expires ${debitCard.exp_month}/${debitCard.exp_year}',
                                              style: Get.textTheme.labelSmall,
                                            )
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.delete_card(debitCard.id);
                                        },
                                        icon: Image.asset(
                                          'assets/icons/trash.png',
                                          height: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ),
            Gap(36),
          ],
        ),
      ),
    );
  }
}
