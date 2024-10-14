import 'package:fastlink_app/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:fastlink_app/presentation/widgets/app_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:readmore/readmore.dart';
import '../../../core/app_routes.dart';
import '../../../../core/extentions.dart';

import '../../utils/constants.dart';
import '../../widgets/money_text_view.dart';
import 'home_controller.dart';

const message =
    '''Note: We are suspending operations from Friday 8th December, 2023 - Monday 8th January, 2024  
              
We will be closed for the year officially, but we promise to resume with a much better service

Be rest assured that your deposits are fully secured and will be made available on resumption of our operations

Till then, do have a wonderful holiday

Merry Christmas and a Happy New Year in Advance 💫

''';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello ${(controller.user.value.name ?? controller.user.value.username)}!',
        ),
        automaticallyImplyLeading: false,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      key: controller.refreshIndicatorKey,
      onRefresh: controller.refresh,
      child: ListView(
        children: [
          AppMaterial(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            color: AppColors.blue,
            child: DefaultTextStyle(
              style: TextStyle(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(controller.user.value.profile)),
                      Image.asset(
                        'assets/images/fast_link_logo_compact.png',
                        width: 60,
                      )
                    ],
                  ),
                  Gap(10),
                  Container(
                    height: 110,
                    width: 110,
                    alignment: Alignment.centerLeft,
                    child: GetX<HomePageController>(
                      init: HomePageController(),
                      builder: (_) {
                        return CircularPercentIndicator(
                          radius: 55,
                          lineWidth: 7,
                          percent: controller.percentage,
                          backgroundColor: Colors.white24,
                          animation: true,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                (controller.user.value.data?.data_used
                                            .dataFomart() ??
                                        '0 MB') +
                                    '/',
                                style: Get.textTheme.titleLarge?.copyWith(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                controller.user.value.data?.data_cap
                                        .dataFomart() ??
                                    '0 MB',
                                style: Get.textTheme.titleLarge?.copyWith(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          progressColor: Colors.white,
                          circularStrokeCap: CircularStrokeCap.round,
                        );
                      },
                    ),
                  ),
                  if (!kIsWebMobile) Gap(10),
                  // Missalignment on Web
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: kIsWebMobile
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.center,
                        children: [
                          (controller.user.value.to_date != null)
                              ? GetX<HomePageController>(
                                  builder: (_) {
                                    return Text(
                                      'Valid till ${controller.user.value.data?.to_date?.yMMMdFomart}',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    );
                                  },
                                )
                              : Text(''),
                          ElevatedButton(
                            child: Text(
                              'Buy Data',
                              style: Get.textTheme.titleSmall
                                  ?.apply(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.buyData);
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          // AppMaterial(
          //   margin: EdgeInsets.all(20),
          //   padding: EdgeInsets.all(20),
          //   color: AppColors.primary.shade50,
          //   child: ReadMoreText(
          //     message,
          //     trimLines: 2,
          //     colorClickableText: AppColors.primary,
          //     trimMode: TrimMode.Line,
          //     style: Get.textTheme.labelMedium,
          //     trimCollapsedText: 'Show more',
          //     trimExpandedText: 'Show less',
          //     moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          //   ),
          // ),
          AppMaterial(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wallet Balance',
                  style: Get.textTheme.labelMedium,
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetX<HomePageController>(
                      builder: (_) {
                        return MoneyText(
                          controller.user.value.balance,
                          style: Get.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                    OutlinedButton(
                      child: Text(
                        'Fund Wallet',
                        style: Get.textTheme.titleSmall
                            ?.apply(color: AppColors.primary),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(0, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.fundWallet);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildActionButton({
    required String text,
    required VoidCallback onPressed,
    required Widget icon,
  }) {
    return Column(
      children: [
        FloatingActionButton.small(
            onPressed: onPressed,
            elevation: 3,
            shape: CircleBorder(),
            child: icon),
        Text(
          text,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
