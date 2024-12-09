import 'package:fastlink_app/core/app_routes.dart';
import 'package:fastlink_app/core/extentions.dart';
import 'package:fastlink_app/presentation/modules/airtime/buy_airtime/buy_airtime_screen.dart';
import 'package:fastlink_app/presentation/modules/data/buy_data/buy_data_controller.dart';
import 'package:fastlink_app/presentation/modules/data/buy_data/data_purchase.dart';
import 'package:fastlink_app/presentation/modules/home/home_page.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/indicators.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../utils/colors.dart';
import '../../../widgets/app_card.dart';
import '../../../widgets/phone_number/Phone_number_wrapper.dart';

const limited_time_offer = true;
bool isSuccessful = false;

class BuyDataScreen extends GetView<BuyDataController> {
  BuyDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Data'),
      ),
      body: RefreshIndicator(
        onRefresh: controller.fetchData,
        child: PhoneNumberWrapper(
          topBoxHeight: topBoxHeight,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                HeaderText('Select a data bundle'),
                gap20,
                GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 3,
                  children: List.generate(
                    9,
                    (_) => AppMaterial(
                      elevation: 0,
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      onTap: () {
                        _showBottomSheet(context);
                      },
                      // color: Colors.teal[100],
                      child: DataBundle(),
                    ),
                  ),
                ),
                Gap(20),
                Obx(
                  () => controller.plan_categories.value == null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: controller.plan_categories.value!.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 20),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final plan_category =
                                controller.plan_categories.value![index];
                            return AppMaterial(
                              margin: EdgeInsets.only(bottom: 20),
                              clipBehavior: Clip.antiAlias,
                              onTap: () {
                                Get.toNamed(
                                  Routes.dataPlan,
                                  arguments: (
                                    category: plan_category,
                                    discounts: controller.discounts.value
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Image.asset(
                                    plan_category.image,
                                    fit: BoxFit.cover,
                                    height: 130,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                plan_category.title,
                                                style: Get.textTheme.titleSmall
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              Gap(10),
                                              if (limited_time_offer &&
                                                  index == 0)
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.primary
                                                        .withOpacity(0.9),
                                                    borderRadius:
                                                        kRectangularRadius(),
                                                  ),
                                                  child: Text(
                                                    'February offer',
                                                    style: Get
                                                        .textTheme.bodySmall
                                                        ?.copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                              if (plan_category
                                                  .discount_available)
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.primary
                                                        .withOpacity(0.9),
                                                    borderRadius:
                                                        kRectangularRadius(),
                                                  ),
                                                  child: Text(
                                                    'Special Promo',
                                                    style: Get
                                                        .textTheme.bodySmall
                                                        ?.copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                )
                                            ],
                                          ),
                                        ),
                                        Gap(5),
                                        Wrap(
                                          children: plan_category.tips
                                              .map((e) => _build_tag(e))
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _build_tag(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Circle(color: Colors.black),
        Text(
          title,
          style: Get.textTheme.labelSmall?.copyWith(
              // fontWeight: FontWeight.w800,
              ),
        ),
        Gap(10)
      ],
    );
  }
}

class DataBundle extends StatelessWidget {
  const DataBundle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("1GB", style: FBText.fBTextBlackBoldMidMedium16),
      Text("30 days", style: FBText.fBTextBlackBoldMediumGrey),
      Text(
        "₦600",
        style: FBText.fBTextOrangeSmall,
      )
    ]);
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    enableDrag: false,
    builder: (BuildContext context) {
      return Container(
          height: 500,
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () => Get.back(),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'N600.00',
                          style: FBText.fBTextBlackBold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Gap(10),
                      ConfirmPaymentsDetailsWidget(
                        firstText: 'Product',
                        secondText: 'MobileData',
                        showImage: true,
                      ),
                      Gap(10),
                      ConfirmPaymentsDetailsWidget(
                        firstText: 'Amount',
                        secondText: 'N 600.00',
                        showImage: false,
                      ),
                      Gap(10),
                      ConfirmPaymentsDetailsWidget(
                        firstText: 'Recipient Mobile',
                        secondText: '08097654321',
                        showImage: false,
                      ),
                      Gap(10),
                      ConfirmPaymentsDetailsWidget(
                        firstText: 'Use points earned ',
                        secondText: '-N 50.00',
                        showImage: false,
                        showSwitch: true,
                      ),
                      Gap(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderText('Payment Method'),
                          Gap(30),
                          isSuccessful
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Assets.images.walletImage.image(),
                                          Gap(5),
                                          Text(
                                            'Wallet (N1000.00)',
                                            style: FBText
                                                .fBTextBlackBoldMidMedium16,
                                          )
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.check,
                                      color: FBColors.orangeColor,
                                    )
                                  ],
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Assets.images.walletImage.image(),
                                          Gap(15),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Wallet (N0.00)',
                                                style: FBText
                                                    .fBTextBlackBoldMidMedium16,
                                              ),
                                              Gap(6),
                                              Text(
                                                'Insufficient balance',
                                                style: FBText
                                                    .fBTextBlackBoldMedium,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Gap(5),
                                    CustomTextButton(
                                      onTap: () {
                                        // Get.put(TransactionController());
                                        // Get.to(() => TransactionScreen());
                                        Get.to(
                                            () => DataPurchaseStatusScreen());
                                      },
                                      text: 'Fund Wallet',
                                      color: FBColors.orangeColor,
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: FBColors.orangeColor,
                                        size: 10,
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                      Gap(40),
                      SizedBox(
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
                ]),
          ));
    },
  );
}

class ConfirmPaymentsDetailsWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final bool showImage;
  final bool showSwitch;
  final void Function(bool)? onSwitchChanged;

  ConfirmPaymentsDetailsWidget({
    required this.firstText,
    required this.secondText,
    this.showImage = false,
    this.showSwitch = false,
    this.onSwitchChanged,
    super.key,
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
        gap32,
        if (showImage) Assets.images.mtnLogo.image(height: 32, width: 32),
        Gap(4),
        Text(
          secondText,
          style: FBText.fBTextBlackBoldMiddMedium,
          textAlign: TextAlign.end,
        ),
        if (showSwitch) ...[
          Transform.scale(
            scale: 0.5,
            child: Switch(
              value: true,
              onChanged: onSwitchChanged,
              activeColor: FBColors.orangeColor,
              inactiveThumbColor: FBColors.orangeColor,
              inactiveTrackColor: Colors.white,
            ),
          ),
        ],
      ],
    );
  }
}
