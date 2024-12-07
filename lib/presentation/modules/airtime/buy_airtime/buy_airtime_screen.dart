
import 'package:fastlink_app/core/extentions.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/app_card.dart';
import '../../../widgets/app_text_form_field.dart';
import '../../../widgets/app_buttons.dart';
import '../../../widgets/phone_number/Phone_number_wrapper.dart';
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
                AppTextFormField(
                  // textEditingController: controller.emailText,
                  // label: 'Email Address',
                  autofillHints: [AutofillHints.telephoneNumber],
                  hintText: '50-100,000',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  prefixIcon: kNairaIcon,
                ),
                gap24,
                AppElevatedButton(
                  text: 'Continue',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
