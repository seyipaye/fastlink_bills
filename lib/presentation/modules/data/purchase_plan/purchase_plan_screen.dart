import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../utils/colors.dart';
import '../../../widgets/app_card.dart';

import '../../../widgets/money_text_view.dart';
import 'purchase_plan_controller.dart';

class PurchasePlanScreen extends GetView<PurchasePlanController> {
  PurchasePlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Purchase Data Plan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Data Plan Information
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.plan.title,
                    style: Get.textTheme.bodyLarge,
                  ),
                  Gap(15),
                  Text(
                    'Valid for ${controller.plan.days_to_use} days',
                    style: Get.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            // Order Summary
            GetX<PurchasePlanController>(
              builder: (_) {
                return AppMaterial(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  elevation: 0,
                  color: Colors.grey.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sub total'),
                          MoneyText(
                            controller.plan.price,
                          ),
                        ],
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Discount'),
                          MoneyText(controller.amount_discounted),
                        ],
                      ),
                      Gap(15),
                      DottedLine(
                        dashLength: 3,
                        dashGapLength: 3,
                        lineThickness: 0.5,
                      ),
                      Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Grand Total',
                            style: Get.textTheme.bodyLarge,
                          ),
                          MoneyText(
                            controller.plan.price -
                                controller.amount_discounted,
                            style: Get.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Gap(20),
            ElevatedButton(
              onPressed: controller.purchasePlan,
              child: Text('Proceed To Pay'),
            ),

            // Discount Section
            if (controller.discount_is_available)
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      // AppBar(
                      //   title: Text('data'),
                      // ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 5, bottom: 10),
                        child: Text(
                          'Available discounts',
                          style: Get.textTheme.titleSmall,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 20, top: 10),
                          itemCount: controller.discounts!.length,
                          itemBuilder: (context, index) {
                            final discount = controller.discounts![index];
                            final days_left = discount.expiry
                                .difference(controller.currentDate)
                                .inDays;
                            final orders_left =
                                discount.max_usage - discount.usage_count;
                            return GetX<PurchasePlanController>(
                              builder: (_) {
                                return OutlineMaterial(
                                  color: controller.selected_discount.value ==
                                          discount
                                      ? AppColors.primary
                                      : null,
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  radius: 10,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${discount.title.capitalizeFirst} for $orders_left " +
                                                  (orders_left > 1
                                                      ? 'orders'
                                                      : 'order'),
                                              style: Get.textTheme.titleMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Gap(5),
                                            DefaultTextStyle(
                                              style: Get.textTheme.labelSmall!,
                                              child: Row(
                                                children: [
                                                  Text('Maximum promo '),
                                                  MoneyText(
                                                    discount.max_price,
                                                    shrink: true,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Expires in',
                                            style: Get.textTheme.labelSmall!,
                                          ),
                                          Gap(5),
                                          Text(
                                            days_left > 1
                                                ? '$days_left days'
                                                : '$days_left day',
                                            style: Get.textTheme.titleLarge,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    controller.selected_discount.value =
                                        discount;
                                  },
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            Gap(20)
          ],
        ),
      ),
    );
  }
}
