import 'package:fastlink_app/core/app_routes.dart';
import 'package:fastlink_app/core/extentions.dart';
import 'package:fastlink_app/presentation/modules/airtime/buy_airtime/buy_airtime_screen.dart';
import 'package:fastlink_app/presentation/modules/data/buy_data/buy_data_controller.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/indicators.dart';
import 'package:fastlink_app/presentation/widgets/quick_link.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../utils/colors.dart';
import '../../../widgets/app_card.dart';
import '../../../widgets/money_text_view.dart';

const limited_time_offer = true;

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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mobile Data Bundles',
                  style: FBText.fBTextOrangeBigMedium,
                ),
              ),
              NetworkSelector(),
              gap8,
              HeaderText('Select data bundle'),
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
                    onTap: () {},
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
                                                  style: Get.textTheme.bodySmall
                                                      ?.copyWith(
                                                          color: Colors.white),
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
                                                  style: Get.textTheme.bodySmall
                                                      ?.copyWith(
                                                          color: Colors.white),
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
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "1GB",
            style: FBText.fBTextBlackBoldMidMedium16
          ),
          Text(
            "30 days",
            style: FBText.fBTextBlackBoldMediumGrey
          ),
          Text(
            "₦600",
            style: FBText.fBTextOrangeSmall,
        )]);
  }
}