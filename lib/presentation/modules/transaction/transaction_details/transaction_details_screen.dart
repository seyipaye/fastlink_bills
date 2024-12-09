import 'package:fastlink_app/presentation/modules/transaction/transaction_details/transaction_details_controller.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TransactionDetailsScreen extends GetView<TransactionDetailsController> {
  const TransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Transaction Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(20),
                Center(child: Assets.images.phone.image()),
                Gap(10),
                Text('Airtime Purchase Successful',
                    style: AppText.fBTextBlackBold),
                Gap(30),
                TransactionDetailsWidget(
                  amount: '#100.00',
                  adPointUsed: '-50Pts',
                  amountPaid: '#50.00',
                  receiptMobile: '08097654321',
                  transactionType: 'Airtime',
                  paymentMethod: 'Wallet',
                  transactionNumber: '1234567890',
                  transactionDate: 'Dec 8th, 2024, 11:30 AM',
                  dataBundle: '2GB for 1 Month',
                  senderDetails: 'John Doe, 08012345678',
                ),
                Gap(40),
                SizedBox(
                    height: 50,
                    child: FBButton.outline(
                      color: FBColors.orangeColor,
                      textColor: FBColors.orangeColor,
                      title: 'View Reciept',
                      onTap: () {},
                    )),
                Gap(15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//// Created a widget to contain all property
/// I made some optional and required as per the information
/// we are to receive from the backend.
/// I dont know if this is a good approach.

class TransactionDetailsWidget extends StatelessWidget {
  final String amount;
  final String? adPointUsed;
  final String amountPaid;
  final String receiptMobile;
  final String transactionType;
  final String paymentMethod;
  final String transactionDate;
  final String? dataBundle;
  final String senderDetails;
  final String? transactionNumber;

  const TransactionDetailsWidget({
    Key? key,
    required this.amount,
    this.adPointUsed,
    required this.amountPaid,
    required this.receiptMobile,
    required this.transactionType,
    required this.paymentMethod,
    required this.transactionDate,
    this.dataBundle,
    required this.senderDetails,
    this.transactionNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Amount', amount),
        Gap(5),
        if (adPointUsed != null)
          _buildDetailRow('Ad Points Used', adPointUsed!),
        Gap(5),
        _buildDetailRow('Amount Paid', amountPaid),
        Gap(60),
        _buildDetailRow('Receipt Mode', receiptMobile),
        Gap(5),
        _buildDetailRow('Transaction Type', transactionType),
        Gap(5),
        _buildDetailRow('Payment Method', paymentMethod),
        Gap(5),
        _buildDetailRow('Transaction Number', transactionNumber!),
        Gap(5),
        _buildDetailRow('Transaction Date', transactionDate),
        Gap(5),
        if (dataBundle != null) _buildDetailRow('Data Bundle', dataBundle!),
        _buildDetailRow('Sender Details', senderDetails),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppText.fBTextBlackSmall),
          Text(
            value,
            style: AppText.fBTextBlackBoldMedium,
          ),
        ],
      ),
    );
  }
}
