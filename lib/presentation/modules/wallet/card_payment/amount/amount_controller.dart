import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../fund_wallet/fund_wallet_screen.dart';
import 'amount_screen.dart';

class AmountController extends GetxController {
  final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter(
    NumberFormat.currency(
      locale: 'en_NG',
      symbol: '',
      decimalDigits: 0,
      // customPattern: customPattern,
    ),
  );

  void onProceedPressed() async {
    // Get.toNamed(Routes.cards, arguments: amount.value);
    final result = await Get.bottomSheet(CardSelectionBottomSheet());
  }
}
