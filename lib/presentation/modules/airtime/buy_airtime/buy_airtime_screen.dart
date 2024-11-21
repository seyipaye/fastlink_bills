import 'package:fastlink_app/core/app_routes.dart';
import 'package:fastlink_app/core/extentions.dart';
import 'package:fastlink_app/presentation/modules/data/buy_data/buy_data_controller.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/widgets/indicators.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../resources/assets.gen.dart';
import '../../../utils/colors.dart';
import '../../../utils/validators.dart';
import '../../../widgets/app_card.dart';
import '../../../widgets/app_text_form_field.dart';
import '../../../widgets/app_buttons.dart';
import '../../../widgets/money_text_view.dart';
import '../../../widgets/quick_link.dart';
import 'buy_airtime_controller.dart';

const limited_time_offer = true;

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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              
              NetworkSelector(),
              gap8,
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
                prefixIcon: Container(
                  width: 5,
                  alignment: Alignment.center,
                  child: Text('₦').applyStyle(
                    fontSize: 16,
                    bold: true,
                  ),
                ),
                // onSaved: (val) => controller.email = val!.trim(),
                // validator: Validator.isNotEmpty,
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
    );
  }
}


//A widget for selecting network.
 class NetworkSelector extends StatelessWidget {
  const NetworkSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 70,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Row(
                        children: [
                          Assets.images.mtnLogo.image(width: 32, height: 32),
                          // Icon(
                          //   Icons.import_contacts,
                          // ),
                          gap8,
                          Assets.icons.downIcon.svg(),
                        ],
                      ),
                    ),
                    gap8,
                    Expanded(
                      child: AppTextFormField(
                        // textEditingController: controller.emailText,
                        // label: 'Email Address',
                        autofillHints: [AutofillHints.telephoneNumber],
                        hintText: 'Enter Phone Number',
                        // onSaved: (val) => controller.email = val!.trim(),
                        // validator: Validator.isNotEmpty,
                      ),
                    ),
                  ],
                ),
              );
  }
} 